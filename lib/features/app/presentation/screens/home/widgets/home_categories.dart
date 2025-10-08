import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/routing/app_router.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../viewmodels/category/categories_cubit.dart';
import 'category_item.dart';


class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const SizedBox(
            height: 120,
            child: Center(
              child: CircularProgressIndicator(),
            ),
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
            height: 120,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 6),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CategoryItem(
                    name: category.name,
                    imageUrl: category.image,
                    onTap: () {
                      AppRouter.push(
                        context,
                        Routes.subCategories,
                        arguments: category.id,
                      );
                    },
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

