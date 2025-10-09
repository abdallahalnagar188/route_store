import '../../domain/entities/subcaetegory_response.dart';

class SubcategoryModel extends SubcategoryEntity {
  SubcategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.category,
    required super.createdAt,
    required super.updatedAt,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      category: json['category'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  SubcategoryEntity toEntity() {
    return SubcategoryEntity(
      id: id,
      name: name,
      slug: slug,
      category: category,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}


class SubcategoryResponseModel extends SubcategoryResponseEntity {
  SubcategoryResponseModel({
    required super.results,
    required super.metadata,
    required super.data,
  });

  factory SubcategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryResponseModel(
      results: json['results'] ?? 0,
      metadata: MetadataModel.fromJson(json['metadata'] ?? {}),
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => SubcategoryModel.fromJson(item))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'metadata': (metadata as MetadataModel).toJson(),
      'data': data.map((item) => (item as SubcategoryModel).toJson()).toList(),
    };
  }

  SubcategoryResponseEntity toEntity() {
    return SubcategoryResponseEntity(
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

  factory MetadataModel.fromJson(Map<String, dynamic> json) {
    return MetadataModel(
      currentPage: json['currentPage'] ?? 1,
      numberOfPages: json['numberOfPages'] ?? 1,
      limit: json['limit'] ?? 40,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'numberOfPages': numberOfPages,
      'limit': limit,
    };
  }
}
