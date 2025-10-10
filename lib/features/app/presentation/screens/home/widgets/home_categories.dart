import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/routing/app_router.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../viewmodels/category/categories_cubit.dart';
import 'category_item.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

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
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to all categories screen
                //  AppRouter.push(context, Routes.allCategories);
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

        // 🔹 Categories List
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const SizedBox(
                height: 120,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (state is CategoriesError) {
              return SizedBox(
                height: 120,
                child: Center(
                  child: Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            if (state is CategoriesSuccess) {
              final categories = state.categories;

              if (categories.isEmpty) {
                return const SizedBox(
                  height: 120,
                  child: Center(
                    child: Text('No categories found'),
                  ),
                );
              }

              return SizedBox(
                height: 250, // increase height to fit two rows
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
               //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,          // 🔹 Two rows
                    // mainAxisSpacing: 12,        // 🔹 Space between items horizontally
                    // crossAxisSpacing: 12,       // 🔹 Space between items vertically
                    childAspectRatio: 1,        // 🔹 Adjust for desired item shape
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryItem(
                      name: category.name,
                      imageUrl: category.image,
                      onTap: () {
                        AppRouter.push(
                          context,
                          Routes.subCategories,
                          arguments: category.id,
                        );
                      },
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
