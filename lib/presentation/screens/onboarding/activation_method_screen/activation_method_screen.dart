import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/presentation/blocs/hidden_features/restore_product_bloc/restore_product_bloc.dart';
import 'package:help_mee/presentation/blocs/onboarding/activate_product/activate_product_bloc.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/am_app_bar.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/am_cards.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/am_support_text.dart';
import 'package:help_mee/presentation/screens/onboarding/activation_method_screen/widgets/congratulations_sheet.dart';
import 'package:help_mee/presentation/screens/settings/hidden_settings/product_restore/product_reset_success.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;

enum ActivationMethodState {
  activateFirstProduct,
  activateNewProduct,
  restoreProduct,
}

class ActivationMethodScreen extends StatefulWidget {
  static const path = '/activation-method-screen';
  final String token;
  final ActivationMethodState activationMethodState;
  const ActivationMethodScreen({
    super.key,
    required this.token,
    required this.activationMethodState,
  });

  @override
  State<ActivationMethodScreen> createState() => _ActivationMethodScreenState();
}

class _ActivationMethodScreenState extends State<ActivationMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ActivateProductBloc, ActivateProductState>(
          listener: _handleActivateProductBloc,
        ),
        BlocListener<RestoreProductBloc, RestoreProductState>(
          listener: _handleRestoreProductBloc,
        ),
      ],
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
                AmNfcScanCard(
                  token: widget.token,
                  activationMethodState: widget.activationMethodState,
                ),
                AmQRScanCard(
                  token: widget.token,
                  activationMethodState: widget.activationMethodState,
                ),
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
      m.showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return PopScope(canPop: false, child: CongratulationsSheet());
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
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }

  void _handleRestoreProductBloc(
    BuildContext context,
    RestoreProductState state,
  ) {
    if (state is RestoreProductDoneState) {
      context.pop();
      m.showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return ProductResetSuccess();
        },
      );
    }
  }
}
