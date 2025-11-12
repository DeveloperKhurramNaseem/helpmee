import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/add_family_contact/add_family_contact_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/delete_contact/delete_contact_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/update_contact/update_contact_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/get_profile_data/get_profile_data_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/widgets/ep_header_info_fields.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/text_fields_constants.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

enum ContactType { family, doctor }

class CreateNewContactSheet extends StatefulWidget {
  final Contact? contact;
  final ContactType contactType;
  const CreateNewContactSheet({
    super.key,
    this.contact,
    required this.contactType,
  });

  @override
  State<CreateNewContactSheet> createState() => _CreateNewContactSheetState();
}

class _CreateNewContactSheetState extends State<CreateNewContactSheet> {
  late TextEditingController nameController,
      numberController,
      whatsappController;

  bool isChecked = false;
  String currentCountryCodeNumber = '+49';
  String currentCountryCodeWhatsapp = '+49';
  String initialCountryCodeNumber = '+49';
  String initialCountryCodeWhatsapp = '+49';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController()..addListener(fieldListener);
    numberController = TextEditingController()..addListener(fieldListener);
    whatsappController = TextEditingController();
    if (widget.contact != null) {
      nameController.text = widget.contact!.name;
      if (widget.contact!.phoneNo.isNotEmpty) {
        var numberSeparated = TextFieldsConstants.separateCodeAndNumber(
          widget.contact!.phoneNo,
        );
        log(
          'Number code : ${numberSeparated.code} , number : ${numberSeparated.number}',
        );
        numberController.text = numberSeparated.number;
        initialCountryCodeNumber = numberSeparated.code;
        currentCountryCodeNumber = numberSeparated.code;
      }
      if (widget.contact!.whatsappNo.isNotEmpty) {
        var whatsappSeparated = TextFieldsConstants.separateCodeAndNumber(
          widget.contact!.whatsappNo,
        );
        log(
          'Whatsapp code : ${whatsappSeparated.code} , number : ${whatsappSeparated.number}',
        );
        whatsappController.text = whatsappSeparated.number;
        initialCountryCodeWhatsapp = whatsappSeparated.code;
        currentCountryCodeNumber = whatsappSeparated.code;
      }

      isChecked = true;
    }
  }

  void fieldListener() {
    setState(() {});
  }

  @override
  void dispose() {
    numberController.dispose();
    whatsappController.dispose();
    nameController.dispose();
    super.dispose();
  }

  bool get isEnabled =>
      nameController.text.isNotEmpty &&
      numberController.text.isNotEmpty &&
      isChecked;

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return MultiBlocListener(
      listeners: [
        BlocListener<AddFamilyContactBloc, AddFamilyContactState>(
          listener: _handleAddFamilyContactListener,
        ),
        BlocListener<UpdateContactBloc, UpdateContactState>(
          listener: _handleUpdateFamilyContactListener,
        ),
        BlocListener<DeleteContactBloc, DeleteContactState>(
          listener: _handleDeleteContactListener,
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  localization.createNewContact,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localization.createNewContactDetail,
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
                label: localization.contactNameLabel,
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 10),
              child: EpHeaderInfoBasePhoneNoField(
                initialCode: initialCountryCodeNumber,
                label: localization.phoneNumberLabel,
                controller: numberController,
                onChanged: (countryCode) {
                  currentCountryCodeNumber = countryCode.dialCode ?? '+49';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 10),
              child: EpHeaderInfoBasePhoneNoField(
                initialCode: initialCountryCodeWhatsapp,
                label: localization.whatsappNumberLabel,
                controller: whatsappController,
                onChanged: (countryCode) {
                  currentCountryCodeWhatsapp = countryCode.dialCode ?? '+49';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
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
                      localization.contactConsentVerification,
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
            if (widget.contact != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Opacity(
                        opacity: !isEnabled ? 0.7 : 1,
                        child: BlocBuilder<UpdateContactBloc, UpdateContactState>(
                          builder: (context, state) {
                            return AppButton(
                              onPressed: () {
                                log(
                                  'Current code number : $currentCountryCodeNumber',
                                );
                                log(
                                  'Current code whatsapp : $currentCountryCodeWhatsapp',
                                );
                                FocusManager.instance.primaryFocus?.unfocus();
                                context.read<UpdateContactBloc>().add(
                                  UpdateCurrentContactEvent(
                                    contactId: widget.contact!.id,
                                    name: nameController.text.trim(),
                                    phoneNumber:
                                        '$currentCountryCodeNumber${numberController.text.trim()}',
                                    whatsappNumber:
                                        whatsappController.text.isNotEmpty
                                        ? '$currentCountryCodeWhatsapp${whatsappController.text.trim()}'
                                        : null,
                                  ),
                                );
                              },
                              gradient: Theme.of(
                                context,
                              ).extension<AppGradients>()!.primaryButton,
                              child: state is UpdateContactLoadingState
                                  ? CupertinoActivityIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      AppLocalizations.of(context)!.update,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<DeleteContactBloc, DeleteContactState>(
                        builder: (context, state) {
                          return Opacity(
                            opacity: 1,
                            child: AppButtonOutlined(
                              onPressed: () {
                                context.read<DeleteContactBloc>().add(
                                  DeleteCurrentContact(
                                    contactId: widget.contact!.id,
                                  ),
                                );
                              },
                              child: state is DeleteContactLoadingState
                                  ? CupertinoActivityIndicator(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                    )
                                  : Text(
                                      'Delete',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            else
              BlocBuilder<AddFamilyContactBloc, AddFamilyContactState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 33.0),
                    child: Opacity(
                      opacity: !isEnabled ? 0.7 : 1,
                      child: AppButton(
                        onPressed: !isEnabled
                            ? null
                            : state is AddFamilyContactLoadingState
                            ? null
                            : () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                context.read<AddFamilyContactBloc>().add(
                                  AddNewFamilyContactEvent(
                                    name: nameController.text.trim(),
                                    contactType: widget.contactType,
                                    phoneNumber:
                                        '$currentCountryCodeNumber${numberController.text.trim()}',
                                    whatsappNumber:
                                        whatsappController.text.isNotEmpty
                                        ? '$currentCountryCodeWhatsapp${whatsappController.text.trim()}'
                                        : null,
                                  ),
                                );
                              },
                        gradient: Theme.of(
                          context,
                        ).extension<AppGradients>()!.primaryButton,
                        child: state is AddFamilyContactLoadingState
                            ? CupertinoActivityIndicator(color: Colors.white)
                            : Text(
                                AppLocalizations.of(context)!.saveButton,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  void _handleAddFamilyContactListener(
    BuildContext context,
    AddFamilyContactState state,
  ) {
    if (state is AddFamilyContactLoadedState) {
      context.read<GetProfileDataBloc>().add(
        GetUserProfileDataEvent(showLoading: false),
      );
      Navigator.of(context).pop();
    }
  }

  void _handleDeleteContactListener(
    BuildContext context,
    DeleteContactState state,
  ) {
    if (state is DeleteContactLoadedState) {
      context.read<GetProfileDataBloc>().add(
        GetUserProfileDataEvent(showLoading: false),
      );
      Navigator.of(context).pop();
    }
  }

  void _handleUpdateFamilyContactListener(
    BuildContext context,
    UpdateContactState state,
  ) {
    if (state is UpdateContactLoadedState) {
      context.read<GetProfileDataBloc>().add(
        GetUserProfileDataEvent(showLoading: false),
      );
      Navigator.of(context).pop();
    }
  }
}
