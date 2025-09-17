import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/onboarding/scan_qr_code_screen/widgets/sq_app_bar.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({super.key});

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  late MobileScannerController controller;
  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = AppSize.instance.width;
    final height = AppSize.instance.height;
    return Scaffold(
      appBar: SqAppBar(
        onTorchTap: () {
          controller.toggleTorch();
          setState(() {});
        },
      ),
      body: Center(
        child: MobileScanner(
          controller: controller,
          scanWindow: Rect.fromCenter(
            center: Offset(width / 2, height / 2),
            width: width * 0.6,
            height: width * 0.6,
          ),
          overlayBuilder: (context, constraints) {
            return Container(
              width: width * 0.6,
              height: width * 0.6,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            );
          },
          onDetect: (barcodes) {
            log(barcodes.barcodes.first.rawValue.toString(), name: 'barcodes');
          },
        ),
      ),
    );
  }
}
