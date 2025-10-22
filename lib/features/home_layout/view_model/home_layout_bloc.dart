part of '../home_layout.dart';

@Injectable()
class HomeLayoutBloc extends Bloc<HomeLayoutEvent, HomeLayoutState> {
  final CheckChildIsSubscribeUseCase checkChildIsSubscribeUseCase;

  HomeLayoutBloc(this.checkChildIsSubscribeUseCase)
    : super(const HomeLayoutState()) {
    on<ChangeBottomNavBarIndexEvent>(_changeBottomNavBar);
    on<CheckChildIsSubscribedEvent>(_checkChildIsSubscribed);
    on<SelectSortEvent>(_onSelectSort);
    on<UpdateRangeEvent>(_onUpdateRange);
    on<SelectSizeEvent>(_onSelectSize);
    on<ApplyFiltersEvent>(_onApplyFilters);
  }
  List<Widget> appFlow = [
    const HomeScreen(),
    const SearchScreen(value: ''),
    const SavedScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  void _changeBottomNavBar(
    ChangeBottomNavBarIndexEvent event,
    Emitter<HomeLayoutState> emit,
  ) async {
    emit(state.copyWith(index: event.index));
  }

  void _checkChildIsSubscribed(
    CheckChildIsSubscribedEvent event,
    Emitter<HomeLayoutState> emit,
  ) async {
    emit(state.copyWith(checkChildIsSubscribedState: RequestStates.loading));
    final result = await checkChildIsSubscribeUseCase(event.childId);
    result.fold(
      (fail) => emit(
        state.copyWith(checkChildIsSubscribedState: RequestStates.error),
      ),
      (data) => emit(
        state.copyWith(
          checkChildIsSubscribedState: RequestStates.loaded,
          subscribeChildWithTopicEntity: data,
        ),
      ),
    );
  }

  void _onSelectSort(SelectSortEvent event, Emitter<HomeLayoutState> emit) {
    if (state.selectedSortIndex != event.index) {
      emit(state.copyWith(selectedSortIndex: event.index));
    }
  }

  void _onUpdateRange(UpdateRangeEvent event, Emitter<HomeLayoutState> emit) {
    emit(state.copyWith(priceRange: event.values));
  }

  void _onSelectSize(SelectSizeEvent event, Emitter<HomeLayoutState> emit) {
    emit(state.copyWith(selectedSize: event.size));
  }

  Future<void> _onApplyFilters(
    ApplyFiltersEvent event,
    Emitter<HomeLayoutState> emit,
  ) async {
    emit(state.copyWith(isApplying: true));
    await Future.delayed(const Duration(milliseconds: 300)); // simulate work
    emit(state.copyWith(isApplying: false));
  }
}
