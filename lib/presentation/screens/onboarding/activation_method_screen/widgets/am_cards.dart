import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/screens/onboarding/scan_qr_code_screen/scan_qr_code_screen.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/images.dart';
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

class AmNfcScanCard extends StatelessWidget {
  const AmNfcScanCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          NfcManager.instance
              .startSession(
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
                    log('NDEF records: ${message!.records.length}');
                    for (final r in message.records) {
                      log(
                        'type=${r.typeNameFormat} id=${r.identifier} payloadLen=${r.payload.length}',
                      );
                    }

                    await NfcManager.instance.stopSession(
                      alertMessageIos: 'Tag read successfully.',
                    );
                  } catch (e) {
                    await NfcManager.instance.stopSession(
                      errorMessageIos: '$e',
                    );
                  }
                },
                alertMessageIos: 'Hold your iPhone near the NFC tag.',
              )
              .then((_) {
                NfcManager.instance.stopSession();
              });
        } catch (e) {
          // If capabilities or plist are missing, we’ll see it here
          log('startSession failed: $e');
        }
      },
      child: AmCard(
        title: 'NFC',
        description: 'Tap to activate via NFC',
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
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => ScanQrCodeScreen()));
      },
      child: AmCard(
        title: 'QR Code',
        description: 'Scan to activate via QR Code',
        imagePath: AppImages.qrCodeScanner,
        isSelected: false,
      ),
    );
  }
}
