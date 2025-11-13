import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/demo_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/hidden_features/transfer_data/transfer_data_bloc.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/images.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class DemoProfileConfirmSheet extends StatelessWidget {
  final DemoProfileModel demoProfileModel;
  const DemoProfileConfirmSheet({super.key, required this.demoProfileModel});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransferDataBloc, TransferDataState>(
      listener: _handleTransferDataListener,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.confirmDemoTitle,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Spacer(flex: 35),
                Expanded(flex: 30, child: Image.asset(AppImages.warningImage)),
                Spacer(flex: 35),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12,
              ),
              child: Text(
                AppLocalizations.of(context)!.confirmDemoLabelText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.42),
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24,
              ),
              child: BlocBuilder<TransferDataBloc, TransferDataState>(
                builder: (context, state) {
                  return AppButton(
                    onPressed: state is TransferDataLoadingState
                        ? null
                        : () {
                            context.read<TransferDataBloc>().add(
                              TransferDataEvent(
                                userName: demoProfileModel.userName,
                              ),
                            );
                          },
                    gradient: Theme.of(
                      context,
                    ).extension<AppGradients>()?.primaryButton,
                    child: state is TransferDataLoadingState
                        ? CupertinoActivityIndicator(color: Colors.white)
                        : Text(
                            AppLocalizations.of(context)!.confirmText,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12,
              ),
              child: AppButtonNoBorder(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppLocalizations.of(context)!.cancelText,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTransferDataListener(
    BuildContext context,
    TransferDataState state,
  ) {
    if (state is TransferDataLoadedState) {
      Navigator.of(context).pop();
    }
  }
}
