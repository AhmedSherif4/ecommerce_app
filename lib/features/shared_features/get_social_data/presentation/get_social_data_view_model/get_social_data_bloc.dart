import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/enum/enum_generation.dart';
import '../../domain/use_cases/get_apple_data.dart';
import '../../domain/use_cases/get_google_data.dart';
import 'get_social_data_event.dart';
import 'get_social_data_state.dart';

@injectable
class GetSocialDataBloc extends Bloc<GetSocialDataEvent, GetSocialDataState> {
  final GetGoogleDataUseCase getGoogleDataUseCase;
  final GetAppleDataUseCase getAppleDataUseCase;

  GetSocialDataBloc({
    required this.getGoogleDataUseCase,
    required this.getAppleDataUseCase,
  }) : super(const GetSocialDataState()) {
    on<GetGoogleDataEvent>((event, emit) async {
      emit(
        state.copyWith(
          getGoogleDataState: RequestStates.loading,
          getAppleDataState: RequestStates.initial,
        ),
      );
      try {
        final result = await getGoogleDataUseCase();
        result.fold(
          (l) => emit(
            state.copyWith(
              getGoogleDataState: RequestStates.error,
              loginMessage: l.message,
            ),
          ),
          (data) {
            emit(
              state.copyWith(
                getGoogleDataState: RequestStates.loaded,
                isCompletedProfile: data.isCompletedProfile,
                user: data.user,
                loginMessage: 'Successfully logged in with Google',
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            getGoogleDataState: RequestStates.error,
            loginMessage: e.toString(),
          ),
        );
      }
    });
    on<GetAppleDataEvent>((event, emit) async {
      emit(
        state.copyWith(
          getAppleDataState: RequestStates.loading,
          getGoogleDataState: RequestStates.initial,
        ),
      );
      try {
        final result = await getAppleDataUseCase();
        result.fold(
          (l) => emit(
            state.copyWith(
              getAppleDataState: RequestStates.error,
              loginMessage: l.message,
            ),
          ),
          (r) {
            emit(
              state.copyWith(
                getAppleDataState: RequestStates.loaded,
                //todo when implementing apple login complete this
                isCompletedProfile: false,
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            getAppleDataState: RequestStates.error,
            loginMessage: e.toString(),
          ),
        );
      }
    });
  }
}
