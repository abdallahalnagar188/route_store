part of 'subcategory_cubit.dart';

abstract class SubcategoryState {}

final class SubcategoryInitial extends SubcategoryState {}

final class SubcategoryLoading extends SubcategoryState {}

final class SubcategorySuccess extends SubcategoryState {
  final List<SubcategoryEntity> subcategories;
  SubcategorySuccess(this.subcategories);
}

final class SubcategoryError extends SubcategoryState {
  final String message;
  SubcategoryError(this.message);
}