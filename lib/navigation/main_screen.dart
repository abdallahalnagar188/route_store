import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/core/constants/colors.dart';
import 'package:route_store/core/constants/images.dart';
import '../core/widgets/headers/common_header.dart';
import '../features/app/presentation/screens/categories/categories.dart';
import '../features/app/presentation/screens/home/home.dart';
import '../core/widgets/headers/header_cubit.dart';
import '../features/app/presentation/screens/profile/profile.dart';
import '../features/app/presentation/screens/wishlist/wishlist.dart';
import 'bottom_nav_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => HeaderCubit()),
      ],
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          final bottomCubit = context.read<BottomNavCubit>();

          // Define screen titles
          final screenTitles = ['Home', 'Categories', 'Wishlist', 'Profile'];

          // Define screens
          final screens = [
            const HomeScreen(),
            const CategoriesScreen(),
            const WishlistScreen(),
            const ProfileScreen(),
          ];

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  // Common Header at the top
                  CommonHeader(
                    title: screenTitles[currentIndex],
                    onCartPressed: () {
                      // Navigate to cart screen
                      // Navigator.pushNamed(context, '/cart');
                    },
                  ),

                  // Current screen content
                  Expanded(
                    child: screens[currentIndex],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: bottomCubit.changeTab,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: RColors.primary,
                selectedItemColor: RColors.primary,
                unselectedItemColor: Colors.grey,
                items: [
                  _buildNavItem(
                    iconPath: RImages.homeIcon,
                    label: 'Home',
                    isSelected: currentIndex == 0,
                  ),
                  _buildNavItem(
                    iconPath: RImages.categoryIcon,
                    label: 'Categories',
                    isSelected: currentIndex == 1,
                  ),
                  _buildNavItem(
                    iconPath: RImages.favoriteIcon,
                    label: 'Wishlist',
                    isSelected: currentIndex == 2,
                  ),
                  _buildNavItem(
                    iconPath: RImages.profileIcon,
                    label: 'Profile',
                    isSelected: currentIndex == 3,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconPath,
          height: 40,
          width: 40,
          color: isSelected ? RColors.primary : Colors.white,
        ),
      ),
    );
  }
}