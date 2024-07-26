import 'package:dartz/dartz.dart';
import 'package:pingpt/core/error/failures.dart';
import 'package:pingpt/data/datasources/message_remote_repo.dart';
import 'package:pingpt/domain/entities/message_entity.dart';
import 'package:pingpt/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteRepo messageRemoteRepo;

  MessageRepositoryImpl({required this.messageRemoteRepo});

  @override
  Stream<Either<Failure, MessageEntity>> getMessageStream(
      String userInput) async* {
    try {
      final response = await messageRemoteRepo.getMessageResponse(userInput);
      yield right(response.toEntity());
    } catch (e) {
      yield left(ServerFailure());
    }
  }
}
