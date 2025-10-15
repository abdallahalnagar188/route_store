import 'package:dio/dio.dart';

import '../../models/category_model.dart';


abstract class CategoriesRemoteDataSource {
  Future<CategoryResponseModel> getCategories();
  Future<CategoryResponseModel> getPagingCategories(int page);
}
