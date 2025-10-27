part of '../saved.dart';

class SavedState extends Equatable {
  final List<ProductEntity> favourites;
  final RequestStates favouriteState;
  final String errorMessage;

  const SavedState({
    this.favourites = const [],
    this.favouriteState = RequestStates.initial,
    this.errorMessage = '',
  });

  SavedState copyWith({
    List<ProductEntity>? favourites,
    RequestStates? favouriteState,
    String? errorMessage,
  }) {
    return SavedState(
      favourites: favourites ?? this.favourites,
      favouriteState: favouriteState ?? this.favouriteState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [favourites, favouriteState, errorMessage];
}
