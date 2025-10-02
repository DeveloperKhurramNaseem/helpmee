import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/auth/verifyotp/verify_otp_bloc.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_arrow_back.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_field_and_button.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_text.dart';
import 'package:help_mee/presentation/screens/onboarding/product_map_bottom_sheet/product_map_bottom_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';

class EnterCodeScreen extends StatefulWidget {
  final String email;
  const EnterCodeScreen({super.key, required this.email});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
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
                  SizedBox(height: AppSize.instance.height * 0.05),
                  EcFieldAndButton(email: widget.email),
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
        builder: (context) {
          return ProductMapBottomSheet();
        },
      );
    }
  }
}
