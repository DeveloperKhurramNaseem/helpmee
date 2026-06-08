import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/data/models/product_model.dart';
import 'package:help_mee/l10n/app_localizations.dart';
import 'package:help_mee/presentation/blocs/profiles_and_products/get_products/get_products_bloc.dart';
import 'package:help_mee/presentation/blocs/profiles_and_products/unmap_product/unmap_product_bloc.dart';
import 'package:help_mee/util/common_widgets/app_button.dart';
import 'package:help_mee/util/common_widgets/show_toast.dart';
import 'package:help_mee/util/constants/images.dart';
import 'package:help_mee/util/theme/light_theme/theme_data/light_app_gradient.dart';

class ProductDeletionBottomSheetOld extends StatelessWidget {
  final ProductModel productModel;
  const ProductDeletionBottomSheetOld({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return BlocListener<UnmapProductBloc, UnmapProductState>(
      listener: _handleUnmapProductListener,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localization.confirmDeletion,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Spacer(flex: 35),
                Expanded(flex: 30, child: Image.asset(AppImages.warningImage)),
                Spacer(flex: 35),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12,
              ),
              child: Text(
                'Are you sure you want to delete this product?\nYou can add it again later',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.42),
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24,
              ),
              child: BlocBuilder<UnmapProductBloc, UnmapProductState>(
                builder: (context, state) {
                  return AppButton(
                    onPressed: state is UnmapProductLoadingState
                        ? null
                        : () {
                            context.read<UnmapProductBloc>().add(
                              UnmapCurrentProduct(
                                productId: productModel.id.toString(),
                              ),
                            );
                          },
                    gradient: Theme.of(
                      context,
                    ).extension<AppGradients>()?.primaryButton,
                    child: state is UnmapProductLoadingState
                        ? CupertinoActivityIndicator(color: Colors.white)
                        : Text(
                            localization.confirmText,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12,
              ),
              child: AppButtonNoBorder(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  localization.cancelText,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleUnmapProductListener(
    BuildContext context,
    UnmapProductState state,
  ) {
    if (state is UnmapProductDoneState) {
      context.read<GetProductsBloc>().add(
        GetAllProductsEvent(showLoading: false),
      );
      Navigator.of(context).pop();
    } else if(state is UnmapProductErrorState){
      showError(state.message);
    }
  }
}
