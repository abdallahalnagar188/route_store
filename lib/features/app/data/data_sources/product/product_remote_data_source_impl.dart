import 'package:dio/dio.dart';
import 'package:route_store/features/app/data/data_sources/product/product_remote_data_source.dart';

import '../../models/product_model.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  final Dio dio;

  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<ProductResponseModel> getAllProducts({required int page, int limit = 10}) async{
    try{
      final response = await dio.get('/products?page=$page&limit=$limit');
      if(response.statusCode == 200 && response.data != null){
        return ProductResponseModel.fromJson(response.data);
      }else{
        throw Exception('Failed to load products');
      }

    }catch(e){
      rethrow;
    }
  }
}