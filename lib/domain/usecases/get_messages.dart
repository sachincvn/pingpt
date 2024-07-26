import 'package:dartz/dartz.dart';
import '../repositories/message_repository.dart';
import '../../core/error/failures.dart';
import '../entities/message_entity.dart';

class GetMessages {
  final MessageRepository repository;

  GetMessages(this.repository);

  Stream<Either<Failure, MessageEntity>> call(String userInput) {
    return repository.getMessageStream(userInput);
  }
}
