import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/presentation/blocs/onboarding/activate_product/activate_product_bloc.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/am_app_bar.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/am_cards.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/am_support_text.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/congratulations_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';

class ActivationMethodScreen extends StatefulWidget {
  static const path = '/activation-method-screen';
  const ActivationMethodScreen({super.key});

  @override
  State<ActivationMethodScreen> createState() => _ActivationMethodScreenState();
}

class _ActivationMethodScreenState extends State<ActivationMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ActivateProductBloc, ActivateProductState>(
      listener: _handleActivateProductBloc,
      child: Scaffold(
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
      ),
    );
  }

  void _handleActivateProductBloc(
    BuildContext context,
    ActivateProductState state,
  ) {
    if (state is ActivateProductDoneState) {
      context.pop();
      showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,        
        builder: (context) {
          return PopScope(canPop: false,child: CongratulationsSheet());
        },
      );
    } else if (state is ActivateProductErrorState) {
      context.pop();
      showDialog(
        context: context,        
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(state.message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
