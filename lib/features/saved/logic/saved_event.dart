part of '../saved.dart';

abstract class SavedEvent extends Equatable {
  const SavedEvent();

  @override
  List<Object> get props => [];
}

class GetUserFavoritesEvent extends SavedEvent {
  final GetUserFavoritesRequest getUserFavoritesRequest;

  const GetUserFavoritesEvent({required this.getUserFavoritesRequest});

  @override
  List<Object> get props => [getUserFavoritesRequest];
}

class AddToFavoritesEvent extends SavedEvent {
  final AddToFavoritesRequest addToFavoritesRequest;

  const AddToFavoritesEvent({required this.addToFavoritesRequest});

  @override
  List<Object> get props => [addToFavoritesRequest];
}

class RemoveFromFavoritesEvent extends SavedEvent {
  final RemoveFromFavoritesRequest removeFromFavoritesRequest;

  const RemoveFromFavoritesEvent({required this.removeFromFavoritesRequest});

  @override
  List<Object> get props => [removeFromFavoritesRequest];
}

class LoadMoreFavoritesEvent extends SavedEvent {
  const LoadMoreFavoritesEvent();

  @override
  List<Object> get props => [];
}
