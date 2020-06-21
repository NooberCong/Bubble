import 'package:bubble/domain/entities/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'params.freezed.dart';

@freezed
abstract class Params with _$Params {
  const factory Params.userCredentials(
          String email, String password, Map<String, dynamic> details) =
      ParamsCredentials;
  const factory Params.noParams() = ParamsEmpty;
  const factory Params.id(String id) = ParamsID;
  const factory Params.message(Message message) = ParamsMessage;
  const factory Params.map(Map<String, dynamic> data) = ParamsMap;
  const factory Params.messageIdentifier(String roomId, String messageId) =
      ParamsMessageIdentifier;
}
