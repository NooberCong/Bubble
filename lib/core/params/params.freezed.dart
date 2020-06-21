// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ParamsTearOff {
  const _$ParamsTearOff();

  ParamsCredentials userCredentials(
      String email, String password, Map<String, dynamic> details) {
    return ParamsCredentials(
      email,
      password,
      details,
    );
  }

  ParamsEmpty noParams() {
    return const ParamsEmpty();
  }

  ParamsID id(String id) {
    return ParamsID(
      id,
    );
  }

  ParamsMessage message(Message message) {
    return ParamsMessage(
      message,
    );
  }

  ParamsMap map(Map<String, dynamic> data) {
    return ParamsMap(
      data,
    );
  }

  ParamsMessageIdentifier messageIdentifier(String roomId, String messageId) {
    return ParamsMessageIdentifier(
      roomId,
      messageId,
    );
  }
}

// ignore: unused_element
const $Params = _$ParamsTearOff();

mixin _$Params {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result userCredentials(
            String email, String password, Map<String, dynamic> details),
    @required Result noParams(),
    @required Result id(String id),
    @required Result message(Message message),
    @required Result map(Map<String, dynamic> data),
    @required Result messageIdentifier(String roomId, String messageId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userCredentials(
        String email, String password, Map<String, dynamic> details),
    Result noParams(),
    Result id(String id),
    Result message(Message message),
    Result map(Map<String, dynamic> data),
    Result messageIdentifier(String roomId, String messageId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userCredentials(ParamsCredentials value),
    @required Result noParams(ParamsEmpty value),
    @required Result id(ParamsID value),
    @required Result message(ParamsMessage value),
    @required Result map(ParamsMap value),
    @required Result messageIdentifier(ParamsMessageIdentifier value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userCredentials(ParamsCredentials value),
    Result noParams(ParamsEmpty value),
    Result id(ParamsID value),
    Result message(ParamsMessage value),
    Result map(ParamsMap value),
    Result messageIdentifier(ParamsMessageIdentifier value),
    @required Result orElse(),
  });
}

abstract class $ParamsCopyWith<$Res> {
  factory $ParamsCopyWith(Params value, $Res Function(Params) then) =
      _$ParamsCopyWithImpl<$Res>;
}

class _$ParamsCopyWithImpl<$Res> implements $ParamsCopyWith<$Res> {
  _$ParamsCopyWithImpl(this._value, this._then);

  final Params _value;
  // ignore: unused_field
  final $Res Function(Params) _then;
}

abstract class $ParamsCredentialsCopyWith<$Res> {
  factory $ParamsCredentialsCopyWith(
          ParamsCredentials value, $Res Function(ParamsCredentials) then) =
      _$ParamsCredentialsCopyWithImpl<$Res>;
  $Res call({String email, String password, Map<String, dynamic> details});
}

class _$ParamsCredentialsCopyWithImpl<$Res> extends _$ParamsCopyWithImpl<$Res>
    implements $ParamsCredentialsCopyWith<$Res> {
  _$ParamsCredentialsCopyWithImpl(
      ParamsCredentials _value, $Res Function(ParamsCredentials) _then)
      : super(_value, (v) => _then(v as ParamsCredentials));

  @override
  ParamsCredentials get _value => super._value as ParamsCredentials;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object details = freezed,
  }) {
    return _then(ParamsCredentials(
      email == freezed ? _value.email : email as String,
      password == freezed ? _value.password : password as String,
      details == freezed ? _value.details : details as Map<String, dynamic>,
    ));
  }
}

class _$ParamsCredentials implements ParamsCredentials {
  const _$ParamsCredentials(this.email, this.password, this.details)
      : assert(email != null),
        assert(password != null),
        assert(details != null);

  @override
  final String email;
  @override
  final String password;
  @override
  final Map<String, dynamic> details;

