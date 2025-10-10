import 'package:flutter/material.dart';

class CooperationPartnersDetailsSheet extends StatelessWidget {
  const CooperationPartnersDetailsSheet({
    super.key,
    required this.isActive,
    required this.imageUrl,
    this.onActivate,
  });

  final bool isActive;
  final String imageUrl;
  final VoidCallback? onActivate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final captionStyle = TextStyle(
      color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
      fontWeight: FontWeight.normal,
      fontSize: 10,
    );

    return SingleChildScrollView(
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
              'Viokid',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          // Big rounded image
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          // Status pill (red for deactivated / green for activated)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: ShapeDecoration(
              shape: StadiumBorder(
                side: BorderSide(
                  color: isActive ? Colors.green.shade300 : Colors.red.shade300,
                ),
              ),
              color: (isActive ? Colors.green : Colors.red).withOpacity(0.08),
            ),
            child: Text(
              isActive
                  ? 'Service is activated in your HelpMee profile'
                  : 'Service is deactivated and not shown in your HelpMee profile',
              style: TextStyle(
                color: isActive ? Colors.green.shade700 : Colors.red.shade700,
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
                  backgroundColor: const Color(0xFF40C27D),
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
                onPressed:
                    onActivate ??
                    () {
                      Navigator.of(context).pop(true); // close after activate
                    },
                child: const Text('Activate Service'),
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
          const _Bullets(),
        ],
      ),
    );
  }
}

class _Bullets extends StatelessWidget {
  const _Bullets();

  @override
  Widget build(BuildContext context) {
    final body = TextStyle(
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 12,
    );
    final link = body.copyWith(
      color: Colors.blue.shade700,
      decoration: TextDecoration.underline,
      fontSize: 12,
    );

    Widget bulletPara(InlineSpan span) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Text('•  '),
          Expanded(
            child: RichText(
              text: TextSpan(style: body, children: [span]),
            ),
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bulletPara(
          const TextSpan(
            text:
                'Imagine your child falls off a bike or has fever. You are unsure whether it is just a graze or a harmless infection.',
          ),
        ),
        bulletPara(
          TextSpan(
            children: [
              const TextSpan(
                text:
                    'Once you have installed the Viokid app and have registered, you can start the video call with your medical specialist 24/7 with VIOKID via the button ',
              ),
              TextSpan(text: '“reach experts now”', style: link),
              const TextSpan(
                text:
                    ' immediately without any appointment. You will conduct a structured telemedical initial video-assessment interview specially adapted to the requirements of children.',
              ),
            ],
          ),
        ),
        bulletPara(
          const TextSpan(
            text:
                'This enables you to make the best decision for you and your child at any time anywhere, whether at home or on holidays. Your medical experts are paediatricians, doctors, paediatric nurses and experts from the emergency sector.',
          ),
        ),
        bulletPara(
          TextSpan(
            children: [
              TextSpan(
                text: 'VIOKID – Your Doc in the Poc – Nurse in the Purse.',
                style: link,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
