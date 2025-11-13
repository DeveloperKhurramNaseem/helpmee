import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/cooperation_partners.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/settings/profile_settings/get_cooperation_partners_bloc/get_cooperation_partners_bloc.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/bottom_sheets/cooperation_partners_details_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/theme/app_colors.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;

class CooperationPartersSheet extends StatefulWidget {
  const CooperationPartersSheet({super.key});

  @override
  State<CooperationPartersSheet> createState() =>
      _CooperationPartersSheetState();
}

class _CooperationPartersSheetState extends State<CooperationPartersSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCooperationPartnersBloc, GetCooperationPartnersState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.cooperationPartnersLabel,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<
                GetCooperationPartnersBloc,
                GetCooperationPartnersState
              >(
                builder: (context, state) {
                  if (state is GetCooperationPartnersLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  } else if (state is GetCooperationPartnersDoneState) {
                    return Column(
                      spacing: 12,
                      children: [
                        for (
                          var i = 0;
                          i < state.cooperationPartners.length;
                          i++
                        )
                          ServiceCard(
                            cooperationPartner: state.cooperationPartners[i],
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.cooperationPartner});
  final CooperationPartner cooperationPartner;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        m.showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: true,
          enableDrag: true,
          // showDragHandle: true,
          builder: (context) {
            return CooperationPartnersDetailsSheet(
              cooperationPartner: cooperationPartner,
            );
          },
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: AppSize.instance.height * 0.10,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GradientBorderImage(
              url: cooperationPartner.icon,
              size: AppSize.instance.height * 0.10,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ColoredBox(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title (w500)
                    Text(
                      cooperationPartner.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    // Description (normal)
                    Text(
                      cooperationPartner.shortDescription,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color: AppLightThemeColors.secondaryTextColor,
                      ),
                    ),
                    // Status pill (normal)
                    if (cooperationPartner.isActive == 'true')
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.08),
                          border: Border.all(color: Colors.green.shade300),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Service activated in your HelpMee profile',
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GradientBorderImage extends StatelessWidget {
  const _GradientBorderImage({required this.url, required this.size});
  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(3), // border thickness
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xFF2BD9F2), Color(0xFF39C5A8)], // teal/green ring
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: Colors.grey[200]),
        ),
      ),
    );
  }
}
