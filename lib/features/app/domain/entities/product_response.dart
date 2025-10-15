// domain/entities/product_entity.dart

import 'category_response.dart';


// domain/entities/product_response_entity.dart
class ProductResponseEntity {
  final int results;
  final MetadataEntity metadata;
  final List<ProductEntity> data;

  const ProductResponseEntity({
    required this.results,
    required this.metadata,
    required this.data,
  });
}

class MetadataEntity {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int nextPage;

  const MetadataEntity({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    required this.nextPage,
  });
}

class ProductEntity {
  final String id;
  final String title;
  final String description;
  final int quantity;
  final double price;
  final double ratingsAverage;
  final int ratingsQuantity;
  final int sold;
  final String imageCover;
  final List<String> images;
  final CategoryEntity category;
  final BrandEntity brand;
  final List<SubCategoryEntity> subcategories;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.sold,
    required this.imageCover,
    required this.images,
    required this.category,
    required this.brand,
    required this.subcategories,
  });
}

class CategoryEntity {
  final String id;
  final String name;
  final String slug;
  final String image;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });
}

class BrandEntity {
  final String id;
  final String name;
  final String slug;
  final String image;

  const BrandEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });
}

class SubCategoryEntity {
  final String id;
  final String name;
  final String slug;

  const SubCategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
  });
}
