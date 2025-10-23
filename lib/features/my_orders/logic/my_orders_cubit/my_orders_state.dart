part of '../../my_orders.dart';

class MyOrdersState extends Equatable {
  final int currentIndex;

  const MyOrdersState({this.currentIndex = 0});

  MyOrdersState copyWith({int? currentIndex}) {
    return MyOrdersState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object> get props => [currentIndex];
}
