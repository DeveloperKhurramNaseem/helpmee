import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/images.dart';

class AmCard extends StatelessWidget {
  final String title, description, imagePath;
  final bool isSelected;
  const AmCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.instance.height * 0.24,
      width: AppSize.instance.width,
      margin: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(imagePath),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(description),
            ],
          ),
        ],
      ),
    );
  }
}

class AmNfcScanCard extends StatelessWidget {
  const AmNfcScanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AmCard(
      title: 'NFC',
      description: 'Tap to activate via NFC',
      imagePath: AppImages.nfcScannerImage,
      isSelected: true,
    );
  }
}

class AmQRScanCard extends StatelessWidget {
  const AmQRScanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AmCard(
      title: 'QR Code',
      description: 'Scan to activate via QR Code',
      imagePath: AppImages.qrCodeScanner,
      isSelected: false,
    );
  }
}
