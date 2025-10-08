// domain/entities/category_entity.dart

class CategoryEntity {
    final String id;
    final String name;
    final String slug;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;

    CategoryEntity({
        required this.id,
        required this.name,
        required this.slug,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

}

// domain/entities/category_response_entity.dart

class CategoryResponseEntity {
    final int results;
    final MetadataEntity metadata;
    final List<CategoryEntity> data;

    CategoryResponseEntity({
        required this.results,
        required this.metadata,
        required this.data,
    });
}

class MetadataEntity {
    final int currentPage;
    final int numberOfPages;
    final int limit;

    MetadataEntity({
        required this.currentPage,
        required this.numberOfPages,
        required this.limit,
    });
}