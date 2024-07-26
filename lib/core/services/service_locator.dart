import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pingpt/data/datasources/api_service.dart';
import 'package:pingpt/data/datasources/message_remote_repo.dart';

import '../../data/repositories/message_repository_impl.dart';
import '../../domain/repositories/message_repository.dart';
import '../../domain/usecases/get_messages.dart';
import '../../presentation/viewmodels/chat_viewmodel.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External Dependencies
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<ApiService>(() => ApiService(
        client: sl(),
        apiUrl: 'http://54.198.10.103:8080/ai/RCkEriCnh6RBxOjr7vnXU16lKMt1',
      ));

  // Data Sources
  sl.registerLazySingleton<MessageRemoteRepo>(() => MessageRemoteRepoImpl(
        apiService: sl(),
      ));

  // Repositories
  sl.registerLazySingleton<MessageRepository>(() => MessageRepositoryImpl(
        messageRemoteRepo: sl(),
      ));

  // Use Cases
  sl.registerLazySingleton<GetMessages>(() => GetMessages(sl()));

  // View Models
  sl.registerFactory<ChatViewModel>(() => ChatViewModel(
        getMessages: sl(),
      ));
}
