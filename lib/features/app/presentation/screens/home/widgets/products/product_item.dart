import 'package:flutter/material.dart';
import '../../../../../../../core/widgets/contaner/rounded_contaner.dart';
import '../../../../../domain/entities/product_response.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      height: 240,
      backgroundColor: Colors.grey[200]!,
      showBorder: true,
      borderColor: Colors.grey.shade300,
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.network(
                product.imageCover,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Description
                  Text(
                    product.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),

                  // Price
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),

                 // Rating Row
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '(${product.ratingsAverage})',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 2),
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                    ],
                  ),

                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
