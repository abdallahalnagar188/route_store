import '../entities/category_response.dart';

abstract class CategoriesRepo {
  Future<List<CategoryEntity>> getCategories();
  Future<List<CategoryEntity>> getPagingCategories(int page);
}