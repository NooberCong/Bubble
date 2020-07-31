import 'package:bubble/core/failures/failure.dart';
import 'package:bubble/core/params/params.dart';
import 'package:bubble/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class ICloudDataService {
  Future<Either<CloudFailure, Stream>> fetchUserStatusStream(Params params);
  Future<Either<CloudFailure, User>> fetchUserByUID(Params params);
  Future<Either<CloudFailure, User>> fetchRandomUser(Params params);
  Future<Either<CloudFailure, Map<String, dynamic>>> updateUserData(
      Params params);
  Future<Either<CloudFailure, Map<String, dynamic>>> addConversation(
      Params params);
  Future<Either<CloudFailure, void>> deleteChatHistory(Params params);
  Future<Either<CloudFailure, Stream>> fetchConversationStream(Params params);
  Future<Either<CloudFailure, Stream>> fetchConverstionSnapShotsStream(
      Params params);
  Future<Either<CloudFailure, Stream>> fetchUserDetailsStream(Params params);
  Future<Either<CloudFailure, void>> addMessage(Params params);
  Future<Either<CloudFailure, void>> deleteMessage(Params params);
  Future<Either<CloudFailure, void>> reactToMessage(Params params);
  Future<Either<CloudFailure, void>> markMessageAsSeen(Params params);
  Future<Either<CloudFailure, void>> updateConversationData(Params params);
  Future<Either<CloudFailure, List<String>>> fetchConversationPhotos(
      Params params);
}
