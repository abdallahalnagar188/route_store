class SubcategoryEntity {
    final String id;
    final String name;
    final String slug;
    final String category;
    final DateTime createdAt;
    final DateTime updatedAt;

    SubcategoryEntity({
        required this.id,
        required this.name,
        required this.slug,
        required this.category,
        required this.createdAt,
        required this.updatedAt,
    });
}

class SubcategoryResponseEntity {
    final int results;
    final MetadataEntity metadata;
    final List<SubcategoryEntity> data;

    SubcategoryResponseEntity({
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
