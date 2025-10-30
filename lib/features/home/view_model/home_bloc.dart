import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/config/extensions/log_extension.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/shared_models/category/category_entity.dart';
import 'package:ecommerce_app/core/shared_models/product/product_entity.dart';
import 'package:ecommerce_app/features/home/home.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
    on<SelectSortEvent>(_selectSort);
    on<UpdateRangeEvent>(_updateRange);
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
        final finalCategories = [
          const CategoryEntity(id: '0', name: 'ALL', createdAt: 'now'),
          ...categories,
        ];
        return emit(
          state.copyWith(
            getAllCategoriesState: RequestStates.loaded,
            categories: finalCategories,
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
    emit(
      state.copyWith(
        getAllProductsState: RequestStates.loading,
        selectedCategoryIndex: event.selectedCategoryIndex,
      ),
    );

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
        products[0].log();
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
    emit(
      state.copyWith(
        getProductsByCategoryState: RequestStates.loading,
        selectedCategoryIndex: event.selectedCategoryIndex,
      ),
    );
    final result = await repository.getProductsByCategory(
      getProductsByCategoryRequest: event.getProductsByCategoryRequest,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getProductsByCategoryState: RequestStates.error,
            getProductsByCategoryMessage: failure.message,
          ),
        );
      },
      (products) {
        return emit(
          state.copyWith(
            getProductsByCategoryState: RequestStates.loaded,
            products: products,
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
      filterProductsRequest: FilterProductsRequest(
        minPrice: state.rangeValues.start,
        maxPrice: state.rangeValues.end,
        sortBy: state.selectedSortType,
      ),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            filterProductsState: RequestStates.error,
            filterProductsMessage: failure.message,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            filterProductsState: RequestStates.loaded,
            products: products,
            filterProductsMessage: 'Products filtered successfully',
          ),
        );
      },
    );
  }

  FutureOr<void> _selectSort(SelectSortEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedSortType: event.selectedSort));
  }

  FutureOr<void> _updateRange(UpdateRangeEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(rangeValues: event.rangeValues));
  }
}
