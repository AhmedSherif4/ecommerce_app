part of '../../my_orders.dart';

@Injectable()
class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit() : super(const MyOrdersState());
  void changeTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
