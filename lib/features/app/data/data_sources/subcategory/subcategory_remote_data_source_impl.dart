import 'package:dio/dio.dart';
import 'package:route_store/features/app/data/models/subcategory_model.dart';

import '../../../../../core/error/dio_error_handler.dart';
import '../../models/category_model.dart';

import 'subcategory_remote_data_source.dart';

class SubcategoriesRemoteDataSourceImpl implements SubcategoryRemoteDataSource {
  final Dio dio;

  SubcategoriesRemoteDataSourceImpl(this.dio);

  @override
  Future<SubcategoryResponseModel> getSubcategories(String categoryId) async {
    try {
      final response = await dio.get('/categories/$categoryId/subcategories');
      if (response.statusCode == 200 && response.data != null) {
        return SubcategoryResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load subcategories');
      }
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getErrorMessage(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
