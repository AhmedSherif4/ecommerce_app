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
