part of '../home_layout.dart';

@Injectable()
class HomeLayoutBloc extends Bloc<HomeLayoutEvent, HomeLayoutState> {
  final CheckChildIsSubscribeUseCase checkChildIsSubscribeUseCase;

  HomeLayoutBloc(this.checkChildIsSubscribeUseCase)
    : super(const HomeLayoutState()) {
    on<ChangeBottomNavBarIndexEvent>(_changeBottomNavBar);
    on<CheckChildIsSubscribedEvent>(_checkChildIsSubscribed);
  }
  List<Widget> appFlow = [
    const HomeScreen(),
    const SearchScreen(),
    const SavedScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  void _changeBottomNavBar(
    ChangeBottomNavBarIndexEvent event,
    Emitter<HomeLayoutState> emit,
  ) async {
    emit(state.copyWithState(index: event.index));
  }

  void _checkChildIsSubscribed(
    CheckChildIsSubscribedEvent event,
    Emitter<HomeLayoutState> emit,
  ) async {
    emit(
      state.copyWithState(checkChildIsSubscribedState: RequestStates.loading),
    );
    final result = await checkChildIsSubscribeUseCase(event.childId);
    result.fold(
      (fail) => emit(
        state.copyWithState(checkChildIsSubscribedState: RequestStates.error),
      ),
      (data) => emit(
        state.copyWithState(
          checkChildIsSubscribedState: RequestStates.loaded,
          subscribeChildWithTopicEntity: data,
        ),
      ),
    );
  }
}
