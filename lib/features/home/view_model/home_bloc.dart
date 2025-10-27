import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/shared_models/category/category_entity.dart';
import 'package:ecommerce_app/core/shared_models/product/product_entity.dart';
import 'package:ecommerce_app/core/shared_models/product/product_model.dart';
import 'package:ecommerce_app/features/home/home.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeBaseRepository repository;
  HomeBloc(this.repository) : super(const HomeState()) {
    on<GetAllCategoriesEvent>(_getAllCategories);
    on<GetAllProductsEvent>(_getAllProducts);
    on<GetProductsByCategoryEvent>(_getProductsByCategory);
    on<FilterProductsEvent>(_filterProducts);
  }

  void _getAllCategories(
    GetAllCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getAllCategoriesState: RequestStates.loading));

    final result = await repository.getAllCategories();

    result.fold(
      (failure) => emit(
        state.copyWith(
          getAllCategoriesState: RequestStates.error,
          getAllCategoriesMessage: failure.message,
        ),
      ),
      (categories) {
        return emit(
          state.copyWith(
            getAllCategoriesState: RequestStates.loaded,
            categories: categories,
            getAllCategoriesMessage: 'Categories retrieved successfully',
          ),
        );
      },
    );
  }

  void _getAllProducts(
    GetAllProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getAllProductsState: RequestStates.loading));

    final result = await repository.getAllProducts(
      getAllProductsRequest: event.getAllProductsRequest,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          getAllProductsState: RequestStates.error,
          getAllProductsMessage: failure.message,
        ),
      ),
      (products) {
        return emit(
          state.copyWith(
            getAllProductsState: RequestStates.loaded,
            products: products,
            getAllProductsMessage: 'Products retrieved successfully',
          ),
        );
      },
    );
  }

  void _getProductsByCategory(
    GetProductsByCategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getProductsByCategoryState: RequestStates.loading));

    final result = await repository.getProductsByCategory(
      getProductsByCategoryRequest: event.getProductsByCategoryRequest,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          getProductsByCategoryState: RequestStates.error,
          getProductsByCategoryMessage: failure.message,
        ),
      ),
      (products) {
        return emit(
          state.copyWith(
            getProductsByCategoryState: RequestStates.loaded,
            categoryProducts: products,
            getProductsByCategoryMessage: 'Products fetched successfully',
          ),
        );
      },
    );
  }

  void _filterProducts(
    FilterProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(filterProductsState: RequestStates.loading));

    final result = await repository.filterProducts(
      filterProductsRequest: event.filterProductsRequest,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          filterProductsState: RequestStates.error,
          filterProductsMessage: failure.message,
        ),
      ),
      (products) {
        return emit(
          state.copyWith(
            filterProductsState: RequestStates.loaded,
            filteredProducts: products,
            filterProductsMessage: 'Products filtered successfully',
          ),
        );
      },
    );
  }
}
