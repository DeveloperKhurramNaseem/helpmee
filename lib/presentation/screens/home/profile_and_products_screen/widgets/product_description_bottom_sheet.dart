import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/product_deletion_bottom_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/constants/images.dart';

class ProductDescriptionBottomSheet extends StatelessWidget {
  const ProductDescriptionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Product Description',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Spacer(flex: 30),
              Expanded(flex: 40, child: Image.asset(AppImages.productImage)),
              Spacer(flex: 30),
            ],
          ),
          Card(
            elevation: 0,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(249, 249, 249, 0.55),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(237, 237, 237, 1),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Column(
                    spacing: 7,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(title: 'Product Name:'),
                      TitleText(title: 'Product Type:'),
                      TitleText(title: 'Serial Number:'),
                      TitleText(title: 'Activation Date:'),
                      TitleText(title: 'Expiration Date:'),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        spacing: 7,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MessageText(message: 'SOS emergency sticker'),
                              SvgPicture.asset(AppIcons.edit),
                            ],
                          ),
                          MessageText(message: 'Sticker'),
                          MessageText(message: '763692E75E779'),
                          MessageText(message: 'May 1, 2025'),
                          Row(
                            spacing: 6,
                            children: [
                              MessageText(message: 'Apr 30, 2025'),
                              SvgPicture.asset(AppIcons.info),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (_) {
                    return ProductDeletionBottomSheet();
                  },
                );
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color.fromRGBO(237, 237, 237, 1),
                      width: 1,
                    ),
                  ),
                ),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 5),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromRGBO(249, 249, 249, 0.55),
                ),
                elevation: WidgetStatePropertyAll(0),
                fixedSize: WidgetStatePropertyAll(
                  Size(AppSize.instance.width, 50),
                ),
              ),
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          BottomSheetBottomText(),
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}

class MessageText extends StatelessWidget {
  final String message;
  const MessageText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          message,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Text(
          '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}

class BottomSheetBottomText extends StatelessWidget {
  const BottomSheetBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Text(
        'This product was last sanned on July 22, 2024 3:15 pm at Gulberg Greens, Islamabad',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.42), fontSize: 11),
      ),
    );
  }
}
