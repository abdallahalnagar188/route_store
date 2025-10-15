
import 'package:route_store/features/app/domain/repo/product_repo.dart';

import '../../domain/entities/product_response.dart';
import '../data_sources/product/product_remote_data_source.dart';

class ProductRepoImpl extends ProductRepo{
  final ProductRemoteDataSource remoteDataSource;

  ProductRepoImpl(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> getAllProducts({required int page, int limit = 10})async {
   try{
     final response = await remoteDataSource.getAllProducts(page: page, limit: limit);
     return response.data.map((model) => model.toEntity()).toList();
   }catch(e){
     rethrow;
   }
  }
}