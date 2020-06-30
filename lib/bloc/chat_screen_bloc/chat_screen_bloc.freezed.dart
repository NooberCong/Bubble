// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'chat_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ChatScreenEventTearOff {
  const _$ChatScreenEventTearOff();

  _ChatScreenEventRequestStream requestMessageStream(
      String userId, String otherUserId) {
    return _ChatScreenEventRequestStream(
      userId,
      otherUserId,
    );
  }

  _ChatScreenEventSendMessage sendMessage(Message msg) {
    return _ChatScreenEventSendMessage(
      msg,
    );
  }

  _ChatScreenEventPop popScreen(String uid) {
    return _ChatScreenEventPop(
      uid,
    );
  }

  _ChatScreenEventMarkAsSeen markAsSeen(String roomId, String messageId) {
    return _ChatScreenEventMarkAsSeen(
      roomId,
      messageId,
    );
  }
}

// ignore: unused_element
const $ChatScreenEvent = _$ChatScreenEventTearOff();

mixin _$ChatScreenEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestMessageStream(String userId, String otherUserId),
    @required Result sendMessage(Message msg),
    @required Result popScreen(String uid),
    @required Result markAsSeen(String roomId, String messageId),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestMessageStream(String userId, String otherUserId),
    Result sendMessage(Message msg),
    Result popScreen(String uid),
    Result markAsSeen(String roomId, String messageId),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestMessageStream(_ChatScreenEventRequestStream value),
    @required Result sendMessage(_ChatScreenEventSendMessage value),
    @required Result popScreen(_ChatScreenEventPop value),
    @required Result markAsSeen(_ChatScreenEventMarkAsSeen value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestMessageStream(_ChatScreenEventRequestStream value),
    Result sendMessage(_ChatScreenEventSendMessage value),
    Result popScreen(_ChatScreenEventPop value),
    Result markAsSeen(_ChatScreenEventMarkAsSeen value),
    @required Result orElse(),
  });
}

abstract class $ChatScreenEventCopyWith<$Res> {
  factory $ChatScreenEventCopyWith(
          ChatScreenEvent value, $Res Function(ChatScreenEvent) then) =
      _$ChatScreenEventCopyWithImpl<$Res>;
}

class _$ChatScreenEventCopyWithImpl<$Res>
    implements $ChatScreenEventCopyWith<$Res> {
  _$ChatScreenEventCopyWithImpl(this._value, this._then);

  final ChatScreenEvent _value;
  // ignore: unused_field
  final $Res Function(ChatScreenEvent) _then;
}

abstract class _$ChatScreenEventRequestStreamCopyWith<$Res> {
  factory _$ChatScreenEventRequestStreamCopyWith(
          _ChatScreenEventRequestStream value,
          $Res Function(_ChatScreenEventRequestStream) then) =
      __$ChatScreenEventRequestStreamCopyWithImpl<$Res>;
  $Res call({String userId, String otherUserId});
}

class __$ChatScreenEventRequestStreamCopyWithImpl<$Res>
    extends _$ChatScreenEventCopyWithImpl<$Res>
    implements _$ChatScreenEventRequestStreamCopyWith<$Res> {
  __$ChatScreenEventRequestStreamCopyWithImpl(
      _ChatScreenEventRequestStream _value,
      $Res Function(_ChatScreenEventRequestStream) _then)
      : super(_value, (v) => _then(v as _ChatScreenEventRequestStream));

  @override
  _ChatScreenEventRequestStream get _value =>
      super._value as _ChatScreenEventRequestStream;

  @override
  $Res call({
    Object userId = freezed,
    Object otherUserId = freezed,
  }) {
    return _then(_ChatScreenEventRequestStream(
      userId == freezed ? _value.userId : userId as String,
      otherUserId == freezed ? _value.otherUserId : otherUserId as String,
    ));
  }
}

class _$_ChatScreenEventRequestStream implements _ChatScreenEventRequestStream {
  const _$_ChatScreenEventRequestStream(this.userId, this.otherUserId)
      : assert(userId != null),
        assert(otherUserId != null);

  @override
  final String userId;
  @override
  final String otherUserId;

