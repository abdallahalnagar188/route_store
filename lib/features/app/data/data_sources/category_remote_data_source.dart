import 'package:dio/dio.dart';

import '../../../../core/error/dio_error_handler.dart';
import '../models/category_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoryResponseModel> getCategories();
}
