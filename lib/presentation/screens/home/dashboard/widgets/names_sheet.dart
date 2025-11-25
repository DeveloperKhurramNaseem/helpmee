import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/home/update_name/update_name_bloc.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';
import 'package:provider/provider.dart';

class NamesSheet extends StatefulWidget {
  const NamesSheet({super.key});

  @override
  State<NamesSheet> createState() => _NamesSheetState();
}

class _NamesSheetState extends State<NamesSheet> {
  bool enabled = false;

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void listener() {
    setState(() {
      enabled =
          firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateNameBloc, UpdateNameState>(
      listener: _handleUpdateNameBlocListener,
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
                    AppLocalizations.of(context)!.enterNamePrompt,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                decoration: InputDecoration(
                  border: TextFieldsConstants.border,
                  labelText: AppLocalizations.of(context)!.firstNameLabel,
                  helperText: '',
                  focusedBorder: TextFieldsConstants.border,
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),
                cursorColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                decoration: InputDecoration(
                  border: TextFieldsConstants.border,
                  labelText: AppLocalizations.of(context)!.lastNameLabel,
                  helperText: '',
                  focusedBorder: TextFieldsConstants.border,
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),
                cursorColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: BlocBuilder<UpdateNameBloc, UpdateNameState>(
                builder: (context, state) {
                  return AppButton(
                    onPressed: state is UpdateNameLoadingState
                        ? null
                        : enabled
                        ? () {
                            context.read<UpdateNameBloc>().add(
                              UpdateNameInitEvent(
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                              ),
                            );
                          }
                        : null,
                    gradient: Theme.of(
                      context,
                    ).extension<AppGradients>()?.primaryButton,
                    child: state is UpdateNameLoadingState ? CupertinoActivityIndicator(color: Colors.white) : Text(AppLocalizations.of(context)!.next),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleUpdateNameBlocListener(
    BuildContext context,
    UpdateNameState state,
  ) {
    if (state is UpdateNameDoneState) {
      Navigator.pop(context);
    }
  }
}
