part of '../saved.dart';

@Injectable()
class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(const SavedState());

  List<ProductModel> favs = dummyProducts;

  void getAllFavourites() {
    // implement get favs from api
    emit(
      state.copyWith(favourites: favs, favouriteState: RequestStates.loaded),
    );
  }

  //todo: دي هترجع من الapi كدا كدا
  bool isFavourite(String productId) {
    return state.favourites.any((item) => item.id == productId);
  }

  // هاتضيفها من الapi ولو اتضافهت تقوم ضايفها  عندك
  void _addFavourite(ProductModel product) {
    final updated = List<ProductModel>.from(state.favourites)..add(product);
    emit(
      state.copyWith(favourites: updated, favouriteState: RequestStates.loaded),
    );
  }

  // هاتمسحها من الapi ولو اتمسحت تقوم ماسحها من عندك
  void _removeFavourite(String productId) {
    final updated = List<ProductModel>.from(state.favourites)
      ..removeWhere((item) => item.id == productId);
    emit(
      state.copyWith(favourites: updated, favouriteState: RequestStates.loaded),
    );
  }

  void toggleFavourite(ProductModel product) {
    emit(state.copyWith(favouriteState: RequestStates.loading));
    if (isFavourite(product.id)) {
      _removeFavourite(product.id);
    } else {
      _addFavourite(product);
    }
  }
}
