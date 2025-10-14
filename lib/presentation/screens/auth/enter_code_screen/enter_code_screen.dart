import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/verifyotp/verify_otp_bloc.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_arrow_back.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_error_text.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_field_and_button.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_text.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_timer_and_resend.dart';
import 'package:help_mee/presentation/screens/onboarding/product_map_bottom_sheet/product_map_bottom_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';

class EnterCodeScreen extends StatefulWidget {
  static const path = '/enter-code-screen';
  final String email;
  const EnterCodeScreen({super.key, required this.email});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  Timer? timer;
  Duration duration = Duration(minutes: 1);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.inSeconds != 0) {
        duration = duration - const Duration(seconds: 1);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<VerifyOtpBloc, VerifyOtpState>(
        listener: _verifyOtpListener,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 14.0,
              right: 14.0,
              top: MediaQuery.of(context).padding.top,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EcArrowBack(),
                  SizedBox(height: AppSize.instance.height * 0.05),
                  EcText(),
                  SizedBox(height: AppSize.instance.height * 0.02),
                  EcErrorText(),
                  SizedBox(height: AppSize.instance.height * 0.02),
                  EcFieldAndButton(email: widget.email),
                  SizedBox(height: AppSize.instance.height * 0.02),
                  EcTimerAndResend(duration: duration),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _verifyOtpListener(BuildContext context, VerifyOtpState state) {
    if (state is VerifyOtpDoneState) {
      showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        showDragHandle: true,
        builder: (context) {
          return PopScope(canPop: false, child: ProductMapBottomSheet());
        },
      );
    }
  }
}
