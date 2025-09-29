import 'package:flutter/material.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/add_profile_tile.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/products_app_bar.dart';
import 'package:help_mee/presentation/screens/home/profile_and_products_screen/widgets/profiles_list.dart';
import 'package:help_mee/util/constants/app_size.dart';

class ProductsScreen extends StatefulWidget {
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
          ProfilesList(),
          AddProfileTile(),
          SliverToBoxAdapter(
            child: SizedBox(height: AppSize.instance.height * 0.12),
          ),
        ],
      ),
    );
  }
}
