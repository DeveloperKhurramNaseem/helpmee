import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_mee/presentation/blocs/profiles_and_products/get_products/get_products_bloc.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/add_profile_tile_old.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/products_app_bar.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/products_list_old.dart';
import 'package:help_mee/util/constants/app_size.dart';

class ProductsScreen extends StatefulWidget {
  static const path = '/products-screen';
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductsAppBar(),
      body: CustomScrollView(
        slivers: [
          // ProfilesList(),
          BlocBuilder<GetProductsBloc, GetProductsState>(
            builder: (context, state) {
              if (state is GetProductsLoadedState) {
                return ProductsListOld(products: state.products);
              } else if (state is GetProductsLoadingState) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                );
              } else if (state is GetProductsErrorState) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.message)),
                );
              }
              return SliverToBoxAdapter(child: SizedBox());
            },
          ),
          AddProfileTileOld(),
          SliverToBoxAdapter(
            child: SizedBox(height: AppSize.instance.height * 0.12),
          ),
        ],
      ),
    );
  }
}
