import 'package:route_store/features/app/domain/repo/subcategory_repo.dart';

import '../entities/subcaetegory_response.dart';

class GetSubCategoryUseCase{
  final SubcategoryRepo repo;

  GetSubCategoryUseCase(this.repo);

  Future<List<SubcategoryEntity>> call(String categoryId) async {
    return await repo.getSubcategories(categoryId);
  }

}