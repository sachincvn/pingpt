import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/error/exceptions.dart';

class ApiService {
  final http.Client client;
  final String apiUrl;

  ApiService({
    required this.client,
    required this.apiUrl,
  });

  Future<String> postRequest(String userInput) async {
    try {
      final response = await client.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "text": [
            {
              "text": userInput,
              "id": "RCkEriCnh6RBxOjr7vnXU16lKMt1",
              "date": DateTime.now().toIso8601String().split('T')[0],
              "time":
                  DateTime.now().toIso8601String().split('T')[1].split('.')[0],
            }
          ],
          "conversation_status": "1",
          "user_id": "RCkEriCnh6RBxOjr7vnXU16lKMt1",
          "date": DateTime.now().toIso8601String().split('T')[0],
          "time": DateTime.now().toIso8601String().split('T')[1].split('.')[0],
          "showCalLogo": false,
          "isImage": false,
          "isLocalImage": false,
          "isImageThenText": "",
          "isHeading": false,
          "headingText": "",
          "isSubHeading": false,
          "subHeadingText": "",
          "isfetchlocalimage": false,
          "isAutomatic": false,
        }),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
