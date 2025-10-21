import '../../../domain/entity/subscribe_child_entity.dart';

class SubscribeChildWithTopicModel extends SubscribeChildWithTopicEntity {
  const SubscribeChildWithTopicModel({
    required super.topic,
    required super.isSubscribed,
  });

  factory SubscribeChildWithTopicModel.fromJson(Map<String, dynamic> json) {
    return SubscribeChildWithTopicModel(
      topic: json['topic_name'] ?? '',
      isSubscribed: json['subscriber'] ?? false,
    );
  }
}
