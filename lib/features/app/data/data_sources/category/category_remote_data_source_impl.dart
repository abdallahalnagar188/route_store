import 'package:dio/dio.dart';

import '../../../../../core/error/dio_error_handler.dart';
import '../../models/category_model.dart';

import 'category_remote_data_source.dart';

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final Dio dio;

  CategoriesRemoteDataSourceImpl(this.dio);

  @override
  Future<CategoryResponseModel> getCategories() async {
    try {
      final response = await dio.get('/categories');

      if (response.statusCode == 200 && response.data != null) {
        return CategoryResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load categories');
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getErrorMessage(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<CategoryResponseModel> getPagingCategories(int page) async{
    try{
      final response = await dio.get('/categories?page=$page');
      if(response.statusCode == 200 && response.data != null){
        return CategoryResponseModel.fromJson(response.data);
      }else{
        throw Exception('Failed to load categories');
      }
    }on DioException catch(e){
      throw Exception(DioErrorHandler.getErrorMessage(e));
    }catch(e){
      throw Exception('Unexpected error: $e');
    }
  }
}