  @override
  String toString() {
    return 'ChatScreenEvent.requestMessageStream(userId: $userId, otherUserId: $otherUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatScreenEventRequestStream &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.otherUserId, otherUserId) ||
                const DeepCollectionEquality()
                    .equals(other.otherUserId, otherUserId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(otherUserId);

  @override
  _$ChatScreenEventRequestStreamCopyWith<_ChatScreenEventRequestStream>
      get copyWith => __$ChatScreenEventRequestStreamCopyWithImpl<
          _ChatScreenEventRequestStream>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestMessageStream(String userId, String otherUserId),
    @required Result sendMessage(Message msg),
    @required Result popScreen(String uid),
    @required Result markAsSeen(String roomId, String messageId),
  }) {
    assert(requestMessageStream != null);
    assert(sendMessage != null);
    assert(popScreen != null);
    assert(markAsSeen != null);
    return requestMessageStream(userId, otherUserId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestMessageStream(String userId, String otherUserId),
    Result sendMessage(Message msg),
    Result popScreen(String uid),
    Result markAsSeen(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestMessageStream != null) {
      return requestMessageStream(userId, otherUserId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestMessageStream(_ChatScreenEventRequestStream value),
    @required Result sendMessage(_ChatScreenEventSendMessage value),
    @required Result popScreen(_ChatScreenEventPop value),
    @required Result markAsSeen(_ChatScreenEventMarkAsSeen value),
  }) {
    assert(requestMessageStream != null);
    assert(sendMessage != null);
    assert(popScreen != null);
    assert(markAsSeen != null);
    return requestMessageStream(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestMessageStream(_ChatScreenEventRequestStream value),
    Result sendMessage(_ChatScreenEventSendMessage value),
    Result popScreen(_ChatScreenEventPop value),
    Result markAsSeen(_ChatScreenEventMarkAsSeen value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestMessageStream != null) {
      return requestMessageStream(this);
    }
    return orElse();
  }
}

abstract class _ChatScreenEventRequestStream implements ChatScreenEvent {
  const factory _ChatScreenEventRequestStream(
      String userId, String otherUserId) = _$_ChatScreenEventRequestStream;

  String get userId;
  String get otherUserId;
  _$ChatScreenEventRequestStreamCopyWith<_ChatScreenEventRequestStream>
      get copyWith;
}

abstract class _$ChatScreenEventSendMessageCopyWith<$Res> {
  factory _$ChatScreenEventSendMessageCopyWith(
          _ChatScreenEventSendMessage value,
          $Res Function(_ChatScreenEventSendMessage) then) =
      __$ChatScreenEventSendMessageCopyWithImpl<$Res>;
  $Res call({Message msg});
}

class __$ChatScreenEventSendMessageCopyWithImpl<$Res>
    extends _$ChatScreenEventCopyWithImpl<$Res>
    implements _$ChatScreenEventSendMessageCopyWith<$Res> {
  __$ChatScreenEventSendMessageCopyWithImpl(_ChatScreenEventSendMessage _value,
      $Res Function(_ChatScreenEventSendMessage) _then)
      : super(_value, (v) => _then(v as _ChatScreenEventSendMessage));

  @override
  _ChatScreenEventSendMessage get _value =>
      super._value as _ChatScreenEventSendMessage;

  @override
  $Res call({
    Object msg = freezed,
  }) {
    return _then(_ChatScreenEventSendMessage(
      msg == freezed ? _value.msg : msg as Message,
    ));
  }
}

class _$_ChatScreenEventSendMessage implements _ChatScreenEventSendMessage {
  const _$_ChatScreenEventSendMessage(this.msg) : assert(msg != null);

  @override
  final Message msg;

  @override
  String toString() {
    return 'ChatScreenEvent.sendMessage(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatScreenEventSendMessage &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(msg);

  @override
  _$ChatScreenEventSendMessageCopyWith<_ChatScreenEventSendMessage>
      get copyWith => __$ChatScreenEventSendMessageCopyWithImpl<
          _ChatScreenEventSendMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestMessageStream(String userId, String otherUserId),
    @required Result sendMessage(Message msg),
    @required Result popScreen(String uid),
    @required Result markAsSeen(String roomId, String messageId),
  }) {
    assert(requestMessageStream != null);
    assert(sendMessage != null);
    assert(popScreen != null);
    assert(markAsSeen != null);
    return sendMessage(msg);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestMessageStream(String userId, String otherUserId),
    Result sendMessage(Message msg),
    Result popScreen(String uid),
    Result markAsSeen(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendMessage != null) {
      return sendMessage(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestMessageStream(_ChatScreenEventRequestStream value),
    @required Result sendMessage(_ChatScreenEventSendMessage value),
    @required Result popScreen(_ChatScreenEventPop value),
    @required Result markAsSeen(_ChatScreenEventMarkAsSeen value),
  }) {
    assert(requestMessageStream != null);
    assert(sendMessage != null);
    assert(popScreen != null);
    assert(markAsSeen != null);
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestMessageStream(_ChatScreenEventRequestStream value),
    Result sendMessage(_ChatScreenEventSendMessage value),
    Result popScreen(_ChatScreenEventPop value),
    Result markAsSeen(_ChatScreenEventMarkAsSeen value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _ChatScreenEventSendMessage implements ChatScreenEvent {
  const factory _ChatScreenEventSendMessage(Message msg) =
      _$_ChatScreenEventSendMessage;

  Message get msg;
  _$ChatScreenEventSendMessageCopyWith<_ChatScreenEventSendMessage>
      get copyWith;
}

abstract class _$ChatScreenEventPopCopyWith<$Res> {
  factory _$ChatScreenEventPopCopyWith(
          _ChatScreenEventPop value, $Res Function(_ChatScreenEventPop) then) =
      __$ChatScreenEventPopCopyWithImpl<$Res>;
  $Res call({String uid});
}

class __$ChatScreenEventPopCopyWithImpl<$Res>
    extends _$ChatScreenEventCopyWithImpl<$Res>
    implements _$ChatScreenEventPopCopyWith<$Res> {
  __$ChatScreenEventPopCopyWithImpl(
      _ChatScreenEventPop _value, $Res Function(_ChatScreenEventPop) _then)
      : super(_value, (v) => _then(v as _ChatScreenEventPop));

  @override
  _ChatScreenEventPop get _value => super._value as _ChatScreenEventPop;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(_ChatScreenEventPop(
      uid == freezed ? _value.uid : uid as String,
    ));
  }
}

class _$_ChatScreenEventPop implements _ChatScreenEventPop {
  const _$_ChatScreenEventPop(this.uid) : assert(uid != null);

  @override
  final String uid;

  @override
  String toString() {
    return 'ChatScreenEvent.popScreen(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatScreenEventPop &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(uid);

  @override
  _$ChatScreenEventPopCopyWith<_ChatScreenEventPop> get copyWith =>
      __$ChatScreenEventPopCopyWithImpl<_ChatScreenEventPop>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestMessageStream(String userId, String otherUserId),
    @required Result sendMessage(Message msg),
    @required Result popScreen(String uid),
    @required Result markAsSeen(String roomId, String messageId),
  }) {
    assert(requestMessageStream != null);
    assert(sendMessage != null);
    assert(popScreen != null);
    assert(markAsSeen != null);
    return popScreen(uid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestMessageStream(String userId, String otherUserId),
    Result sendMessage(Message msg),
    Result popScreen(String uid),
    Result markAsSeen(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (popScreen != null) {
      return popScreen(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestMessageStream(_ChatScreenEventRequestStream value),
    @required Result sendMessage(_ChatScreenEventSendMessage value),
    @required Result popScreen(_ChatScreenEventPop value),
    @required Result markAsSeen(_ChatScreenEventMarkAsSeen value),
  }) {
    assert(requestMessageStream != null);
    assert(sendMessage != null);
    assert(popScreen != null);
    assert(markAsSeen != null);
    return popScreen(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestMessageStream(_ChatScreenEventRequestStream value),
    Result sendMessage(_ChatScreenEventSendMessage value),
    Result popScreen(_ChatScreenEventPop value),
    Result markAsSeen(_ChatScreenEventMarkAsSeen value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (popScreen != null) {
      return popScreen(this);
    }
    return orElse();
  }
}

abstract class _ChatScreenEventPop implements ChatScreenEvent {
  const factory _ChatScreenEventPop(String uid) = _$_ChatScreenEventPop;

  String get uid;
  _$ChatScreenEventPopCopyWith<_ChatScreenEventPop> get copyWith;
}

abstract class _$ChatScreenEventMarkAsSeenCopyWith<$Res> {
  factory _$ChatScreenEventMarkAsSeenCopyWith(_ChatScreenEventMarkAsSeen value,
          $Res Function(_ChatScreenEventMarkAsSeen) then) =
      __$ChatScreenEventMarkAsSeenCopyWithImpl<$Res>;
  $Res call({String roomId, String messageId});
}

class __$ChatScreenEventMarkAsSeenCopyWithImpl<$Res>
    extends _$ChatScreenEventCopyWithImpl<$Res>
    implements _$ChatScreenEventMarkAsSeenCopyWith<$Res> {
  __$ChatScreenEventMarkAsSeenCopyWithImpl(_ChatScreenEventMarkAsSeen _value,
      $Res Function(_ChatScreenEventMarkAsSeen) _then)
      : super(_value, (v) => _then(v as _ChatScreenEventMarkAsSeen));

  @override
  _ChatScreenEventMarkAsSeen get _value =>
      super._value as _ChatScreenEventMarkAsSeen;

  @override
  $Res call({
    Object roomId = freezed,
    Object messageId = freezed,
  }) {
    return _then(_ChatScreenEventMarkAsSeen(
      roomId == freezed ? _value.roomId : roomId as String,
      messageId == freezed ? _value.messageId : messageId as String,
    ));
  }
}

class _$_ChatScreenEventMarkAsSeen implements _ChatScreenEventMarkAsSeen {
  const _$_ChatScreenEventMarkAsSeen(this.roomId, this.messageId)
      : assert(roomId != null),
        assert(messageId != null);

  @override
  final String roomId;
  @override
  final String messageId;

  @override
  String toString() {
    return 'ChatScreenEvent.markAsSeen(roomId: $roomId, messageId: $messageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatScreenEventMarkAsSeen &&
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
  _$ChatScreenEventMarkAsSeenCopyWith<_ChatScreenEventMarkAsSeen>
      get copyWith =>
          __$ChatScreenEventMarkAsSeenCopyWithImpl<_ChatScreenEventMarkAsSeen>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestMessageStream(String userId, String otherUserId),
    @required Result sendMessage(Message msg),
    @required Result popScreen(String uid),
    @required Result markAsSeen(String roomId, String messageId),
  }) {
    assert(requestMessageStream != null);
    assert(sendMessage != null);
    assert(popScreen != null);
    assert(markAsSeen != null);
    return markAsSeen(roomId, messageId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestMessageStream(String userId, String otherUserId),
    Result sendMessage(Message msg),
    Result popScreen(String uid),
    Result markAsSeen(String roomId, String messageId),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (markAsSeen != null) {
      return markAsSeen(roomId, messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestMessageStream(_ChatScreenEventRequestStream value),
    @required Result sendMessage(_ChatScreenEventSendMessage value),
    @required Result popScreen(_ChatScreenEventPop value),
    @required Result markAsSeen(_ChatScreenEventMarkAsSeen value),
  }) {
    assert(requestMessageStream != null);
    assert(sendMessage != null);
    assert(popScreen != null);
    assert(markAsSeen != null);
    return markAsSeen(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestMessageStream(_ChatScreenEventRequestStream value),
    Result sendMessage(_ChatScreenEventSendMessage value),
    Result popScreen(_ChatScreenEventPop value),
    Result markAsSeen(_ChatScreenEventMarkAsSeen value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (markAsSeen != null) {
      return markAsSeen(this);
    }
    return orElse();
  }
}

abstract class _ChatScreenEventMarkAsSeen implements ChatScreenEvent {
  const factory _ChatScreenEventMarkAsSeen(String roomId, String messageId) =
      _$_ChatScreenEventMarkAsSeen;

  String get roomId;
  String get messageId;
  _$ChatScreenEventMarkAsSeenCopyWith<_ChatScreenEventMarkAsSeen> get copyWith;
}

class _$ChatScreenStateTearOff {
  const _$ChatScreenStateTearOff();

  _ChatScreenStateInitial initial() {
    return const _ChatScreenStateInitial();
  }

  _ChatScreenStateLoading loading() {
    return const _ChatScreenStateLoading();
  }

  _ChatScreenStateLoaded loaded(Stream<dynamic> messageStream, bool hasMore) {
    return _ChatScreenStateLoaded(
      messageStream,
      hasMore,
    );
  }

  ChatScreenStateNotification notification(String message) {
    return ChatScreenStateNotification(
      message,
    );
  }

  _ChatScreenStateMessageSent messageSent() {
    return const _ChatScreenStateMessageSent();
  }

  _ChatScreenStateError error(String errorMsg) {
    return _ChatScreenStateError(
      errorMsg,
    );
  }
}

// ignore: unused_element
const $ChatScreenState = _$ChatScreenStateTearOff();

mixin _$ChatScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(Stream<dynamic> messageStream, bool hasMore),
    @required Result notification(String message),
    @required Result messageSent(),
    @required Result error(String errorMsg),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(Stream<dynamic> messageStream, bool hasMore),
    Result notification(String message),
    Result messageSent(),
    Result error(String errorMsg),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ChatScreenStateInitial value),
    @required Result loading(_ChatScreenStateLoading value),
    @required Result loaded(_ChatScreenStateLoaded value),
    @required Result notification(ChatScreenStateNotification value),
    @required Result messageSent(_ChatScreenStateMessageSent value),
    @required Result error(_ChatScreenStateError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ChatScreenStateInitial value),
    Result loading(_ChatScreenStateLoading value),
    Result loaded(_ChatScreenStateLoaded value),
    Result notification(ChatScreenStateNotification value),
    Result messageSent(_ChatScreenStateMessageSent value),
    Result error(_ChatScreenStateError value),
    @required Result orElse(),
  });
}

abstract class $ChatScreenStateCopyWith<$Res> {
  factory $ChatScreenStateCopyWith(
          ChatScreenState value, $Res Function(ChatScreenState) then) =
      _$ChatScreenStateCopyWithImpl<$Res>;
}

class _$ChatScreenStateCopyWithImpl<$Res>
    implements $ChatScreenStateCopyWith<$Res> {
  _$ChatScreenStateCopyWithImpl(this._value, this._then);

  final ChatScreenState _value;
  // ignore: unused_field
  final $Res Function(ChatScreenState) _then;
}

abstract class _$ChatScreenStateInitialCopyWith<$Res> {
  factory _$ChatScreenStateInitialCopyWith(_ChatScreenStateInitial value,
          $Res Function(_ChatScreenStateInitial) then) =
      __$ChatScreenStateInitialCopyWithImpl<$Res>;
}

class __$ChatScreenStateInitialCopyWithImpl<$Res>
    extends _$ChatScreenStateCopyWithImpl<$Res>
    implements _$ChatScreenStateInitialCopyWith<$Res> {
  __$ChatScreenStateInitialCopyWithImpl(_ChatScreenStateInitial _value,
      $Res Function(_ChatScreenStateInitial) _then)
      : super(_value, (v) => _then(v as _ChatScreenStateInitial));

  @override
  _ChatScreenStateInitial get _value => super._value as _ChatScreenStateInitial;
}

class _$_ChatScreenStateInitial implements _ChatScreenStateInitial {
  const _$_ChatScreenStateInitial();

  @override
  String toString() {
    return 'ChatScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ChatScreenStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(Stream<dynamic> messageStream, bool hasMore),
    @required Result notification(String message),
    @required Result messageSent(),
    @required Result error(String errorMsg),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(Stream<dynamic> messageStream, bool hasMore),
    Result notification(String message),
    Result messageSent(),
    Result error(String errorMsg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ChatScreenStateInitial value),
    @required Result loading(_ChatScreenStateLoading value),
    @required Result loaded(_ChatScreenStateLoaded value),
    @required Result notification(ChatScreenStateNotification value),
    @required Result messageSent(_ChatScreenStateMessageSent value),
    @required Result error(_ChatScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ChatScreenStateInitial value),
    Result loading(_ChatScreenStateLoading value),
    Result loaded(_ChatScreenStateLoaded value),
    Result notification(ChatScreenStateNotification value),
    Result messageSent(_ChatScreenStateMessageSent value),
    Result error(_ChatScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ChatScreenStateInitial implements ChatScreenState {
  const factory _ChatScreenStateInitial() = _$_ChatScreenStateInitial;
}

abstract class _$ChatScreenStateLoadingCopyWith<$Res> {
  factory _$ChatScreenStateLoadingCopyWith(_ChatScreenStateLoading value,
          $Res Function(_ChatScreenStateLoading) then) =
      __$ChatScreenStateLoadingCopyWithImpl<$Res>;
}

class __$ChatScreenStateLoadingCopyWithImpl<$Res>
    extends _$ChatScreenStateCopyWithImpl<$Res>
    implements _$ChatScreenStateLoadingCopyWith<$Res> {
  __$ChatScreenStateLoadingCopyWithImpl(_ChatScreenStateLoading _value,
      $Res Function(_ChatScreenStateLoading) _then)
      : super(_value, (v) => _then(v as _ChatScreenStateLoading));

  @override
  _ChatScreenStateLoading get _value => super._value as _ChatScreenStateLoading;
}

class _$_ChatScreenStateLoading implements _ChatScreenStateLoading {
  const _$_ChatScreenStateLoading();

  @override
  String toString() {
    return 'ChatScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ChatScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(Stream<dynamic> messageStream, bool hasMore),
    @required Result notification(String message),
    @required Result messageSent(),
    @required Result error(String errorMsg),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(Stream<dynamic> messageStream, bool hasMore),
    Result notification(String message),
    Result messageSent(),
    Result error(String errorMsg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ChatScreenStateInitial value),
    @required Result loading(_ChatScreenStateLoading value),
    @required Result loaded(_ChatScreenStateLoaded value),
    @required Result notification(ChatScreenStateNotification value),
    @required Result messageSent(_ChatScreenStateMessageSent value),
    @required Result error(_ChatScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ChatScreenStateInitial value),
    Result loading(_ChatScreenStateLoading value),
    Result loaded(_ChatScreenStateLoaded value),
    Result notification(ChatScreenStateNotification value),
    Result messageSent(_ChatScreenStateMessageSent value),
    Result error(_ChatScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ChatScreenStateLoading implements ChatScreenState {
  const factory _ChatScreenStateLoading() = _$_ChatScreenStateLoading;
}

abstract class _$ChatScreenStateLoadedCopyWith<$Res> {
  factory _$ChatScreenStateLoadedCopyWith(_ChatScreenStateLoaded value,
          $Res Function(_ChatScreenStateLoaded) then) =
      __$ChatScreenStateLoadedCopyWithImpl<$Res>;
  $Res call({Stream<dynamic> messageStream, bool hasMore});
}

class __$ChatScreenStateLoadedCopyWithImpl<$Res>
    extends _$ChatScreenStateCopyWithImpl<$Res>
    implements _$ChatScreenStateLoadedCopyWith<$Res> {
  __$ChatScreenStateLoadedCopyWithImpl(_ChatScreenStateLoaded _value,
      $Res Function(_ChatScreenStateLoaded) _then)
      : super(_value, (v) => _then(v as _ChatScreenStateLoaded));

  @override
  _ChatScreenStateLoaded get _value => super._value as _ChatScreenStateLoaded;

  @override
  $Res call({
    Object messageStream = freezed,
    Object hasMore = freezed,
  }) {
    return _then(_ChatScreenStateLoaded(
      messageStream == freezed
          ? _value.messageStream
          : messageStream as Stream<dynamic>,
      hasMore == freezed ? _value.hasMore : hasMore as bool,
    ));
  }
}

class _$_ChatScreenStateLoaded implements _ChatScreenStateLoaded {
  const _$_ChatScreenStateLoaded(this.messageStream, this.hasMore)
      : assert(messageStream != null),
        assert(hasMore != null);

  @override
  final Stream<dynamic> messageStream;
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'ChatScreenState.loaded(messageStream: $messageStream, hasMore: $hasMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatScreenStateLoaded &&
            (identical(other.messageStream, messageStream) ||
                const DeepCollectionEquality()
                    .equals(other.messageStream, messageStream)) &&
            (identical(other.hasMore, hasMore) ||
                const DeepCollectionEquality().equals(other.hasMore, hasMore)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(messageStream) ^
      const DeepCollectionEquality().hash(hasMore);

  @override
  _$ChatScreenStateLoadedCopyWith<_ChatScreenStateLoaded> get copyWith =>
      __$ChatScreenStateLoadedCopyWithImpl<_ChatScreenStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(Stream<dynamic> messageStream, bool hasMore),
    @required Result notification(String message),
    @required Result messageSent(),
    @required Result error(String errorMsg),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return loaded(messageStream, hasMore);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(Stream<dynamic> messageStream, bool hasMore),
    Result notification(String message),
    Result messageSent(),
    Result error(String errorMsg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(messageStream, hasMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ChatScreenStateInitial value),
    @required Result loading(_ChatScreenStateLoading value),
    @required Result loaded(_ChatScreenStateLoaded value),
    @required Result notification(ChatScreenStateNotification value),
    @required Result messageSent(_ChatScreenStateMessageSent value),
    @required Result error(_ChatScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ChatScreenStateInitial value),
    Result loading(_ChatScreenStateLoading value),
    Result loaded(_ChatScreenStateLoaded value),
    Result notification(ChatScreenStateNotification value),
    Result messageSent(_ChatScreenStateMessageSent value),
    Result error(_ChatScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _ChatScreenStateLoaded implements ChatScreenState {
  const factory _ChatScreenStateLoaded(
      Stream<dynamic> messageStream, bool hasMore) = _$_ChatScreenStateLoaded;

  Stream<dynamic> get messageStream;
  bool get hasMore;
  _$ChatScreenStateLoadedCopyWith<_ChatScreenStateLoaded> get copyWith;
}

abstract class $ChatScreenStateNotificationCopyWith<$Res> {
  factory $ChatScreenStateNotificationCopyWith(
          ChatScreenStateNotification value,
          $Res Function(ChatScreenStateNotification) then) =
      _$ChatScreenStateNotificationCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ChatScreenStateNotificationCopyWithImpl<$Res>
    extends _$ChatScreenStateCopyWithImpl<$Res>
    implements $ChatScreenStateNotificationCopyWith<$Res> {
  _$ChatScreenStateNotificationCopyWithImpl(ChatScreenStateNotification _value,
      $Res Function(ChatScreenStateNotification) _then)
      : super(_value, (v) => _then(v as ChatScreenStateNotification));

  @override
  ChatScreenStateNotification get _value =>
      super._value as ChatScreenStateNotification;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(ChatScreenStateNotification(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$ChatScreenStateNotification implements ChatScreenStateNotification {
  const _$ChatScreenStateNotification(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatScreenState.notification(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatScreenStateNotification &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $ChatScreenStateNotificationCopyWith<ChatScreenStateNotification>
      get copyWith => _$ChatScreenStateNotificationCopyWithImpl<
          ChatScreenStateNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(Stream<dynamic> messageStream, bool hasMore),
    @required Result notification(String message),
    @required Result messageSent(),
    @required Result error(String errorMsg),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return notification(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(Stream<dynamic> messageStream, bool hasMore),
    Result notification(String message),
    Result messageSent(),
    Result error(String errorMsg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notification != null) {
      return notification(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ChatScreenStateInitial value),
    @required Result loading(_ChatScreenStateLoading value),
    @required Result loaded(_ChatScreenStateLoaded value),
    @required Result notification(ChatScreenStateNotification value),
    @required Result messageSent(_ChatScreenStateMessageSent value),
    @required Result error(_ChatScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return notification(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ChatScreenStateInitial value),
    Result loading(_ChatScreenStateLoading value),
    Result loaded(_ChatScreenStateLoaded value),
    Result notification(ChatScreenStateNotification value),
    Result messageSent(_ChatScreenStateMessageSent value),
    Result error(_ChatScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notification != null) {
      return notification(this);
    }
    return orElse();
  }
}

abstract class ChatScreenStateNotification implements ChatScreenState {
  const factory ChatScreenStateNotification(String message) =
      _$ChatScreenStateNotification;

  String get message;
  $ChatScreenStateNotificationCopyWith<ChatScreenStateNotification>
      get copyWith;
}

abstract class _$ChatScreenStateMessageSentCopyWith<$Res> {
  factory _$ChatScreenStateMessageSentCopyWith(
          _ChatScreenStateMessageSent value,
          $Res Function(_ChatScreenStateMessageSent) then) =
      __$ChatScreenStateMessageSentCopyWithImpl<$Res>;
}

class __$ChatScreenStateMessageSentCopyWithImpl<$Res>
    extends _$ChatScreenStateCopyWithImpl<$Res>
    implements _$ChatScreenStateMessageSentCopyWith<$Res> {
  __$ChatScreenStateMessageSentCopyWithImpl(_ChatScreenStateMessageSent _value,
      $Res Function(_ChatScreenStateMessageSent) _then)
      : super(_value, (v) => _then(v as _ChatScreenStateMessageSent));

  @override
  _ChatScreenStateMessageSent get _value =>
      super._value as _ChatScreenStateMessageSent;
}

class _$_ChatScreenStateMessageSent implements _ChatScreenStateMessageSent {
  const _$_ChatScreenStateMessageSent();

  @override
  String toString() {
    return 'ChatScreenState.messageSent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ChatScreenStateMessageSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(Stream<dynamic> messageStream, bool hasMore),
    @required Result notification(String message),
    @required Result messageSent(),
    @required Result error(String errorMsg),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return messageSent();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(Stream<dynamic> messageStream, bool hasMore),
    Result notification(String message),
    Result messageSent(),
    Result error(String errorMsg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (messageSent != null) {
      return messageSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ChatScreenStateInitial value),
    @required Result loading(_ChatScreenStateLoading value),
    @required Result loaded(_ChatScreenStateLoaded value),
    @required Result notification(ChatScreenStateNotification value),
    @required Result messageSent(_ChatScreenStateMessageSent value),
    @required Result error(_ChatScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return messageSent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ChatScreenStateInitial value),
    Result loading(_ChatScreenStateLoading value),
    Result loaded(_ChatScreenStateLoaded value),
    Result notification(ChatScreenStateNotification value),
    Result messageSent(_ChatScreenStateMessageSent value),
    Result error(_ChatScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (messageSent != null) {
      return messageSent(this);
    }
    return orElse();
  }
}

abstract class _ChatScreenStateMessageSent implements ChatScreenState {
  const factory _ChatScreenStateMessageSent() = _$_ChatScreenStateMessageSent;
}

abstract class _$ChatScreenStateErrorCopyWith<$Res> {
  factory _$ChatScreenStateErrorCopyWith(_ChatScreenStateError value,
          $Res Function(_ChatScreenStateError) then) =
      __$ChatScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String errorMsg});
}

class __$ChatScreenStateErrorCopyWithImpl<$Res>
    extends _$ChatScreenStateCopyWithImpl<$Res>
    implements _$ChatScreenStateErrorCopyWith<$Res> {
  __$ChatScreenStateErrorCopyWithImpl(
      _ChatScreenStateError _value, $Res Function(_ChatScreenStateError) _then)
      : super(_value, (v) => _then(v as _ChatScreenStateError));

  @override
  _ChatScreenStateError get _value => super._value as _ChatScreenStateError;

  @override
  $Res call({
    Object errorMsg = freezed,
  }) {
    return _then(_ChatScreenStateError(
      errorMsg == freezed ? _value.errorMsg : errorMsg as String,
    ));
  }
}

class _$_ChatScreenStateError implements _ChatScreenStateError {
  const _$_ChatScreenStateError(this.errorMsg) : assert(errorMsg != null);

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'ChatScreenState.error(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatScreenStateError &&
            (identical(other.errorMsg, errorMsg) ||
                const DeepCollectionEquality()
                    .equals(other.errorMsg, errorMsg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMsg);

  @override
  _$ChatScreenStateErrorCopyWith<_ChatScreenStateError> get copyWith =>
      __$ChatScreenStateErrorCopyWithImpl<_ChatScreenStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(Stream<dynamic> messageStream, bool hasMore),
    @required Result notification(String message),
    @required Result messageSent(),
    @required Result error(String errorMsg),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return error(errorMsg);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(Stream<dynamic> messageStream, bool hasMore),
    Result notification(String message),
    Result messageSent(),
    Result error(String errorMsg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ChatScreenStateInitial value),
    @required Result loading(_ChatScreenStateLoading value),
    @required Result loaded(_ChatScreenStateLoaded value),
    @required Result notification(ChatScreenStateNotification value),
    @required Result messageSent(_ChatScreenStateMessageSent value),
    @required Result error(_ChatScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(notification != null);
    assert(messageSent != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ChatScreenStateInitial value),
    Result loading(_ChatScreenStateLoading value),
    Result loaded(_ChatScreenStateLoaded value),
    Result notification(ChatScreenStateNotification value),
    Result messageSent(_ChatScreenStateMessageSent value),
    Result error(_ChatScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ChatScreenStateError implements ChatScreenState {
  const factory _ChatScreenStateError(String errorMsg) =
      _$_ChatScreenStateError;

  String get errorMsg;
  _$ChatScreenStateErrorCopyWith<_ChatScreenStateError> get copyWith;
}
