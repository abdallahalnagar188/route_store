import '../entities/subcaetegory_response.dart';


abstract class SubcategoryRepo {
  Future<List<SubcategoryEntity>> getSubcategories(String categoryId);
}
