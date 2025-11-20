import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/hidden_features/restore_product_bloc/restore_product_bloc.dart';
import 'package:help_mee/presentation/blocs/onboarding/activate_product/activate_product_bloc.dart';
import 'package:help_mee/presentation/blocs/profiles_and_products/add_product/add_product_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/make_child_with_existing_email/make_child_with_existing_email_bloc.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/activation_method_screen.dart';
import 'package:help_mee/presentation/screens/onboarding/scan_qr_code_screen/widgets/sq_app_bar.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCodeScreen extends StatefulWidget {
  static const path = '/scan-qr-screen';
  final String token;
  final ActivationMethodState activationMethodState;
  const ScanQrCodeScreen({
    super.key,
    required this.token,
    required this.activationMethodState,
  });

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  late MobileScannerController controller;
  bool isScanned = false;
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
    var makeChildBloc = context.read<MakeChildWithExistingEmailBloc>();
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
            var link = barcodes.barcodes.first.rawValue.toString();
            if (link.trim().isNotEmpty) {
              var parts = link.split('/');
              if (parts.isNotEmpty) {
                var code = parts.last;
                var device = parts[parts.length - 2];
                if (isScanned) return;
                if (widget.activationMethodState ==
                    ActivationMethodState.activateFirstProduct) {
                  context.read<ActivateProductBloc>().add(
                    ActivateNewProductEvent(
                      code: code,
                      device: device,
                      token: widget.token,
                    ),
                  );
                } else if (widget.activationMethodState ==
                    ActivationMethodState.restoreProduct) {
                  context.read<RestoreProductBloc>().add(
                    RestoreThisProductEvent(code: code),
                  );
                } else if(widget.activationMethodState == ActivationMethodState.makeChildWithExistingEmail){
                  makeChildBloc.add(MakeChildWithExistingEmailEvent(code: code, device: device));
                }
                else{
                  context.read<AddProductBloc>().add(AddNewProductEvent(code: code, device: device));
                }
                isScanned = true;
              }
            }
          },
        ),
      ),
    );
  }
}
