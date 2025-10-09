import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_store/features/app/domain/usecase/get_subcategory_usecase.dart';

import '../../../domain/entities/subcaetegory_response.dart';

part 'subcategory_state.dart';

// Cubit
class SubcategoryCubit extends Cubit<SubcategoryState> {
  final GetSubCategoryUseCase getSubCategoryUseCase;

  SubcategoryCubit( this.getSubCategoryUseCase) : super(SubcategoryInitial());

  Future<void> fetchSubcategories(String categoryId) async {
    emit(SubcategoryLoading());
    try {
      final subcategories = await getSubCategoryUseCase(categoryId);
      emit(SubcategorySuccess(subcategories));
    } catch (e) {
      emit(SubcategoryError(e.toString()));
    }
  }
}
