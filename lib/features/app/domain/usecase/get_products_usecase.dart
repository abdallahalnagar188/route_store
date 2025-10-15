import '../entities/product_response.dart';
import '../repo/product_repo.dart';

class GetAllProductsUseCase {
  final ProductRepo repository;

  GetAllProductsUseCase(this.repository);

  Future<List<ProductEntity>> call({required int page, int limit = 10}) {
    return repository.getAllProducts(page: page, limit: limit);
  }
}
