import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:route_store/core/constants/colors.dart';
import 'package:route_store/core/constants/sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // 🖼️ Slider items with different content
  final List<SliderItem> sliderItems = [
    SliderItem(
      imagePath: 'assets/images/banner1.png',
      title: 'Up To 25% off',
      description: 'Discover the \nlatest fashion trends',
      buttonText: 'Shop Now',
      textColor: Colors.white,
      buttonColor: RColors.primary,
    ),
    SliderItem(
      imagePath: 'assets/images/banner2.png',
      title: 'New Collection',
      description: 'Explore our exclusive \nsummer collection',
      buttonText: 'Explore',
      textColor: Colors.white,
      buttonColor: RColors.primary,
    ),
    SliderItem(
      imagePath: 'assets/images/banner3.png',
      title: 'Limited Offer',
      description: 'Get 30% off on \nselected items',
      buttonText: 'Buy Now',
      textColor:  RColors.primary,
      buttonColor: RColors.primary,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // 🔹 Carousel Slider with fixed dots
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: const Duration(seconds: 4),
                    onPageChanged: (index, reason) {
                      setState(() => _currentIndex = index);
                    },
                  ),
                  items: sliderItems.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              // Background image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  item.imagePath,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Overlay with texts and button
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(16),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                        color: item.textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      item.description,
                                      style: TextStyle(
                                        color: item.textColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: item.buttonColor,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 10,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () {
                                        // Navigate to shop screen
                                      },
                                      child: Text(
                                        item.buttonText,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                // 🔹 Fixed dots indicator at the bottom
                Positioned(
                  bottom: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: sliderItems.asMap().entries.map((entry) {
                      return Container(
                        width: _currentIndex == entry.key ? 10.0 : 8.0,
                        height: _currentIndex == entry.key ? 10.0 : 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? RColors.primary
                              : Colors.white.withOpacity(0.7),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// 📦 Model class for slider items
class SliderItem {
  final String imagePath;
  final String title;
  final String description;
  final String buttonText;
  final Color textColor;
  final Color buttonColor;

  SliderItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.textColor,
    required this.buttonColor,
  });
}