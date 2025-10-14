import 'package:flutter/material.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/screens/settings/profile_settings_screen/bottom_sheets/cooperation_partners_details_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/theme/app_colors.dart';

class CooperationPartersSheet extends StatelessWidget {
  const CooperationPartersSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.cooperationPartnersLabel,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          for (var i = 0; i < 3; i++)
            ServiceCard(
              title: 'Viokid',
              description:
                  'Your child is lost and you want to get immediate help calling a doctor 24/7? Activate Viokid …',
              statusText: 'Service activated in your HelpMee profile',
              imageUrl:
                  'https://images.unsplash.com/photo-1543946602-a0fce8117699?w=400', // replace with your asset/url
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  enableDrag: true,
                  // showDragHandle: true,
                  builder: (context) {
                    return CooperationPartnersDetailsSheet(
                      isActive: true,
                      imageUrl:
                          'https://media.istockphoto.com/id/1641108540/photo/business-document-management-and-checklist-work-performance-concept-businessman-use-laptop.jpg?s=1024x1024&w=is&k=20&c=frVON9x2cNwJmBvoiJPq1_0zX4k0Zll7AvT_gBfB_7k=',
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.statusText,
    required this.imageUrl,
    this.onTap,
  });

  final String title;
  final String description;
  final String statusText;
  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GradientBorderImage(
              url: imageUrl,
              size: AppSize.instance.height * 0.12,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title (w500)
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  // Description (normal)
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppLightThemeColors.secondaryTextColor,
                    ),
                  ),
                  // Status pill (normal)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.08),
                      border: Border.all(color: Colors.green.shade300),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      statusText,
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
