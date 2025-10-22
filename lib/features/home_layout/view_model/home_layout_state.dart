part of '../home_layout.dart';

class HomeLayoutState extends Equatable {
  final int index;

  final RequestStates checkChildIsSubscribedState;
  final SubscribeChildWithTopicEntity subscribeChildWithTopicEntity;

  final int? selectedSortIndex;
  final RangeValues priceRange; // values in currency units
  final String? selectedSize; // s, m, l, xl, xxl
  final bool isApplying;

  const HomeLayoutState({
    this.index = 0,
    this.checkChildIsSubscribedState = RequestStates.initial,
    this.subscribeChildWithTopicEntity = const SubscribeChildWithTopicEntity(
      isSubscribed: false,
      topic: '',
    ),
    this.selectedSortIndex = 0,
    this.priceRange = const RangeValues(10, 250),
    this.selectedSize = 'L',
    this.isApplying = false,
  });

  HomeLayoutState copyWith({
    List<Widget>? appFlow,
    int? index,
    RequestStates? checkChildIsSubscribedState,
    SubscribeChildWithTopicEntity? subscribeChildWithTopicEntity,
    int? selectedSortIndex,
    RangeValues? priceRange,
    String? selectedSize,
    bool? isApplying,
  }) {
    return HomeLayoutState(
      index: index ?? this.index,
      checkChildIsSubscribedState:
          checkChildIsSubscribedState ?? this.checkChildIsSubscribedState,
      subscribeChildWithTopicEntity:
          subscribeChildWithTopicEntity ?? this.subscribeChildWithTopicEntity,
      selectedSortIndex: selectedSortIndex ?? this.selectedSortIndex,
      priceRange: priceRange ?? this.priceRange,
      selectedSize: selectedSize ?? this.selectedSize,
      isApplying: isApplying ?? this.isApplying,
    );
  }

  @override
  List<Object?> get props => [
    index,
    checkChildIsSubscribedState,
    subscribeChildWithTopicEntity,
    selectedSize,
    priceRange,
    isApplying,
    selectedSortIndex,
  ];
}
