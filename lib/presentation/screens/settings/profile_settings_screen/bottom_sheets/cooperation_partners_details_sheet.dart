import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/cooperation_partners.dart';
import 'package:help_mee/presentation/blocs/settings/profile_settings/get_cooperation_partners_bloc/get_cooperation_partners_bloc.dart';
import 'package:help_mee/presentation/blocs/settings/profile_settings/update_cooperation_partner_status_bloc/update_cooperation_partner_status_bloc.dart';

class CooperationPartnersDetailsSheet extends StatelessWidget {
  const CooperationPartnersDetailsSheet({
    super.key,
    required this.cooperationPartner,
  });

  final CooperationPartner cooperationPartner;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final captionStyle = TextStyle(
      color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
      fontWeight: FontWeight.normal,
      fontSize: 10,
    );

    return BlocListener<
      UpdateCooperationPartnerStatusBloc,
      UpdateCooperationPartnerStatusState
    >(
      listener: _handleUpdateCooperationPartnerstates,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 14,
          right: 14,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                cooperationPartner.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            // Big rounded image
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  cooperationPartner.icon,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Status pill (red for deactivated / green for activated)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: ShapeDecoration(
                shape: StadiumBorder(
                  side: BorderSide(
                    color: cooperationPartner.isActive == 'true'
                        ? Colors.green.shade300
                        : Colors.red.shade300,
                  ),
                ),
                color:
                    (cooperationPartner.isActive == 'true'
                            ? Colors.green
                            : Colors.red)
                        .withOpacity(0.08),
              ),
              child: Text(
                cooperationPartner.isActive == 'true'
                    ? 'Service is activated in your HelpMee profile'
                    : 'Service is deactivated and not shown in your HelpMee profile',
                style: TextStyle(
                  color: cooperationPartner.isActive == 'true'
                      ? Colors.green.shade700
                      : Colors.red.shade700,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Activate button
            ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cooperationPartner.isActive == 'true'
                        ? Colors.red
                        : const Color(0xFF40C27D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    context.read<UpdateCooperationPartnerStatusBloc>().add(
                      UpdateCurrentCooperationPartnerStatusEvent(
                        id: cooperationPartner.id,
                        isActive: cooperationPartner.isActive == 'true'
                            ? 'false'
                            : 'true',
                      ),
                    );
                  },
                  child: Text(
                    cooperationPartner.isActive == 'true'
                        ? 'Deactivate Service'
                        : 'Activate Service',
                  ),
                ),
              ),
            ],

            // Gray caption
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Activation of service within HelpMee profile is for free.\n'
                'Some service items can be charged by the service provider.',
                style: captionStyle,
                textAlign: TextAlign.center,
              ),
            ),
            // const _Bullets(),
            Text(cooperationPartner.description),
          ],
        ),
      ),
    );
  }

  void _handleUpdateCooperationPartnerstates(
    BuildContext context,
    UpdateCooperationPartnerStatusState state,
  ) {
    if (state is UpdateCooperationPartnerStatusLoadedState) {
      context.read<GetCooperationPartnersBloc>().add(
        GetAllCooperationPartnersEvent(),
      );
      Navigator.of(context).pop(true); // close after activate
    }
  }
}
