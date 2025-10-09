import 'package:route_store/features/app/data/data_sources/subcategory/subcategory_remote_data_source.dart';
import 'package:route_store/features/app/domain/entities/subcaetegory_response.dart';

import '../../domain/repo/subcategory_repo.dart';

class SubcategoryRepoImpl implements SubcategoryRepo {
  final SubcategoryRemoteDataSource dataSource;

  SubcategoryRepoImpl(this.dataSource);

  @override
  Future<List<SubcategoryEntity>> getSubcategories(String categoryId) async{
    try {
      final response =await dataSource.getSubcategories(categoryId);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
