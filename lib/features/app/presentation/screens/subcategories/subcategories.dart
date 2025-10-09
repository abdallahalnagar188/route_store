import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/features/app/presentation/viewmodels/subcategory/subcategory_cubit.dart';
import '../../../../../core/widgets/error/error_widget.dart';
import '../../../../../core/widgets/loaders/list_loading.dart';
import '../../../../../core/widgets/success/empty_list.dart';
import '../home/widgets/category_item.dart';

class SubcategoriesScreen extends StatelessWidget {
  final String categoryId;

  const SubcategoriesScreen({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoryCubit, SubcategoryState>(
      builder: (context, state) {
        return switch (state) {
          SubcategoryLoading() => const HorizontalListLoading(),
          SubcategoryError() => HorizontalListError(message: state.message),
          SubcategorySuccess() => _buildSubcategoryList(state.subcategories),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _buildSubcategoryList(List<dynamic> subcategories) {
    if (subcategories.isEmpty) {
      return const HorizontalListEmpty(
        message: 'No subcategories found',
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subcategories'),
      ),
      body: SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: subcategories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 6),
          itemBuilder: (context, index) {
            final subcategory = subcategories[index];
            return CategoryItem(
              name: subcategory.name,
              imageUrl: subcategory.category,
              onTap: () {
                print('Subcategory tapped: ${subcategory.name}');
              },
            );
          },
        ),
      ),
    );
  }
}