import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/user_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/add_address/add_address_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/delete_address/delete_address_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/emergency_contacts/update_address/update_address_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/edit_profile/get_profile_data/get_profile_data_bloc.dart';
import 'package:help_mee/presentation/screens/settings/edit_profile/index.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class AddAddressSheet extends StatefulWidget {
  final Address? address;
  const AddAddressSheet({super.key, this.address});

  @override
  State<AddAddressSheet> createState() => _AddAddressSheetState();
}

class _AddAddressSheetState extends State<AddAddressSheet> {
  late TextEditingController nameController;
  late TextEditingController streetNameController;
  late TextEditingController houseNumberController;
  late TextEditingController zipController;
  late TextEditingController cityController;
  String currentCountry = 'Germany';
  bool enabled = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController()..addListener(listener);
    streetNameController = TextEditingController()..addListener(listener);
    houseNumberController = TextEditingController()..addListener(listener);
    zipController = TextEditingController()..addListener(listener);
    cityController = TextEditingController()..addListener(listener);
    if (widget.address != null) {
      nameController.text = widget.address!.name;
      streetNameController.text = widget.address!.streetName;
      houseNumberController.text = widget.address!.houseNumber;
      zipController.text = widget.address!.zip;
      cityController.text = widget.address!.city;
      currentCountry = widget.address!.country;
    }
  }

  void listener() {
    setState(() {
      enabled =
          nameController.text.isNotEmpty &&
          streetNameController.text.isNotEmpty &&
          houseNumberController.text.isNotEmpty &&
          cityController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    streetNameController.dispose();
    houseNumberController.dispose();
    zipController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return MultiBlocListener(
      listeners: [
        BlocListener<AddAddressBloc, AddAddressState>(
          listener: _handleAddAddressBlocListener,
        ),
        BlocListener<UpdateAddressBloc, UpdateAddressState>(
          listener: _handelUpdateAddressBlocListener,
        ),
        BlocListener<DeleteAddressBloc, DeleteAddressState>(
          listener: _handleDeleteAddressBlocListener,
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 12,
          right: 12,
        ),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
AppLocalizations.of(context)!.addAddress,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              EpHeaderInfoBaseField(label: localization.addressDescription, controller: nameController),
              EpHeaderInfoBaseField(
                label: localization.streetNameLabel,
                controller: streetNameController,
              ),
              EpHeaderInfoBaseField(
                label: localization.houseNumberLabel,
                controller: houseNumberController,
              ),
              EpHeaderInfoBaseField(
                label: localization.zipLabel,
                controller: zipController,
              ),
              EpHeaderInfoBaseField(
                label: localization.cityLabel,
                controller: cityController,
              ),
              EpHeaderInfoBaseDropDownStringField(
                label: localization.countryLabel,
                onChanged: (value) {
                  currentCountry = value!;
                },
                value: widget.address?.country ?? 'Germany',
                items: ['Germany', 'Pakistan'],
                trailing: Icon(Icons.keyboard_arrow_down_rounded),
              ),
              if (widget.address != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: BlocBuilder<AddAddressBloc, AddAddressState>(
                    builder: (context, state) {
                      return Row(
                        spacing: 20,
                        children: [
                          Expanded(
                            child:
                                BlocBuilder<
                                  UpdateAddressBloc,
                                  UpdateAddressState
                                >(
                                  builder: (context, state) {
                                    return AppButton(
                                      onPressed:
                                          state is UpdateAddressLoadingState
                                          ? null
                                          : () {
                                              context
                                                  .read<UpdateAddressBloc>()
                                                  .add(
                                                    UpdateCurrentAddressEvent(
                                                      addressId:
                                                          widget.address!.id,
                                                      description: widget
                                                          .address!
                                                          .description,
                                                      code:
                                                          widget.address!.code,
                                                      streetName:
                                                          streetNameController
                                                              .text
                                                              .trim(),
                                                      houseNumber:
                                                          houseNumberController
                                                              .text
                                                              .trim(),
                                                      city: cityController.text
                                                          .trim(),
                                                      country: currentCountry,
                                                      name: nameController.text
                                                          .trim(),
                                                      zip: zipController.text
                                                          .trim(),
                                                    ),
                                                  );
                                            },
                                      gradient: Theme.of(context)
                                          .extension<AppGradients>()!
                                          .primaryButton,
                                      child: state is UpdateAddressLoadingState
                                          ? CupertinoActivityIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              AppLocalizations.of(
                                                context,
                                              )!.saveButton,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                    );
                                  },
                                ),
                          ),
                          Expanded(
                            child:
                                BlocBuilder<
                                  DeleteAddressBloc,
                                  DeleteAddressState
                                >(
                                  builder: (context, state) {
                                    return AppButtonOutlined(
                                      onPressed:
                                          state is DeleteAddressLoadingState
                                          ? null
                                          : () {
                                              context
                                                  .read<DeleteAddressBloc>()
                                                  .add(
                                                    DeleteCurrentAddressEvent(
                                                      addressId:
                                                          widget.address!.id,
                                                    ),
                                                  );
                                            },
                                      child: state is DeleteAddressLoadingState
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
                                    );
                                  },
                                ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: BlocBuilder<AddAddressBloc, AddAddressState>(
                    builder: (context, state) {
                      return Opacity(
                        opacity: enabled ? 1 : 0.7,
                        child: AppButton(
                          onPressed: state is AddAddressLoadingState
                              ? null
                              : enabled
                              ? () {
                                  context.read<AddAddressBloc>().add(
                                    AddNewAddressEvent(
                                      streetName: streetNameController.text
                                          .trim(),
                                      houseNumber: houseNumberController.text
                                          .trim(),
                                      city: cityController.text.trim(),
                                      country: currentCountry,
                                      name: nameController.text.trim(),
                                      zip: zipController.text.trim(),
                                    ),
                                  );
                                }
                              : null,
                          gradient: Theme.of(
                            context,
                          ).extension<AppGradients>()!.primaryButton,
                          child: state is AddAddressLoadingState
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
              SizedBox(height: MediaQuery.viewInsetsOf(context).bottom),
            ],
          ),
        ),
      ),
    );
  }

  void _handleAddAddressBlocListener(
    BuildContext context,
    AddAddressState state,
  ) {
    if (state is AddAddressLoadedState) {
      context.read<GetProfileDataBloc>().add(
        GetUserProfileDataEvent(showLoading: false),
      );
      Navigator.of(context).pop();
    }
  }

  void _handelUpdateAddressBlocListener(
    BuildContext context,
    UpdateAddressState state,
  ) {
    if (state is UpdateAddressLoadedState) {
      context.read<GetProfileDataBloc>().add(
        GetUserProfileDataEvent(showLoading: false),
      );
      Navigator.of(context).pop();
    }
  }

  void _handleDeleteAddressBlocListener(
    BuildContext context,
    DeleteAddressState state,
  ) {
    if (state is DeleteAddressLoadedState) {
      context.read<GetProfileDataBloc>().add(
        GetUserProfileDataEvent(showLoading: false),
      );
      Navigator.of(context).pop();
    }
  }
}
