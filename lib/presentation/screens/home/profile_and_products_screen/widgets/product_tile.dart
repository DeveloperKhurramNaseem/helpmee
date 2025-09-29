import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/product_description_bottom_sheet.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) {
            return ProductDescriptionBottomSheet();
          },
        );
      },
      child: SizedBox(
        width: AppSize.instance.width * 0.31,
        child: Card(
          elevation: 0,
          child: Row(
            children: [
              Spacer(flex: 3),
              Expanded(
                flex: 94,
                child: Column(
                  spacing: 3,
                  children: [
                    Row(
                      children: [
                        Spacer(flex: 1),
                        Expanded(
                          flex: 8,
                          child: Container(
                            height: AppSize.instance.height * 0.099,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromRGBO(237, 237, 237, 1),
                                width: 1,
                              ),
                              color: Color.fromRGBO(249, 249, 249, 0.55),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(249, 249, 249, 1),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://images.unsplash.com/photo-1757416654883-c73c67b3382b?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 1),
                      ],
                    ),
                    Text(
                      'SOS Emergency Sticker',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewProductTile extends StatelessWidget {
  const AddNewProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.instance.width * 0.3,
      child: Card(
        elevation: 0,
        child: Row(
          children: [
            Spacer(flex: 3),
            Expanded(
              flex: 94,
              child: Column(
                spacing: 3,
                children: [
                  Row(
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 8,
                        child: Container(
                          height: AppSize.instance.height * 0.099,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromRGBO(237, 237, 237, 1),
                              width: 1,
                            ),
                            color: Color.fromRGBO(249, 249, 249, 0.55),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(249, 249, 249, 1),
                            ),
                            child: UnconstrainedBox(
                              child: SvgPicture.asset(
                                AppIcons.add,
                                height: 25,
                                width: 25,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Spacer(flex: 1),
                    ],
                  ),
                  Text(
                    'Add new product',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
