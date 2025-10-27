part of '../home_layout.dart';

class HomeLayoutState extends Equatable {
  final int index;

  final RequestStates checkChildIsSubscribedState;
  final SubscribeChildWithTopicEntity subscribeChildWithTopicEntity;

  const HomeLayoutState({
    this.index = 0,
    this.checkChildIsSubscribedState = RequestStates.initial,
    this.subscribeChildWithTopicEntity = const SubscribeChildWithTopicEntity(
      isSubscribed: false,
      topic: '',
    ),
  });

  HomeLayoutState copyWith({
    List<Widget>? appFlow,
    int? index,
    RequestStates? checkChildIsSubscribedState,
    SubscribeChildWithTopicEntity? subscribeChildWithTopicEntity,
  }) {
    return HomeLayoutState(
      index: index ?? this.index,
      checkChildIsSubscribedState:
          checkChildIsSubscribedState ?? this.checkChildIsSubscribedState,
      subscribeChildWithTopicEntity:
          subscribeChildWithTopicEntity ?? this.subscribeChildWithTopicEntity,
    );
  }

  @override
  List<Object?> get props => [
    index,
    checkChildIsSubscribedState,
    subscribeChildWithTopicEntity,
  ];
}
