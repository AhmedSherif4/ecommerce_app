part of '../search.dart';

@Injectable()
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchBaseRepository repository;

  // لحفظ آخر 5 searches فقط
  static const int maxRecentSearches = 5;

  SearchBloc(this.repository) : super(const SearchState()) {
    // Search Events
    on<SearchProductsEvent>(_searchProducts);
    on<ChangeSearchValueEvent>(_changeSearchValue);
    on<ClearRecentSearchesEvent>(_clearRecentSearches);
    on<EmptyTextEvent>(_emptyText);
  }

  void _changeSearchValue(
    ChangeSearchValueEvent event,
    Emitter<SearchState> emit,
  ) {
    final value = event.value;

    emit(state.copyWith(searchQuery: value));

    if (value.trim().isEmpty) {
      // إذا كان الحقل فارغ → عرض recent searches
      emit(
        state.copyWith(
          showRecent: true,
          searchedProducts: [],
          noResultsFound: false,
          searchProductsState: RequestStates.initial,
        ),
      );
    } else {
      // إذا كان هناك نص → نفذ البحث الفعلي من الـ API
      add(
        SearchProductsEvent(
          searchProductsRequest: SearchProductsRequest(
            searchTerm: value,
            page: 1,
            limitPerPage: 20,
          ),
        ),
      );
    }
  }

  void _searchProducts(
    SearchProductsEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(searchProductsState: RequestStates.loading));

    final result = await repository.searchProducts(
      searchProductsRequest: event.searchProductsRequest,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            searchProductsState: RequestStates.error,
            searchProductsMessage: failure.message,
            noResultsFound: true,
            showRecent: false,
          ),
        );
      },
      (products) {
        if (products.isEmpty) {
          // لو مفيش نتائج
          emit(
            state.copyWith(
              searchProductsState: RequestStates.loaded,
              searchedProducts: [],
              noResultsFound: true,
              showRecent: false,
            ),
          );
        } else {
          // عندنا نتائج → ابدأ save في recent searches
          final updatedRecent = [
            event.searchProductsRequest.searchTerm,
            ...state.recentSearches.where(
              (r) => r != event.searchProductsRequest.searchTerm,
            ),
          ];

          emit(
            state.copyWith(
              searchProductsState: RequestStates.loaded,
              searchedProducts: products,
              noResultsFound: false,
              showRecent: false,
              recentSearches: updatedRecent.take(maxRecentSearches).toList(),
            ),
          );
        }
      },
    );
  }

  void _clearRecentSearches(
    ClearRecentSearchesEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(recentSearches: []));
  }

  void _emptyText(EmptyTextEvent event, Emitter<SearchState> emit) {
    emit(
      state.copyWith(
        showRecent: true,
        searchedProducts: [],
        noResultsFound: false,
        searchProductsState: RequestStates.initial,
      ),
    );
  }
}
