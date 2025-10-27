part of '../search.dart';

@Injectable()
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  // 🧠 Simulated list of all products (normally from API or repo)
  final List<ProductModel> allProducts = []; //todo:

  // 🧠 Function to handle text change
  void changeValue(String value) {
    emit(state.copyWith(value: value));

    if (value.trim().isEmpty) {
      // لو المستخدم مسح النص → أظهر الـ recent searches
      emit(
        state.copyWith(
          showRecent: true,
          searchedProducts: [],
          noResultsFound: false,
        ),
      );
    } else {
      // لو فيه نص → نفذ البحث
      searchProducts(value);
    }
  }

  // 🔍 Search implementation
  void searchProducts(String query) {
    final results = allProducts
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      emit(
        state.copyWith(
          searchedProducts: [],
          showRecent: false,
          noResultsFound: true,
        ),
      );
    } else {
      // حفظ النتيجة + تحديث recent searches
      final updatedRecent = [
        query,
        ...state.recentSearches.where((r) => r != query),
      ];

      emit(
        state.copyWith(
          searchedProducts: results,
          showRecent: false,
          noResultsFound: false,
          recentSearches: updatedRecent.take(5).toList(), // آخر 5 فقط
        ),
      );
    }
  }

  // 🗑️ Clear all recent searches
  void clearRecent() {
    emit(state.copyWith(recentSearches: []));
  }
}
