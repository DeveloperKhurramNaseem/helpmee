import 'dart:convert' show ascii, utf8;
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/onboarding/activate_product/activate_product_bloc.dart';
import 'package:help_mee/presentation/screens/onboarding/scan_qr_code_screen/scan_qr_code_screen.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/images.dart';
import 'package:nfc_manager/ndef_record.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager_ndef/nfc_manager_ndef.dart';

class AmCard extends StatelessWidget {
  final String title, description, imagePath;
  final bool isSelected;
  const AmCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.instance.height * 0.24,
      width: AppSize.instance.width,
      margin: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(imagePath),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(description),
            ],
          ),
        ],
      ),
    );
  }
}

class AmNfcScanCard extends StatefulWidget {
  const AmNfcScanCard({super.key});

  @override
  State<AmNfcScanCard> createState() => _AmNfcScanCardState();
}

class _AmNfcScanCardState extends State<AmNfcScanCard> {

  @override
  void dispose() {
    NfcManager.instance.stopSession();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ActivateProductBloc>();
    return GestureDetector(
      onTap: () async {
        final available = await NfcManager.instance.isAvailable();
        if (!available) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('NFC not available on this device')),
          );
          return;
        }
        try {
          // await NfcManager.instance.stopSession();
          NfcManager.instance.startSession(
            pollingOptions: {
              NfcPollingOption.iso14443,
              NfcPollingOption.iso15693,
            },
            onDiscovered: (NfcTag tag) async {              
              try {
                final ndef = Ndef.from(tag);
                if (ndef == null) {
                  await NfcManager.instance.stopSession(
                    errorMessageIos: 'This tag does not contain NDEF.',
                  );
                  return;
                }
                final message = await ndef.read();
                final strings = message!.records
                    .map(ndefRecordToString)
                    .whereType<String>()
                    .toList();
                if (strings.isNotEmpty) {
                  var link = strings.first;
                  var parts = link.split('/');
                  if (parts.isNotEmpty) {
                    var code = parts.last;
                    var device = parts[parts.length - 2];
                    bloc.add(
                      ActivateNewProductEvent(code: code, device: device),
                    );
                  }
                }                
              } catch (e) {
                await NfcManager.instance.stopSession(errorMessageIos: '$e');
              }
            },
            alertMessageIos: 'Hold your iPhone near the NFC tag.',
          );
        } catch (e) {
          // If capabilities or plist are missing, we’ll see it here
          log('startSession failed: $e');
        }
      },
      child: AmCard(
        title: 'NFC',
        description: AppLocalizations.of(context)!.tapToActivateNfc,
        imagePath: AppImages.nfcScannerImage,
        isSelected: true,
      ),
    );
  }
}

class AmQRScanCard extends StatelessWidget {
  const AmQRScanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => ScanQrCodeScreen()));
        // context.read<ActivateProductBloc>().add(ActivateNewProductEvent(code: '79FAD9', device: 's'));
      },
      child: AmCard(
        title: AppLocalizations.of(context)!.qrCodeLabel,
        description: AppLocalizations.of(context)!.scanQrCode,
        imagePath: AppImages.qrCodeScanner,
        isSelected: false,
      ),
    );
  }
}

String? ndefRecordToString(NdefRecord r) {
  switch (r.typeNameFormat) {
    case TypeNameFormat.wellKnown:
      final t = ascii.decode(r.type, allowInvalid: true);
      if (t == 'T') return _decodeTextRecord(r.payload);
      if (t == 'U') return _decodeUriRecord(r.payload);
      // Other well-known types -> show hex/base64
      return _bytesToHex(r.payload);

    case TypeNameFormat.absoluteUri:
      return utf8.decode(r.payload, allowMalformed: true);

    case TypeNameFormat.empty:
      return '';

    default:
      // external/unknown -> hex as fallback
      return _bytesToHex(r.payload);
  }
}

String _decodeTextRecord(Uint8List payload) {
  if (payload.isEmpty) return '';
  final status = payload[0];
  final isUtf16 = (status & 0x80) != 0;
  final langLen = status & 0x3F;
  final textBytes = payload.sublist(1 + langLen);

  if (!isUtf16) return utf8.decode(textBytes, allowMalformed: true);
  // UTF-16BE per NFC spec:
  final bd = ByteData.sublistView(textBytes);
  final units = List<int>.generate(
    textBytes.length ~/ 2,
    (i) => bd.getUint16(i * 2, Endian.big),
  );
  return String.fromCharCodes(units);
}

String _decodeUriRecord(Uint8List payload) {
  if (payload.isEmpty) return '';
  const prefixMap = <int, String>{
    0x00: '',
    0x01: 'http://www.',
    0x02: 'https://www.',
    0x03: 'http://',
    0x04: 'https://',
    0x05: 'tel:',
    0x06: 'mailto:',
    0x07: 'ftp://anonymous:anonymous@',
    0x08: 'ftp://ftp.',
    0x09: 'ftps://',
    0x0A: 'sftp://',
    0x0B: 'smb://',
    0x0C: 'nfs://',
    0x0D: 'ftp://',
    0x0E: 'dav://',
    0x0F: 'news:',
    0x10: 'telnet://',
    0x11: 'imap:',
    0x12: 'rtsp://',
    0x13: 'urn:',
    0x14: 'pop:',
    0x15: 'sip:',
    0x16: 'sips:',
    0x17: 'tftp:',
    0x18: 'btspp://',
    0x19: 'btl2cap://',
    0x1A: 'btgoep://',
    0x1B: 'tcpobex://',
    0x1C: 'irdaobex://',
    0x1D: 'file://',
    0x1E: 'urn:epc:id:',
    0x1F: 'urn:epc:tag:',
    0x20: 'urn:epc:pat:',
    0x21: 'urn:epc:raw:',
    0x22: 'urn:epc:',
    0x23: 'urn:nfc:',
  };
  final prefix = prefixMap[payload[0]] ?? '';
  final rest = utf8.decode(payload.sublist(1), allowMalformed: true);
  return '$prefix$rest';
}

String _bytesToHex(Uint8List bytes) =>
    bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
