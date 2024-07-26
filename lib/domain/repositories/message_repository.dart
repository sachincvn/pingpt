import 'package:dartz/dartz.dart';
import 'package:pingpt/core/error/failures.dart';
import 'package:pingpt/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Stream<Either<Failure, MessageEntity>> getMessageStream(String userInput);
}
