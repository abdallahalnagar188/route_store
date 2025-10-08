import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:route_store/core/constants/colors.dart';

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

// 🎨 Custom Home Slider Widget
class HomeSlider extends StatefulWidget {
  final List<SliderItem> items;
  final double height;
  final Duration autoPlayInterval;
  final Function(int)? onItemTap;

  const HomeSlider({
    super.key,
    required this.items,
    this.height = 200,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.onItemTap,
  });

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 16 / 9,
            autoPlayInterval: widget.autoPlayInterval,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          items: widget.items.map((item) {
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
                                if (widget.onItemTap != null) {
                                  widget.onItemTap!(_currentIndex);
                                }
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
            children: widget.items.asMap().entries.map((entry) {
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
    );
  }
}