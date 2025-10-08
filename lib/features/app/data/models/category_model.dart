// data/models/category_model.dart


import '../../domain/entities/category_response.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.image,
    required super.createdAt,
    required super.updatedAt,
  });

  // From JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // To Entity
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// data/models/category_response_model.dart

class CategoryResponseModel extends CategoryResponseEntity {
  CategoryResponseModel({
    required super.results,
    required super.metadata,
    required super.data,
  });

  // From JSON
  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      results: json['results'] ?? 0,
      metadata: MetadataModel.fromJson(json['metadata'] ?? {}),
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => CategoryModel.fromJson(item))
          .toList() ??
          [],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'metadata': (metadata as MetadataModel).toJson(),
      'data': data.map((item) => (item as CategoryModel).toJson()).toList(),
    };
  }

  // To Entity
  CategoryResponseEntity toEntity() {
    return CategoryResponseEntity(
      results: results,
      metadata: metadata,
      data: data,
    );
  }
}

class MetadataModel extends MetadataEntity {
  MetadataModel({
    required super.currentPage,
    required super.numberOfPages,
    required super.limit,
  });

  // From JSON
  factory MetadataModel.fromJson(Map<String, dynamic> json) {
    return MetadataModel(
      currentPage: json['currentPage'] ?? 1,
      numberOfPages: json['numberOfPages'] ?? 1,
      limit: json['limit'] ?? 40,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'numberOfPages': numberOfPages,
      'limit': limit,
    };
  }
}