  @override
  String toString() {
    return 'Params.userCredentials(email: $email, password: $password, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParamsCredentials &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(details);

  @override
  $ParamsCredentialsCopyWith<ParamsCredentials> get copyWith =>
      _$ParamsCredentialsCopyWithImpl<ParamsCredentials>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result userCredentials(
            String email, String password, Map<String, dynamic> details),
    @required Result noParams(),
    @required Result id(String id),
    @required Result message(Message message),
    @required Result map(Map<String, dynamic> data),
    @required Result messageIdentifier(String roomId, String messageId),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return userCredentials(email, password, details);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userCredentials(
        String email, String password, Map<String, dynamic> details),
    Result noParams(),
    Result id(String id),
    Result message(Message message),
    Result map(Map<String, dynamic> data),
    Result messageIdentifier(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userCredentials != null) {
      return userCredentials(email, password, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userCredentials(ParamsCredentials value),
    @required Result noParams(ParamsEmpty value),
    @required Result id(ParamsID value),
    @required Result message(ParamsMessage value),
    @required Result map(ParamsMap value),
    @required Result messageIdentifier(ParamsMessageIdentifier value),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return userCredentials(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userCredentials(ParamsCredentials value),
    Result noParams(ParamsEmpty value),
    Result id(ParamsID value),
    Result message(ParamsMessage value),
    Result map(ParamsMap value),
    Result messageIdentifier(ParamsMessageIdentifier value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userCredentials != null) {
      return userCredentials(this);
    }
    return orElse();
  }
}

abstract class ParamsCredentials implements Params {
  const factory ParamsCredentials(
          String email, String password, Map<String, dynamic> details) =
      _$ParamsCredentials;

  String get email;
  String get password;
  Map<String, dynamic> get details;
  $ParamsCredentialsCopyWith<ParamsCredentials> get copyWith;
}

abstract class $ParamsEmptyCopyWith<$Res> {
  factory $ParamsEmptyCopyWith(
          ParamsEmpty value, $Res Function(ParamsEmpty) then) =
      _$ParamsEmptyCopyWithImpl<$Res>;
}

class _$ParamsEmptyCopyWithImpl<$Res> extends _$ParamsCopyWithImpl<$Res>
    implements $ParamsEmptyCopyWith<$Res> {
  _$ParamsEmptyCopyWithImpl(
      ParamsEmpty _value, $Res Function(ParamsEmpty) _then)
      : super(_value, (v) => _then(v as ParamsEmpty));

  @override
  ParamsEmpty get _value => super._value as ParamsEmpty;
}

class _$ParamsEmpty implements ParamsEmpty {
  const _$ParamsEmpty();

  @override
  String toString() {
    return 'Params.noParams()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ParamsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result userCredentials(
            String email, String password, Map<String, dynamic> details),
    @required Result noParams(),
    @required Result id(String id),
    @required Result message(Message message),
    @required Result map(Map<String, dynamic> data),
    @required Result messageIdentifier(String roomId, String messageId),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return noParams();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userCredentials(
        String email, String password, Map<String, dynamic> details),
    Result noParams(),
    Result id(String id),
    Result message(Message message),
    Result map(Map<String, dynamic> data),
    Result messageIdentifier(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noParams != null) {
      return noParams();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userCredentials(ParamsCredentials value),
    @required Result noParams(ParamsEmpty value),
    @required Result id(ParamsID value),
    @required Result message(ParamsMessage value),
    @required Result map(ParamsMap value),
    @required Result messageIdentifier(ParamsMessageIdentifier value),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return noParams(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userCredentials(ParamsCredentials value),
    Result noParams(ParamsEmpty value),
    Result id(ParamsID value),
    Result message(ParamsMessage value),
    Result map(ParamsMap value),
    Result messageIdentifier(ParamsMessageIdentifier value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noParams != null) {
      return noParams(this);
    }
    return orElse();
  }
}

abstract class ParamsEmpty implements Params {
  const factory ParamsEmpty() = _$ParamsEmpty;
}

abstract class $ParamsIDCopyWith<$Res> {
  factory $ParamsIDCopyWith(ParamsID value, $Res Function(ParamsID) then) =
      _$ParamsIDCopyWithImpl<$Res>;
  $Res call({String id});
}

class _$ParamsIDCopyWithImpl<$Res> extends _$ParamsCopyWithImpl<$Res>
    implements $ParamsIDCopyWith<$Res> {
  _$ParamsIDCopyWithImpl(ParamsID _value, $Res Function(ParamsID) _then)
      : super(_value, (v) => _then(v as ParamsID));

  @override
  ParamsID get _value => super._value as ParamsID;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(ParamsID(
      id == freezed ? _value.id : id as String,
    ));
  }
}

class _$ParamsID implements ParamsID {
  const _$ParamsID(this.id) : assert(id != null);

  @override
  final String id;

  @override
  String toString() {
    return 'Params.id(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParamsID &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  $ParamsIDCopyWith<ParamsID> get copyWith =>
      _$ParamsIDCopyWithImpl<ParamsID>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result userCredentials(
            String email, String password, Map<String, dynamic> details),
    @required Result noParams(),
    @required Result id(String id),
    @required Result message(Message message),
    @required Result map(Map<String, dynamic> data),
    @required Result messageIdentifier(String roomId, String messageId),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return id(this.id);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userCredentials(
        String email, String password, Map<String, dynamic> details),
    Result noParams(),
    Result id(String id),
    Result message(Message message),
    Result map(Map<String, dynamic> data),
    Result messageIdentifier(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (id != null) {
      return id(this.id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userCredentials(ParamsCredentials value),
    @required Result noParams(ParamsEmpty value),
    @required Result id(ParamsID value),
    @required Result message(ParamsMessage value),
    @required Result map(ParamsMap value),
    @required Result messageIdentifier(ParamsMessageIdentifier value),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return id(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userCredentials(ParamsCredentials value),
    Result noParams(ParamsEmpty value),
    Result id(ParamsID value),
    Result message(ParamsMessage value),
    Result map(ParamsMap value),
    Result messageIdentifier(ParamsMessageIdentifier value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (id != null) {
      return id(this);
    }
    return orElse();
  }
}

abstract class ParamsID implements Params {
  const factory ParamsID(String id) = _$ParamsID;

  String get id;
  $ParamsIDCopyWith<ParamsID> get copyWith;
}

abstract class $ParamsMessageCopyWith<$Res> {
  factory $ParamsMessageCopyWith(
          ParamsMessage value, $Res Function(ParamsMessage) then) =
      _$ParamsMessageCopyWithImpl<$Res>;
  $Res call({Message message});
}

class _$ParamsMessageCopyWithImpl<$Res> extends _$ParamsCopyWithImpl<$Res>
    implements $ParamsMessageCopyWith<$Res> {
  _$ParamsMessageCopyWithImpl(
      ParamsMessage _value, $Res Function(ParamsMessage) _then)
      : super(_value, (v) => _then(v as ParamsMessage));

  @override
  ParamsMessage get _value => super._value as ParamsMessage;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(ParamsMessage(
      message == freezed ? _value.message : message as Message,
    ));
  }
}

class _$ParamsMessage implements ParamsMessage {
  const _$ParamsMessage(this.message) : assert(message != null);

  @override
  final Message message;

  @override
  String toString() {
    return 'Params.message(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParamsMessage &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $ParamsMessageCopyWith<ParamsMessage> get copyWith =>
      _$ParamsMessageCopyWithImpl<ParamsMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result userCredentials(
            String email, String password, Map<String, dynamic> details),
    @required Result noParams(),
    @required Result id(String id),
    @required Result message(Message message),
    @required Result map(Map<String, dynamic> data),
    @required Result messageIdentifier(String roomId, String messageId),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return message(this.message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userCredentials(
        String email, String password, Map<String, dynamic> details),
    Result noParams(),
    Result id(String id),
    Result message(Message message),
    Result map(Map<String, dynamic> data),
    Result messageIdentifier(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (message != null) {
      return message(this.message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userCredentials(ParamsCredentials value),
    @required Result noParams(ParamsEmpty value),
    @required Result id(ParamsID value),
    @required Result message(ParamsMessage value),
    @required Result map(ParamsMap value),
    @required Result messageIdentifier(ParamsMessageIdentifier value),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return message(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userCredentials(ParamsCredentials value),
    Result noParams(ParamsEmpty value),
    Result id(ParamsID value),
    Result message(ParamsMessage value),
    Result map(ParamsMap value),
    Result messageIdentifier(ParamsMessageIdentifier value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (message != null) {
      return message(this);
    }
    return orElse();
  }
}

abstract class ParamsMessage implements Params {
  const factory ParamsMessage(Message message) = _$ParamsMessage;

  Message get message;
  $ParamsMessageCopyWith<ParamsMessage> get copyWith;
}

abstract class $ParamsMapCopyWith<$Res> {
  factory $ParamsMapCopyWith(ParamsMap value, $Res Function(ParamsMap) then) =
      _$ParamsMapCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> data});
}

class _$ParamsMapCopyWithImpl<$Res> extends _$ParamsCopyWithImpl<$Res>
    implements $ParamsMapCopyWith<$Res> {
  _$ParamsMapCopyWithImpl(ParamsMap _value, $Res Function(ParamsMap) _then)
      : super(_value, (v) => _then(v as ParamsMap));

  @override
  ParamsMap get _value => super._value as ParamsMap;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(ParamsMap(
      data == freezed ? _value.data : data as Map<String, dynamic>,
    ));
  }
}

class _$ParamsMap implements ParamsMap {
  const _$ParamsMap(this.data) : assert(data != null);

  @override
  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'Params.map(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParamsMap &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $ParamsMapCopyWith<ParamsMap> get copyWith =>
      _$ParamsMapCopyWithImpl<ParamsMap>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result userCredentials(
            String email, String password, Map<String, dynamic> details),
    @required Result noParams(),
    @required Result id(String id),
    @required Result message(Message message),
    @required Result map(Map<String, dynamic> data),
    @required Result messageIdentifier(String roomId, String messageId),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return map(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userCredentials(
        String email, String password, Map<String, dynamic> details),
    Result noParams(),
    Result id(String id),
    Result message(Message message),
    Result map(Map<String, dynamic> data),
    Result messageIdentifier(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (map != null) {
      return map(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userCredentials(ParamsCredentials value),
    @required Result noParams(ParamsEmpty value),
    @required Result id(ParamsID value),
    @required Result message(ParamsMessage value),
    @required Result map(ParamsMap value),
    @required Result messageIdentifier(ParamsMessageIdentifier value),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return map(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userCredentials(ParamsCredentials value),
    Result noParams(ParamsEmpty value),
    Result id(ParamsID value),
    Result message(ParamsMessage value),
    Result map(ParamsMap value),
    Result messageIdentifier(ParamsMessageIdentifier value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (map != null) {
      return map(this);
    }
    return orElse();
  }
}

abstract class ParamsMap implements Params {
  const factory ParamsMap(Map<String, dynamic> data) = _$ParamsMap;

  Map<String, dynamic> get data;
  $ParamsMapCopyWith<ParamsMap> get copyWith;
}

abstract class $ParamsMessageIdentifierCopyWith<$Res> {
  factory $ParamsMessageIdentifierCopyWith(ParamsMessageIdentifier value,
          $Res Function(ParamsMessageIdentifier) then) =
      _$ParamsMessageIdentifierCopyWithImpl<$Res>;
  $Res call({String roomId, String messageId});
}

class _$ParamsMessageIdentifierCopyWithImpl<$Res>
    extends _$ParamsCopyWithImpl<$Res>
    implements $ParamsMessageIdentifierCopyWith<$Res> {
  _$ParamsMessageIdentifierCopyWithImpl(ParamsMessageIdentifier _value,
      $Res Function(ParamsMessageIdentifier) _then)
      : super(_value, (v) => _then(v as ParamsMessageIdentifier));

  @override
  ParamsMessageIdentifier get _value => super._value as ParamsMessageIdentifier;

  @override
  $Res call({
    Object roomId = freezed,
    Object messageId = freezed,
  }) {
    return _then(ParamsMessageIdentifier(
      roomId == freezed ? _value.roomId : roomId as String,
      messageId == freezed ? _value.messageId : messageId as String,
    ));
  }
}

class _$ParamsMessageIdentifier implements ParamsMessageIdentifier {
  const _$ParamsMessageIdentifier(this.roomId, this.messageId)
      : assert(roomId != null),
        assert(messageId != null);

  @override
  final String roomId;
  @override
  final String messageId;

  @override
  String toString() {
    return 'Params.messageIdentifier(roomId: $roomId, messageId: $messageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParamsMessageIdentifier &&
            (identical(other.roomId, roomId) ||
                const DeepCollectionEquality().equals(other.roomId, roomId)) &&
            (identical(other.messageId, messageId) ||
                const DeepCollectionEquality()
                    .equals(other.messageId, messageId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(roomId) ^
      const DeepCollectionEquality().hash(messageId);

  @override
  $ParamsMessageIdentifierCopyWith<ParamsMessageIdentifier> get copyWith =>
      _$ParamsMessageIdentifierCopyWithImpl<ParamsMessageIdentifier>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result userCredentials(
            String email, String password, Map<String, dynamic> details),
    @required Result noParams(),
    @required Result id(String id),
    @required Result message(Message message),
    @required Result map(Map<String, dynamic> data),
    @required Result messageIdentifier(String roomId, String messageId),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return messageIdentifier(roomId, messageId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result userCredentials(
        String email, String password, Map<String, dynamic> details),
    Result noParams(),
    Result id(String id),
    Result message(Message message),
    Result map(Map<String, dynamic> data),
    Result messageIdentifier(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (messageIdentifier != null) {
      return messageIdentifier(roomId, messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result userCredentials(ParamsCredentials value),
    @required Result noParams(ParamsEmpty value),
    @required Result id(ParamsID value),
    @required Result message(ParamsMessage value),
    @required Result map(ParamsMap value),
    @required Result messageIdentifier(ParamsMessageIdentifier value),
  }) {
    assert(userCredentials != null);
    assert(noParams != null);
    assert(id != null);
    assert(message != null);
    assert(map != null);
    assert(messageIdentifier != null);
    return messageIdentifier(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result userCredentials(ParamsCredentials value),
    Result noParams(ParamsEmpty value),
    Result id(ParamsID value),
    Result message(ParamsMessage value),
    Result map(ParamsMap value),
    Result messageIdentifier(ParamsMessageIdentifier value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (messageIdentifier != null) {
      return messageIdentifier(this);
    }
    return orElse();
  }
}

abstract class ParamsMessageIdentifier implements Params {
  const factory ParamsMessageIdentifier(String roomId, String messageId) =
      _$ParamsMessageIdentifier;

  String get roomId;
  String get messageId;
  $ParamsMessageIdentifierCopyWith<ParamsMessageIdentifier> get copyWith;
}
