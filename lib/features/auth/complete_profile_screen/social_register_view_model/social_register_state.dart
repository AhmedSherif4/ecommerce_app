import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:equatable/equatable.dart';

class SocialRegisterState extends Equatable {
  final RequestStates signUpStates;
  final String signUpMessage;

  const SocialRegisterState({
    this.signUpStates = RequestStates.initial,
    this.signUpMessage = '',
  });

  SocialRegisterState copyWith({
    RequestStates? signUpStates,
    String? signUpMessage,
  }) {
    return SocialRegisterState(
      signUpStates: signUpStates ?? this.signUpStates,
      signUpMessage: signUpMessage ?? this.signUpMessage,
    );
  }

  @override
  List<Object> get props => [signUpStates, signUpMessage];
}
