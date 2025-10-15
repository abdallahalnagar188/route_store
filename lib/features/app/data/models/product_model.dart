// data/models/product_model.dart
import '../../domain/entities/product_response.dart';

class ProductResponseModel {
  final int results;
  final MetadataModel metadata;
  final List<ProductModel> data;

  ProductResponseModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      results: json['results'] ?? 0,
      metadata: MetadataModel.fromJson(json['metadata']),
      data: (json['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }

  ProductResponseEntity toEntity() => ProductResponseEntity(
    results: results,
    metadata: metadata.toEntity(),
    data: data.map((e) => e.toEntity()).toList(),
  );
}

class MetadataModel {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int nextPage;

  MetadataModel({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    required this.nextPage,
  });

  factory MetadataModel.fromJson(Map<String, dynamic> json) {
    return MetadataModel(
      currentPage: json['currentPage'] ?? 1,
      numberOfPages: json['numberOfPages'] ?? 1,
      limit: json['limit'] ?? 0,
      nextPage: json['nextPage'] ?? 0,
    );
  }

  MetadataEntity toEntity() => MetadataEntity(
    currentPage: currentPage,
    numberOfPages: numberOfPages,
    limit: limit,
    nextPage: nextPage,
  );
}

class ProductModel {
  final String id;
  final String title;
  final String description;
  final int quantity;
  final double price;
  final double ratingsAverage;
  final int ratingsQuantity;
  final num sold;
  final String imageCover;
  final List<String> images;
  final CategoryModel category;
  final BrandModel brand;
  final List<SubCategoryModel> subcategories;

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble() ?? 0.0,
      ratingsQuantity: json['ratingsQuantity'] ?? 0,
      sold: json['sold'] ?? 0,
      imageCover: json['imageCover'] ?? '',
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      category: CategoryModel.fromJson(json['category']),
      brand: BrandModel.fromJson(json['brand']),
      subcategories: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => SubCategoryModel.fromJson(e))
          .toList() ??
          [],
    );
  }

  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    description: description,
    quantity: quantity,
    price: price,
    ratingsAverage: ratingsAverage,
    ratingsQuantity: ratingsQuantity,
    sold: sold.toInt(),
    imageCover: imageCover,
    images: images,
    category: category.toEntity(),
    brand: brand.toEntity(),
    subcategories: subcategories.map((e) => e.toEntity()).toList(),
  );
}

class CategoryModel {
  final String id;
  final String name;
  final String slug;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
    );
  }

  CategoryEntity
  toEntity() => CategoryEntity(
    id: id,
    name: name,
    slug: slug,
    image: image,
  );
}

class BrandModel {
  final String id;
  final String name;
  final String slug;
  final String image;

  BrandModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
    );
  }

  BrandEntity toEntity() => BrandEntity(
    id: id,
    name: name,
    slug: slug,
    image: image,
  );
}

class SubCategoryModel {
  final String id;
  final String name;
  final String slug;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }

  SubCategoryEntity toEntity() => SubCategoryEntity(
    id: id,
    name: name,
    slug: slug,
  );
}
