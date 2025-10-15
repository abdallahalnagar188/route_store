import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/features/app/presentation/screens/home/widgets/products/product_item_shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:route_store/features/app/presentation/viewmodels/product/product_cubit.dart';
import 'package:route_store/features/app/presentation/viewmodels/product/product_state.dart';
import 'product_item.dart';

class AllProductWidget extends StatefulWidget {
  const AllProductWidget({super.key});

  @override
  State<AllProductWidget> createState() => _AllProductWidgetState();
}

class _AllProductWidgetState extends State<AllProductWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // ✅ Now this will work because BlocProvider is above this widget
    final cubit = context.read<ProductCubit>();
    cubit.fetchProducts(); // initial load

    // 🔹 Detect scroll end for paging
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        cubit.fetchProducts(); // load next page
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading && state is! ProductSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: 8,
            itemBuilder: (_, __) => const ProductShimmerItem(),
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

        if (state is ProductSuccess || state is ProductEndOfList) {
          final products = (state is ProductSuccess)
              ? state.products
              : (state as ProductEndOfList).products;

          if (products.isEmpty) {
            return const Center(child: Text('No products found'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              await context.read<ProductCubit>().fetchProducts(isRefresh: true);
            },
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length + (state is ProductSuccess ? 1 : 0), // Only show loader if loading
              itemBuilder: (context, index) {
                if (index < products.length) {
                  return ProductItem(product: products[index]);
                } else {
                  // 🔹 Show loading indicator when fetching more
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
