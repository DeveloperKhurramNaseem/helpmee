import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help_mee/presentation/blocs/hidden_features/restore_product_bloc/restore_product_bloc.dart';
import 'package:help_mee/presentation/blocs/onboarding/activate_product/activate_product_bloc.dart';
import 'package:help_mee/presentation/blocs/profiles_and_products/add_product/add_product_bloc.dart';
import 'package:help_mee/presentation/blocs/profiles_and_products/get_products/get_products_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/app_settings/make_child_with_existing_email/make_child_with_existing_email_bloc.dart';
import 'package:help_mee/presentation/screens/home/dashboard/dashboard.dart';
import 'package:help_mee/presentation/screens/home/dashboard/widgets/names_sheet.dart';
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
  makeChildWithExistingEmail,
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
        BlocListener<AddProductBloc, AddProductState>(
          listener: _handleAddProductBloc,
        ),
        BlocListener<RestoreProductBloc, RestoreProductState>(
          listener: _handleRestoreProductBloc,
        ),
        BlocListener<
          MakeChildWithExistingEmailBloc,
          MakeChildWithExistingEmailState
        >(listener: _handleMakeChildWithExistingEmailBloc),
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
          return PopScope(
            canPop: false,
            child: CongratulationsSheet(
              productType: state.device,
              onContiuePressed: () {
                context.go(Dashboard.path, extra: [true, true]);
              },
            ),
          );
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
    } else if (state is RestoreProductErrorState) {
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

  void _handleAddProductBloc(BuildContext context, AddProductState state) {
    if (state is AddProductDoneState) {
      context.pop();
      context.read<GetProductsBloc>().add(GetAllProductsEvent());
      m.showModalBottomSheet(
        isDismissible: true,
        enableDrag: false,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return CongratulationsSheet(
            productType: state.device,
            onContiuePressed: () {
              context.pop();
            },
          );
        },
      );
    } else if (state is AddProductErrorState) {
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

  void _handleMakeChildWithExistingEmailBloc(
    BuildContext context,
    MakeChildWithExistingEmailState state,
  ) {
    if (state is MakeChildWithExistingEmailDoneState) {
      context.pop();
      m.showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: CongratulationsSheet(
              productType: state.device,
              onContiuePressed: () {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pop();
                  m.showModalBottomSheet(
                    isDismissible: false,
                    enableDrag: false,
                    showDragHandle: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return PopScope(
                        canPop: false,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: NamesSheet(token: state.token, accountId: state.acccountId,),
                        ),
                      );
                    },
                  );
                });
                
              },
            ),
          );
        },
      );
    }
  }
}
