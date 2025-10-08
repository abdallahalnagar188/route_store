import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/category_response.dart';
import '../../../domain/usecase/get_categories_usecase.dart';

part 'categories_state.dart';

// Cubit
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesCubit({required this.getCategoriesUseCase})
      : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    try {
      final categories = await getCategoriesUseCase();
      emit(CategoriesSuccess(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}