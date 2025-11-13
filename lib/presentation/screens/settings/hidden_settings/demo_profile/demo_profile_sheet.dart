import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/demo_profile_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/hidden_features/get_demo_profiles/get_demo_profiles_bloc.dart';
import 'package:help_mee/presentation/screens/settings/hidden_settings/demo_profile/demo_profile_confirm_sheet.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';
import 'package:provider/provider.dart';

class DemoProfileSheet extends StatefulWidget {
  const DemoProfileSheet({super.key});

  @override
  State<DemoProfileSheet> createState() => _DemoProfileSheetState();
}

class _DemoProfileSheetState extends State<DemoProfileSheet> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<GetDemoProfilesBloc>().add(GetDemoProfilesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GetDemoProfilesBloc>();
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.demoProfileTitle,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: Text(
                AppLocalizations.of(context)!.demoProfileTextFirst,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.demoProfileTextImportant,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: Text(
                AppLocalizations.of(context)!.demoProfileTextLast,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 24,
                        ),
                        child:
                            BlocBuilder<
                              GetDemoProfilesBloc,
                              GetDemoProfilesState
                            >(
                              builder: (context, state) {
                                if (state is GetDemoProfilesLoadedState) {
                                  return Column(
                                    spacing: 10,
                                    children: [
                                      for (
                                        var i = 0;
                                        i < state.demoProfiles.length;
                                        i++
                                      )
                                        DemoProfileTile(
                                          demoProfileModel:
                                              state.demoProfiles[i],
                                          index: i,
                                          selectedIndex: selectedIndex,
                                          onSelectionChanged: (index) {
                                            setState(() {
                                              selectedIndex = index;
                                            });
                                          },
                                        ),
                                    ],
                                  );
                                } else if (state
                                    is GetDemoProfilesLoadingState) {
                                  return CupertinoActivityIndicator(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  );
                                }
                                return SizedBox();
                              },
                            ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: Text(
                      AppLocalizations.of(context)!.listOfDemoProfileText,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.profileContinue,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Platform.isAndroid ? 12.0 : 0.0),
              child: Row(
                children: [
                  Spacer(flex: 20),
                  Expanded(
                    flex: 60,
                    child: AppButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: true,
                          builder: (context) {
                            return DemoProfileConfirmSheet(
                              demoProfileModel:
                                  bloc.demoProfiles[selectedIndex],
                            );
                          },
                        );
                      },
                      gradient: Theme.of(
                        context,
                      ).extension<AppGradients>()?.primaryButton,
                      child: Text(AppLocalizations.of(context)!.continueButton),
                    ),
                  ),
                  Spacer(flex: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoProfileTile extends StatelessWidget {
  final DemoProfileModel demoProfileModel;
  final int selectedIndex;
  final int index;
  final void Function(int) onSelectionChanged;
  const DemoProfileTile({
    super.key,
    required this.demoProfileModel,
    required this.selectedIndex,
    required this.index,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Emergency: Young girl',
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.8), fontSize: 12),
        ),
        Row(
          spacing: 10,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5.5),
              child: Text(
                AppLocalizations.of(context)!.previewTitle,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                onSelectionChanged(index);
              },
              child: Icon(
                selectedIndex == index
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 23,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
