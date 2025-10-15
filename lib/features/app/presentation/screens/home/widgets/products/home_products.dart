import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/features/app/presentation/screens/home/widgets/products/product_item.dart';
import 'package:route_store/features/app/presentation/screens/home/widgets/products/product_item_shimmer.dart';
import 'package:route_store/features/app/presentation/viewmodels/product/product_cubit.dart';

import '../../../../../../../core/constants/colors.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/routing/app_router.dart';
import '../../../../../../../core/routing/routes.dart';
import '../../../../viewmodels/product/product_state.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => sl<ProductCubit>()..fetchProducts(),
      child:  _HomeProductsBody(),
    );
  }
}


class _HomeProductsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  AppRouter.push(context, Routes.allProducts);
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: RColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return SizedBox(
                height: 250,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) => const ProductShimmerItem(),
                ),
              );
            }

            if (state is ProductError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state is ProductSuccess) {
              final products = state.products;
              if (products.isEmpty) {
                return const Center(child: Text('No products found'));
              }

              return SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: products.length > 10 ? 10 : products.length, // Limit to 10 products
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12), // Space between items
                      child: SizedBox(
                        width: 160, // Fixed width for each product card
                        child: ProductItem(product: product),
                      ),
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

