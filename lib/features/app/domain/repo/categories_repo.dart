


import '../entities/category_response.dart';

abstract class CategoriesRepo {
  Future<List<CategoryEntity>> getCategories();
}