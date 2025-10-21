import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:ecommerce_app/features/auth/complete_profile_screen/social_register_view_model/social_register_event.dart';
import 'package:ecommerce_app/features/auth/complete_profile_screen/social_register_view_model/social_register_state.dart';
import 'package:injectable/injectable.dart';

import '../domain/social_register_usecases/social_register_usecase.dart';

@Injectable()
class SocialRegisterBloc
    extends Bloc<SocialRegisterEvent, SocialRegisterState> {
  final SocialRegisterCodeUseCase socialRegisterUseCase;

  late UserEntity userData;

  SocialRegisterBloc(this.socialRegisterUseCase)
    : super(const SocialRegisterState()) {
    on<SignedUpEvent>((event, emit) async {
      emit(state.copyWith(signUpStates: RequestStates.loading));
      final result = await socialRegisterUseCase(event.signUpParameter);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              signUpStates: RequestStates.error,
              signUpMessage: failure.message.toString(),
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              signUpStates: RequestStates.loaded,
              signUpMessage: 'Completed Profile Successfully!',
            ),
          );
          userData = success;
        },
      );
    });
  }
}
