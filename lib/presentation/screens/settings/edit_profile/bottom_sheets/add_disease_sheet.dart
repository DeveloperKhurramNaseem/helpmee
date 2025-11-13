import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/add_address/add_address_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/get_profile_data/get_profile_data_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/medical_information/add_disease/add_disease_bloc.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class AddDiseaseSheet extends StatefulWidget {
  final String title;
  final String description;
  final bool hasCheck;
  final int id;
  final DiseaseDetails? diseaseDetails;
  const AddDiseaseSheet({
    super.key,
    required this.title,
    required this.description,
    this.hasCheck = false,
    required this.id,
    this.diseaseDetails,
  });

  @override
  State<AddDiseaseSheet> createState() => _AddDiseaseSheetState();
}

class _AddDiseaseSheetState extends State<AddDiseaseSheet> {
  late TextEditingController detailsController;
  bool isChecked = false;
  bool hasConsent = false;

  bool get enabled =>
      hasConsent && (detailsController.text.isNotEmpty || isChecked);

  @override
  void initState() {
    super.initState();
    detailsController = TextEditingController()
      ..addListener(() => setState(() {}));
    if (widget.diseaseDetails != null) {
      isChecked = widget.diseaseDetails!.isCheck == "true";
      detailsController.text = widget.diseaseDetails!.details;
    }
  }

  @override
  void dispose() {
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddDiseaseBloc, AddDiseaseState>(
      listener: _handleAddDiseaseListener,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
                child: Row(
                  mainAxisAlignment: widget.hasCheck
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    if (widget.hasCheck)
                      StatefulBuilder(
                        builder: (context, setLocalState) {
                          return Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setLocalState(() {
                                isChecked = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(width: 0.2),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            fillColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.contains(WidgetState.selected)) {
                                return Theme.of(context).colorScheme.primary;
                              }
                              return Colors.transparent;
                            }),
                            checkColor: Colors.white,
                            overlayColor: WidgetStatePropertyAll(Colors.white),
                          );
                        },
                      ),
                    Expanded(
                      child: Align(
                        alignment: widget.hasCheck
                            ? Alignment.centerLeft
                            : Alignment.center,
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppLightThemeColors.secondaryTextColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppLightThemeColors.textfieldBorderColor,
                    ),
                    color: AppLightThemeColors.textfieldColor,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: TextFormField(
                    controller: detailsController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppLocalizations.of(context)!.writeDetailsHere,
                      hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                    ),
                  ),
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
                      value: hasConsent,
                      onChanged: (value) {
                        setState(() {
                          hasConsent = value!;
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
                        AppLocalizations.of(context)!.diseaseInformationConsent,
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
                child: BlocBuilder<AddAddressBloc, AddAddressState>(
                  builder: (context, state) {
                    return Opacity(
                      opacity: enabled ? 1 : 0.7,
                      child: AppButton(
                        onPressed: state is AddDiseaseLoadingState
                            ? null
                            : enabled
                            ? () {
                                context.read<AddDiseaseBloc>().add(
                                  AddNewDiseaseEvent(
                                    diseaseName: widget.title,
                                    medications: '',
                                    details: detailsController.text.trim(),
                                    isCheck: isChecked,
                                  ),
                                );
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            : null,
                        gradient: Theme.of(
                          context,
                        ).extension<AppGradients>()!.primaryButton,
                        child: state is AddDiseaseLoadingState
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
      ),
    );
  }

  void _handleAddDiseaseListener(BuildContext context, AddDiseaseState state) {
    if (state is AddDiseaseDoneState) {
      context.read<GetProfileDataBloc>().add(
        GetUserProfileDataEvent(showLoading: false),
      );
      Navigator.of(context, rootNavigator: true)
        ..pop()
        ..pop();
    }
  }
}
