import '../../domain/entities/category_response.dart';
import '../../domain/repo/categories_repo.dart';
import '../data_sources/category/category_remote_data_source.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource remoteDataSource;

  CategoriesRepoImpl(this.remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final response = await remoteDataSource.getCategories();
      return response.data; // Already List<CategoryEntity> since CategoryModel extends CategoryEntity
    } catch (e) {
      rethrow;
    }
  }
}