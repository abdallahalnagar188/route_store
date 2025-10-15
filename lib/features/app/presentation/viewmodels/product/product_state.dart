
import '../../../domain/entities/product_response.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductEntity> products;
  ProductSuccess(this.products);
}
class ProductEndOfList extends ProductState {
  final List<dynamic> products;
  ProductEndOfList(this.products);
}
final class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}