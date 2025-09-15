import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/am_app_bar.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/am_cards.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/am_support_text.dart';
import 'package:help_mee/util/constants/app_size.dart';

class ActivationMethodScreen extends StatefulWidget {
  const ActivationMethodScreen({super.key});

  @override
  State<ActivationMethodScreen> createState() => _ActivationMethodScreenState();
}

class _ActivationMethodScreenState extends State<ActivationMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AmAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            spacing: AppSize.instance.height * 0.03,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.instance.height * 0.07),
              AmNfcScanCard(),
              AmQRScanCard(),
              AmSupportText(),
            ],
          ),
        ),
      ),
    );
  }
}
