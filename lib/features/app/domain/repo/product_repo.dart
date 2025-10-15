import '../entities/product_response.dart';

abstract class ProductRepo {
  Future<List<ProductEntity>> getAllProducts({required int page, int limit = 10,});
}
