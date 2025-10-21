import 'package:equatable/equatable.dart';

class SubscribeChildWithTopicEntity extends Equatable {
  final String topic;
  final bool isSubscribed;

  const SubscribeChildWithTopicEntity({
    required this.topic,
    required this.isSubscribed,
  });

  @override
  List<Object> get props => [topic, isSubscribed];
}
