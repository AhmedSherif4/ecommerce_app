part of '../../checkout.dart';

@Injectable()
class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutState());
  void addPaymentMethod(PaymentMethodModel address) {
    final updated = List<PaymentMethodModel>.from(state.cards)..add(address);
    emit(state.copyWith(cards: updated));
  }

  /// ✅ تحديد العنوان المختار
  void selectPaymentMethod(int index) {
    final updated = state.cards.asMap().entries.map((entry) {
      return entry.value.copyWith(isSelected: entry.key == index);
    }).toList();
    emit(state.copyWith(cards: updated));
  }

  /// ✅ تغيير العنوان الافتراضي
  void setDefaultPaymentMethod(int index) {
    final updated = state.cards.asMap().entries.map((entry) {
      return entry.value.copyWith(isDefault: entry.key == index);
    }).toList();
    emit(state.copyWith(cards: updated));
  }

  /// ✅ تحميل بيانات أولية (اختياري)
  void loadPaymentMethodes() {
    final initial = [
      PaymentMethodModel(
        expireDate: '07/23',
        cardNumber: '**** **** **** 2512',
        securityCode: '133',
        isSelected: false,
        isDefault: false,
      ),
      PaymentMethodModel(
        expireDate: '07/23',
        cardNumber: '**** **** **** 2512',
        securityCode: '133',
        isSelected: false,
        isDefault: false,
      ),
    ];
    emit(state.copyWith(cards: initial));
  }
}
