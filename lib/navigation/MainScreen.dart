import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/core/constants/colors.dart';
import 'package:route_store/core/constants/images.dart';
import '../features/categories/presentation/screens/home/categories.dart';
import '../features/home/presentation/screens/home/home.dart';
import '../features/profile/presentation/screens/home/profile.dart';
import '../features/wishlist/presentation/screens/home/wishlist.dart';
import 'bottom_nav_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> screens = const [
    HomeScreen(),
    CategoriesScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          final cubit = context.read<BottomNavCubit>();

          return Scaffold(
            body: IndexedStack(index: currentIndex, children: screens),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: cubit.changeTab,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: RColors.primary,
                elevation: 10,
                selectedItemColor: Colors.blue,
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
