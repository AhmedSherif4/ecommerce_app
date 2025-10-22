part of '../home_layout.dart';

abstract class HomeLayoutEvent extends Equatable {}

class ChangeBottomNavBarIndexEvent extends HomeLayoutEvent {
  final int index;

  ChangeBottomNavBarIndexEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class CheckChildIsSubscribedEvent extends HomeLayoutEvent {
  final int childId;

  CheckChildIsSubscribedEvent({required this.childId});
  @override
  List<Object?> get props => [childId];
}

class SelectSortEvent extends HomeLayoutEvent {
  final int index;
  SelectSortEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class UpdateRangeEvent extends HomeLayoutEvent {
  final RangeValues values;
  UpdateRangeEvent(this.values);

  @override
  List<Object?> get props => [values];
}

class SelectSizeEvent extends HomeLayoutEvent {
  final String? size;
  SelectSizeEvent(this.size);

  @override
  List<Object?> get props => [size];
}

class ApplyFiltersEvent extends HomeLayoutEvent {
  ApplyFiltersEvent();
  @override
  List<Object?> get props => [];
}
