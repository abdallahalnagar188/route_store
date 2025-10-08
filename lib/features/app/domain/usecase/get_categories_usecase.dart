
import '../entities/category_response.dart';
import '../repo/categories_repo.dart';

class GetCategoriesUseCase {
  final CategoriesRepo repository;

  GetCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() async {
    return await repository.getCategories();
  }
}