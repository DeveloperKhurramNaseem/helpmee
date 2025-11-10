import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/location_notification_settings/add_notification_user/add_notification_user_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';
import 'package:provider/provider.dart';

class AddNewPersonSheet extends StatefulWidget {
  const AddNewPersonSheet({super.key});

  @override
  State<AddNewPersonSheet> createState() => _AddNewPersonSheetState();
}

class _AddNewPersonSheetState extends State<AddNewPersonSheet> {
  bool enabled = false, isChecked = false;
  late TextEditingController nameController, emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  addListener() {
    setState(() {
      enabled =
          nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          isChecked;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNotificationUserBloc, AddNotificationUserState>(
      listener: _handleAddNotificationUserListener,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add new person',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add the details below of the person to be notified.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppLightThemeColors.secondaryTextColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 10),
              child: EpHeaderInfoBaseField(
                label: 'Name',
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 10),
              child: EpHeaderInfoBaseField(
                label: 'Email',
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      isChecked = value!;
                      addListener();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(width: 0.2),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fillColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Theme.of(context).colorScheme.primary;
                      }
                      return Colors.transparent;
                    }),
                    checkColor: Colors.white,
                    overlayColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      'I have received the consent of this person to use the contact details for the purpose of location notification.',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33.0),
              child:
                  BlocBuilder<
                    AddNotificationUserBloc,
                    AddNotificationUserState
                  >(
                    builder: (context, state) {
                      return Opacity(
                        opacity: enabled ? 1 : 0.7,
                        child: AppButton(
                          onPressed: state is AddNotificationUserLoadingState
                              ? null
                              : enabled
                              ? () {
                                  context.read<AddNotificationUserBloc>().add(
                                    AddNewNotificationUserEvent(
                                      name: nameController.text.trim(),
                                      email: emailController.text.trim(),
                                    ),
                                  );
                                }
                              : null,
                          gradient: Theme.of(
                            context,
                          ).extension<AppGradients>()!.primaryButton,
                          child: state is AddNotificationUserLoadingState
                              ? CupertinoActivityIndicator(color: Colors.white)
                              : Text(
                                  AppLocalizations.of(context)!.saveButton,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleAddNotificationUserListener(
    BuildContext context,
    AddNotificationUserState state,
  ) {
    if (state is AddNotificationUserLoadedState) {
      Navigator.of(context).pop();
    }
  }
}
