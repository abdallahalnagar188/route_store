import 'package:route_store/features/app/data/models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<ProductResponseModel> getAllProducts({required int page, int limit = 10});
}