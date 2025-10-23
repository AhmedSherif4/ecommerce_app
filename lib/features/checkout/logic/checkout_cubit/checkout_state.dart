part of '../../checkout.dart';

class CheckoutState extends Equatable {
  final List<PaymentMethodModel> cards;

  const CheckoutState({this.cards = const []});

  CheckoutState copyWith({List<PaymentMethodModel>? cards}) {
    return CheckoutState(cards: cards ?? this.cards);
  }

  @override
  List<Object> get props => [cards];
}
