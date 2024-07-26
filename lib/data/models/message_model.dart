import 'package:pingpt/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required String content,
    required String date,
    required String time,
  }) : super(content: content, date: date, time: time);

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final content = json['content'] ?? '';
    final date = DateTime.now().toIso8601String().split('T')[0];
    final time = DateTime.now().toIso8601String().split('T')[1].split('.')[0];
    return MessageModel(
      content: content,
      date: date,
      time: time,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': {
        'content': content,
        'functional_intent': 'false',
      },
      'date': date,
      'time': time,
    };
  }

  MessageEntity toEntity() {
    return MessageEntity(
      content: content,
      date: date,
      time: time,
    );
  }
}
