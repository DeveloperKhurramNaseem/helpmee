import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/auth/verifyotp/verify_otp_bloc.dart';
import 'package:help_mee/presentation/screens/auth/enter_code_screen/widgets/ec_fields_row.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class EcFieldAndButton extends StatefulWidget {
  final String email;
  const EcFieldAndButton({super.key, required this.email});

  @override
  State<EcFieldAndButton> createState() => _EcFieldAndButtonState();
}

class _EcFieldAndButtonState extends State<EcFieldAndButton> {
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: EcFieldsRow(
            onUpdate: (value) {
              otp = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: AppSize.instance.width * 0.58,
            child: BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
              builder: (context, state) {                
                return AppButton(
                  onPressed: () {
                    if (otp.isNotEmpty && otp.length == 6) {
                      context.read<VerifyOtpBloc>().add(
                        VerifySignUpOtpEvent(otp, widget.email),
                      );
                    }
                  },
                  gradient: Theme.of(
                    context,
                  ).extension<AppGradients>()?.primaryButton,
                  child: Builder(
                    builder: (context) {
                      if(state is VerifyOtpLoadingState){
                        return CupertinoActivityIndicator(
                          color: Colors.white,
                          radius: 10,
                        );
                      }
                      return Text(
                        AppLocalizations.of(context)!.verifyButton,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                      );
                    }
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
