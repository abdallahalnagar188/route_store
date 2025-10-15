import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerItem extends StatelessWidget {
  const ProductShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 130, width: double.infinity, color: Colors.grey),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 16, width: 100, color: Colors.grey),
                  const SizedBox(height: 6),
                  Container(height: 12, width: 150, color: Colors.grey),
                  const SizedBox(height: 6),
                  Container(height: 16, width: 50, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
