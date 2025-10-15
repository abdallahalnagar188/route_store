import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_store/features/app/domain/usecase/get_products_usecase.dart';
import 'package:route_store/features/app/presentation/viewmodels/product/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProductsUseCase getProductsUseCase;

  int _currentPage = 1;
  bool _isFetching = false;
  final int _limit = 10;
  List<dynamic> _allProducts = [];

  ProductCubit(this.getProductsUseCase) : super(ProductInitial());

  Future<void> fetchProducts({bool isRefresh = false}) async {
    if (_isFetching) return; // prevent multiple simultaneous calls
    _isFetching = true;

    if (isRefresh) {
      _currentPage = 1;
      _allProducts.clear();
      emit(ProductLoading());
    }

    try {
      final products = await getProductsUseCase(page: _currentPage, limit: _limit);

      if (products.isEmpty) {
        emit(ProductEndOfList(_allProducts)); // No more data
      } else {
        _allProducts.addAll(products);
        emit(ProductSuccess(List.from(_allProducts)));
        _currentPage++;
      }
    } catch (e) {
      emit(ProductError(e.toString()));
    } finally {
      _isFetching = false;
    }
  }
}
