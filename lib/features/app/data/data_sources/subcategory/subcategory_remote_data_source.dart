import 'package:dio/dio.dart';

import '../../models/category_model.dart';
import '../../models/subcategory_model.dart';


abstract class SubcategoryRemoteDataSource {
  Future<SubcategoryResponseModel> getSubcategories(String categoryId);
}
