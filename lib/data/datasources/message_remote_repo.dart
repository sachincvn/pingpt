import 'dart:convert';
import 'package:pingpt/data/datasources/api_service.dart';
import 'package:pingpt/data/models/message_model.dart';
import '../../core/error/exceptions.dart';

abstract class MessageRemoteRepo {
  Future<MessageModel> getMessageResponse(String userInput);
}

class MessageRemoteRepoImpl implements MessageRemoteRepo {
  final ApiService apiService;

  MessageRemoteRepoImpl({required this.apiService});

  @override
  Future<MessageModel> getMessageResponse(String userInput) async {
    try {
      final response = await apiService.postRequest(userInput);
      final Map<String, dynamic> jsonResponse = json.decode(response);
      final contentJson = jsonResponse['content'] ?? {};
      return MessageModel.fromJson(contentJson);
    } catch (e) {
      throw ServerException();
    }
  }
}
