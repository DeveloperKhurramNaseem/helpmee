
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help_mee/data/models/product_model.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/product_deletion_bottom_sheet_old.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/product_description_bottom_sheet_old.dart';
import 'package:help_mee/util/constants/app_size.dart';
import 'package:help_mee/util/constants/icons.dart';
import 'package:help_mee/util/constants/images.dart';
import 'package:help_mee/util/common_widgets/show_bottom_sheet.dart' as m;

class ProductsListOld extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsListOld({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductTile(product: products[index]);
      },
    );
  }
}

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(237, 237, 237, 1), width: 1),
        color: Color.fromRGBO(249, 249, 249, 0.55),
      ),
      margin: EdgeInsets.only(right: 8, left: 8, top: 0, bottom: 8),
      child: Row(
        children: [
          Container(
            width: AppSize.instance.height * 0.1,
            height: AppSize.instance.height * 0.1,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color.fromRGBO(249, 249, 249, 0.55),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    product.productImage,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(AppImages.productImage),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                Text(
                  product.productType,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  m.showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return ProductDescriptionBottomSheetOld(
                        productModel: product,
                      );
                    },
                  );
                },
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 12,
                    ),
                    child: SvgPicture.asset(AppIcons.edit),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  m.showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return ProductDeletionBottomSheetOld(
                        productModel: product,
                      );
                    },
                  );
                },
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 12,
                    ),
                    child: SvgPicture.asset(AppIcons.del),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
