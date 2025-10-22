part of '../cart.dart';

@Injectable()
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());
}
