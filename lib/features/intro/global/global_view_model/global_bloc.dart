import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../domain/global_usecases/global_usecase.dart';
import 'global_event.dart';
import 'global_state.dart';

@Injectable()
class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final GetGuestDataUseCase getGuestData;
  final CheckAppVersionUseCase checkAppVersionUseCase;
  final GetInfoUseCase getInfoUseCase;
  final EditUserDataUseCase editUserDataUseCase;

  bool isLogoutButton = false;
  bool goToWelcome = false;
  bool refreshToken = false;
  bool fromRegister = false;
  bool isChildFromParent = false;

  GlobalBloc(
    this.getGuestData,
    this.checkAppVersionUseCase,
    this.getInfoUseCase,
    this.editUserDataUseCase,
  ) : super(const GlobalState()) {
    on<GetGuestDataEvent>((
      GetGuestDataEvent event,
      Emitter<GlobalState> emit,
    ) async {
      emit(state.copyWith(getGuestDataState: RequestStates.loading));
      final result = await getGuestData(const NoParameter());
      result.fold(
        (l) {
          emit(state.copyWith(getGuestDataState: RequestStates.error));
        },
        (r) {
          emit(
            state.copyWith(
              getGuestDataState: RequestStates.loaded,
              guestData: r.user,
            ),
          );
        },
      );
    });

    on<CheckAppVersionEvent>((
      CheckAppVersionEvent event,
      Emitter<GlobalState> emit,
    ) async {
      emit(state.copyWith(checkAppVersionState: RequestStates.loading));
      final result = await checkAppVersionUseCase(const NoParameter());
      result.fold(
        (l) {
          emit(state.copyWith(checkAppVersionState: RequestStates.error));
        },
        (r) {
          emit(
            state.copyWith(
              checkAppVersionState: RequestStates.loaded,
              appVersionModel: r,
            ),
          );
        },
      );
    });

    on<GetInfoDataEvent>((
      GetInfoDataEvent event,
      Emitter<GlobalState> emit,
    ) async {
      // emit(state.copyWith(
      //   checkAppVersionState: RequestStates.loading,
      // ));
      final result = await getInfoUseCase(const NoParameter());
      result.fold(
        (l) {
          emit(state.copyWith(infoState: RequestStates.error));
        },
        (r) {
          emit(state.copyWith(infoState: RequestStates.loaded, infoModel: r));
        },
      );
    });

    on<EditUserDataEvent>((
      EditUserDataEvent event,
      Emitter<GlobalState> emit,
    ) async {
      emit(state.copyWith(editUseDataEventIsFinish: RequestStates.loading));
      final result = await editUserDataUseCase(const NoParameter());
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              editUseDataEventIsFinish: RequestStates.error,
              editUseDataErrorMessage: failure.message,
            ),
          );
        },
        (success) async {
          emit(state.copyWith(editUseDataEventIsFinish: RequestStates.loaded));
          final userDate = getIt<UserLocalDataSource>().getUserData();
          if (userDate != null) {
            getIt<UserLocalDataSource>().saveUserData(userModel: success);
          }
        },
      );
    });
  }
}
