import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/core/constants/colors.dart';
import 'package:route_store/core/constants/images.dart';
import 'package:route_store/features/app/presentation/screens/home/widgets/home_categories.dart';
import 'package:route_store/features/app/presentation/screens/home/widgets/home_slider.dart';

import '../../../../../core/di/di.dart';
import '../../viewmodels/category/categories_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoriesCubit>()..fetchCategories(),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SliderItem> sliderItems = [
      SliderItem(
        imagePath: RImages.banner1,
        title: 'Up To 25% off',
        description: 'Discover the \nlatest fashion trends',
        buttonText: 'Shop Now',
        textColor: Colors.white,
        buttonColor: RColors.primary,
      ),
      SliderItem(
        imagePath: RImages.banner2,
        title: 'New Collection',
        description: 'Explore our exclusive \nsummer collection',
        buttonText: 'Explore',
        textColor: Colors.white,
        buttonColor: RColors.primary,
      ),
      SliderItem(
        imagePath: RImages.banner3,
        title: 'Limited Offer',
        description: 'Get 30% off on \nselected items',
        buttonText: 'Buy Now',
        textColor: RColors.primary,
        buttonColor: RColors.primary,
      ),
    ];

    return Scaffold(
      backgroundColor: RColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            HomeSlider(
              items: sliderItems,
              autoPlayInterval: const Duration(seconds: 4),
              onItemTap: (index) {
                print('Tapped on slider item: $index');
              },
            ),

            const SizedBox(height: 24),
            // 🔹 Categories List
            const HomeCategories(),
          ],
        ),
      ),
    );
  }
}