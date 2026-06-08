import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/gifs.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class CongratulationsSheet extends StatelessWidget {
  final String productType;
  final void Function() onContiuePressed;
  const CongratulationsSheet({
    super.key,
    required this.productType,
    required this.onContiuePressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.congratulationsMessage,
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
                Container(
                  height: AppSize.instance.height * 0.2,
                  width: AppSize.instance.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: GifOrImage(productType: productType),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
            child: Text(
              AppLocalizations.of(context)!.productActivated,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.42),
                fontSize: 13,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AppButton(
              onPressed: onContiuePressed,
              gradient: Theme.of(
                context,
              ).extension<AppGradients>()?.primaryButton,
              child: Text(AppLocalizations.of(context)!.continueButton),
            ),
          ),
        ],
      ),
    );
  }
}

class GifOrImage extends StatelessWidget {
  final String productType;
  const GifOrImage({super.key, required this.productType});

  @override
  Widget build(BuildContext context) {
    return isGif
        ? GifView.asset(getGif(productType))
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage(getUrl(productType))),
            ),
          );
  }

  bool get isGif =>
      productType == AppProductCodeForGif.sb ||
      productType == AppProductCodeForGif.ssc ||
      productType == AppProductCodeForGif.sbk ||
      productType == AppProductCodeForGif.sbj ||
      productType == AppProductCodeForGif.sbb ||
      productType == AppProductCodeForGif.dt;
}
