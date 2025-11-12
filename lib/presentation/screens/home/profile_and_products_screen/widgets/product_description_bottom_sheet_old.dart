import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/data/models/product_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/constants/images.dart';

class ProductDescriptionBottomSheetOld extends StatefulWidget {
  final ProductModel productModel;
  const ProductDescriptionBottomSheetOld({
    super.key,
    required this.productModel,
  });

  @override
  State<ProductDescriptionBottomSheetOld> createState() =>
      _ProductDescriptionBottomSheetOldState();
}

class _ProductDescriptionBottomSheetOldState
    extends State<ProductDescriptionBottomSheetOld> {
  late TextEditingController controller;
  late FocusNode focusNode;
  bool isEditable = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = widget.productModel.name;
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.productDescription,
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
                        // TitleText(title: 'Expiration Date:'),
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
                                Expanded(
                                  child: MessageTextField(
                                    controller: controller,
                                    isEditable: isEditable,
                                    focusNode: focusNode,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isEditable = !isEditable;
                                      if (isEditable) {
                                        focusNode.requestFocus();
                                      }
                                    });
                                  },
                                  child: ColoredBox(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: SvgPicture.asset(
                                        color: Colors.black,
                                        isEditable
                                            ? AppIcons.tickIcon
                                            : AppIcons.edit,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            MessageText(message: 'Sticker'),
                            MessageText(message: '763692E75E779'),
                            MessageText(message: 'May 1, 2025'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomSheetBottomText(),
          ],
        ),
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

class MessageTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEditable;
  final FocusNode focusNode;
  const MessageTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.isEditable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ColoredBox(
            color: Colors.transparent,
            child: TextFormField(
              focusNode: focusNode,
              controller: controller,
              readOnly: !isEditable,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        // Text(
        //   message,
        //   style: TextStyle(
        //     fontSize: 13,
        //     fontWeight: FontWeight.w500,
        //     color: Theme.of(context).colorScheme.secondary,
        //   ),
        // ),
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
