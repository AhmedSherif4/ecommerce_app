import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../domain/splash_usecases/check_token_usecase.dart';
import 'splash_event.dart';
import 'splash_state.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckUserTokenUseCase checkUserTokenUseCase;

  SplashBloc(this.checkUserTokenUseCase) : super(const SplashState()) {
    on<CheckUserTokenEvent>((
      CheckUserTokenEvent event,
      Emitter<SplashState> emit,
    ) async {
      emit(state.copyWith(checkTokenEventIsFinish: RequestStates.loading));
      final result = await checkUserTokenUseCase(const NoParameter());
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              checkTokenEventIsFinish: RequestStates.error,
              checkTokenErrorMessage: failure.message,
              isValidToken: false,
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              checkTokenEventIsFinish: RequestStates.loaded,
              isValidToken: true,
            ),
          );
        },
      );
    });
  }
}
