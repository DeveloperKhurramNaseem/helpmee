import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_arrow_back.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_button.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_fields.dart';
import 'package:help_mee/presentation/screens/auth/create_password_screen/widgets/cp_text.dart';
import 'package:help_mee/util/constants/app_size.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                CpArrowBack(),
                SizedBox(height: AppSize.instance.height * 0.05),
                CpText(),
                SizedBox(height: AppSize.instance.height * 0.05),
                CpFields(),
                SizedBox(height: AppSize.instance.height * 0.01),
                CpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
