// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_status_ball_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserStatusBallEventTearOff {
  const _$UserStatusBallEventTearOff();

  _UserStatusBallEventRequestPeerStatus requestPeerStatus(String uid) {
    return _UserStatusBallEventRequestPeerStatus(
      uid,
    );
  }
}

// ignore: unused_element
const $UserStatusBallEvent = _$UserStatusBallEventTearOff();

mixin _$UserStatusBallEvent {
  String get uid;

  $UserStatusBallEventCopyWith<UserStatusBallEvent> get copyWith;
}

abstract class $UserStatusBallEventCopyWith<$Res> {
  factory $UserStatusBallEventCopyWith(
          UserStatusBallEvent value, $Res Function(UserStatusBallEvent) then) =
      _$UserStatusBallEventCopyWithImpl<$Res>;
  $Res call({String uid});
}

class _$UserStatusBallEventCopyWithImpl<$Res>
    implements $UserStatusBallEventCopyWith<$Res> {
  _$UserStatusBallEventCopyWithImpl(this._value, this._then);

  final UserStatusBallEvent _value;
  // ignore: unused_field
  final $Res Function(UserStatusBallEvent) _then;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
    ));
  }
}

abstract class _$UserStatusBallEventRequestPeerStatusCopyWith<$Res>
    implements $UserStatusBallEventCopyWith<$Res> {
  factory _$UserStatusBallEventRequestPeerStatusCopyWith(
          _UserStatusBallEventRequestPeerStatus value,
          $Res Function(_UserStatusBallEventRequestPeerStatus) then) =
      __$UserStatusBallEventRequestPeerStatusCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

class __$UserStatusBallEventRequestPeerStatusCopyWithImpl<$Res>
    extends _$UserStatusBallEventCopyWithImpl<$Res>
    implements _$UserStatusBallEventRequestPeerStatusCopyWith<$Res> {
  __$UserStatusBallEventRequestPeerStatusCopyWithImpl(
      _UserStatusBallEventRequestPeerStatus _value,
      $Res Function(_UserStatusBallEventRequestPeerStatus) _then)
      : super(_value, (v) => _then(v as _UserStatusBallEventRequestPeerStatus));

  @override
  _UserStatusBallEventRequestPeerStatus get _value =>
      super._value as _UserStatusBallEventRequestPeerStatus;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(_UserStatusBallEventRequestPeerStatus(
      uid == freezed ? _value.uid : uid as String,
    ));
  }
}

class _$_UserStatusBallEventRequestPeerStatus
    implements _UserStatusBallEventRequestPeerStatus {
  const _$_UserStatusBallEventRequestPeerStatus(this.uid) : assert(uid != null);

  @override
  final String uid;

  @override
  String toString() {
    return 'UserStatusBallEvent.requestPeerStatus(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserStatusBallEventRequestPeerStatus &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(uid);

  @override
  _$UserStatusBallEventRequestPeerStatusCopyWith<
          _UserStatusBallEventRequestPeerStatus>
      get copyWith => __$UserStatusBallEventRequestPeerStatusCopyWithImpl<
          _UserStatusBallEventRequestPeerStatus>(this, _$identity);
}

abstract class _UserStatusBallEventRequestPeerStatus
    implements UserStatusBallEvent {
  const factory _UserStatusBallEventRequestPeerStatus(String uid) =
      _$_UserStatusBallEventRequestPeerStatus;

  @override
  String get uid;
  @override
  _$UserStatusBallEventRequestPeerStatusCopyWith<
      _UserStatusBallEventRequestPeerStatus> get copyWith;
}

class _$UserStatusBallStateTearOff {
  const _$UserStatusBallStateTearOff();

  _UserStatusBallStateInitial initial() {
    return const _UserStatusBallStateInitial();
  }

  _UserStatusBallStatePeerStatusLoaded userStatusStreamLoaded(
      Stream<dynamic> stream) {
    return _UserStatusBallStatePeerStatusLoaded(
      stream,
    );
  }

  _UserStatusBallStateError error(String message) {
    return _UserStatusBallStateError(
      message,
    );
  }
}

// ignore: unused_element
const $UserStatusBallState = _$UserStatusBallStateTearOff();

mixin _$UserStatusBallState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result userStatusStreamLoaded(Stream<dynamic> stream),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result userStatusStreamLoaded(Stream<dynamic> stream),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_UserStatusBallStateInitial value),
    @required
        Result userStatusStreamLoaded(
            _UserStatusBallStatePeerStatusLoaded value),
    @required Result error(_UserStatusBallStateError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_UserStatusBallStateInitial value),
    Result userStatusStreamLoaded(_UserStatusBallStatePeerStatusLoaded value),
    Result error(_UserStatusBallStateError value),
    @required Result orElse(),
  });
}

abstract class $UserStatusBallStateCopyWith<$Res> {
  factory $UserStatusBallStateCopyWith(
          UserStatusBallState value, $Res Function(UserStatusBallState) then) =
      _$UserStatusBallStateCopyWithImpl<$Res>;
}

class _$UserStatusBallStateCopyWithImpl<$Res>
    implements $UserStatusBallStateCopyWith<$Res> {
  _$UserStatusBallStateCopyWithImpl(this._value, this._then);

  final UserStatusBallState _value;
  // ignore: unused_field
  final $Res Function(UserStatusBallState) _then;
}

abstract class _$UserStatusBallStateInitialCopyWith<$Res> {
  factory _$UserStatusBallStateInitialCopyWith(
          _UserStatusBallStateInitial value,
          $Res Function(_UserStatusBallStateInitial) then) =
      __$UserStatusBallStateInitialCopyWithImpl<$Res>;
}

class __$UserStatusBallStateInitialCopyWithImpl<$Res>
    extends _$UserStatusBallStateCopyWithImpl<$Res>
    implements _$UserStatusBallStateInitialCopyWith<$Res> {
  __$UserStatusBallStateInitialCopyWithImpl(_UserStatusBallStateInitial _value,
      $Res Function(_UserStatusBallStateInitial) _then)
      : super(_value, (v) => _then(v as _UserStatusBallStateInitial));

  @override
  _UserStatusBallStateInitial get _value =>
      super._value as _UserStatusBallStateInitial;
}

class _$_UserStatusBallStateInitial implements _UserStatusBallStateInitial {
  const _$_UserStatusBallStateInitial();

  @override
  String toString() {
    return 'UserStatusBallState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UserStatusBallStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result userStatusStreamLoaded(Stream<dynamic> stream),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(userStatusStreamLoaded != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result userStatusStreamLoaded(Stream<dynamic> stream),
    Result error(String message),
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
    @required Result initial(_UserStatusBallStateInitial value),
    @required
        Result userStatusStreamLoaded(
            _UserStatusBallStatePeerStatusLoaded value),
    @required Result error(_UserStatusBallStateError value),
  }) {
    assert(initial != null);
    assert(userStatusStreamLoaded != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_UserStatusBallStateInitial value),
    Result userStatusStreamLoaded(_UserStatusBallStatePeerStatusLoaded value),
    Result error(_UserStatusBallStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UserStatusBallStateInitial implements UserStatusBallState {
  const factory _UserStatusBallStateInitial() = _$_UserStatusBallStateInitial;
}

abstract class _$UserStatusBallStatePeerStatusLoadedCopyWith<$Res> {
  factory _$UserStatusBallStatePeerStatusLoadedCopyWith(
          _UserStatusBallStatePeerStatusLoaded value,
          $Res Function(_UserStatusBallStatePeerStatusLoaded) then) =
      __$UserStatusBallStatePeerStatusLoadedCopyWithImpl<$Res>;
  $Res call({Stream<dynamic> stream});
}

class __$UserStatusBallStatePeerStatusLoadedCopyWithImpl<$Res>
    extends _$UserStatusBallStateCopyWithImpl<$Res>
    implements _$UserStatusBallStatePeerStatusLoadedCopyWith<$Res> {
  __$UserStatusBallStatePeerStatusLoadedCopyWithImpl(
      _UserStatusBallStatePeerStatusLoaded _value,
      $Res Function(_UserStatusBallStatePeerStatusLoaded) _then)
      : super(_value, (v) => _then(v as _UserStatusBallStatePeerStatusLoaded));

  @override
  _UserStatusBallStatePeerStatusLoaded get _value =>
      super._value as _UserStatusBallStatePeerStatusLoaded;

  @override
  $Res call({
    Object stream = freezed,
  }) {
    return _then(_UserStatusBallStatePeerStatusLoaded(
      stream == freezed ? _value.stream : stream as Stream<dynamic>,
    ));
  }
}

class _$_UserStatusBallStatePeerStatusLoaded
    implements _UserStatusBallStatePeerStatusLoaded {
  const _$_UserStatusBallStatePeerStatusLoaded(this.stream)
      : assert(stream != null);

  @override
  final Stream<dynamic> stream;

  @override
  String toString() {
    return 'UserStatusBallState.userStatusStreamLoaded(stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserStatusBallStatePeerStatusLoaded &&
            (identical(other.stream, stream) ||
                const DeepCollectionEquality().equals(other.stream, stream)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stream);

  @override
  _$UserStatusBallStatePeerStatusLoadedCopyWith<
          _UserStatusBallStatePeerStatusLoaded>
      get copyWith => __$UserStatusBallStatePeerStatusLoadedCopyWithImpl<
          _UserStatusBallStatePeerStatusLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result userStatusStreamLoaded(Stream<dynamic> stream),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(userStatusStreamLoaded != null);
    assert(error != null);
    return userStatusStreamLoaded(stream);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result userStatusStreamLoaded(Stream<dynamic> stream),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userStatusStreamLoaded != null) {
      return userStatusStreamLoaded(stream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_UserStatusBallStateInitial value),
    @required
        Result userStatusStreamLoaded(
            _UserStatusBallStatePeerStatusLoaded value),
    @required Result error(_UserStatusBallStateError value),
  }) {
    assert(initial != null);
    assert(userStatusStreamLoaded != null);
    assert(error != null);
    return userStatusStreamLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_UserStatusBallStateInitial value),
    Result userStatusStreamLoaded(_UserStatusBallStatePeerStatusLoaded value),
    Result error(_UserStatusBallStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userStatusStreamLoaded != null) {
      return userStatusStreamLoaded(this);
    }
    return orElse();
  }
}

abstract class _UserStatusBallStatePeerStatusLoaded
    implements UserStatusBallState {
  const factory _UserStatusBallStatePeerStatusLoaded(Stream<dynamic> stream) =
      _$_UserStatusBallStatePeerStatusLoaded;

  Stream<dynamic> get stream;
  _$UserStatusBallStatePeerStatusLoadedCopyWith<
      _UserStatusBallStatePeerStatusLoaded> get copyWith;
}

abstract class _$UserStatusBallStateErrorCopyWith<$Res> {
  factory _$UserStatusBallStateErrorCopyWith(_UserStatusBallStateError value,
          $Res Function(_UserStatusBallStateError) then) =
      __$UserStatusBallStateErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$UserStatusBallStateErrorCopyWithImpl<$Res>
    extends _$UserStatusBallStateCopyWithImpl<$Res>
    implements _$UserStatusBallStateErrorCopyWith<$Res> {
  __$UserStatusBallStateErrorCopyWithImpl(_UserStatusBallStateError _value,
      $Res Function(_UserStatusBallStateError) _then)
      : super(_value, (v) => _then(v as _UserStatusBallStateError));

  @override
  _UserStatusBallStateError get _value =>
      super._value as _UserStatusBallStateError;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_UserStatusBallStateError(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_UserStatusBallStateError implements _UserStatusBallStateError {
  const _$_UserStatusBallStateError(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'UserStatusBallState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserStatusBallStateError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$UserStatusBallStateErrorCopyWith<_UserStatusBallStateError> get copyWith =>
      __$UserStatusBallStateErrorCopyWithImpl<_UserStatusBallStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result userStatusStreamLoaded(Stream<dynamic> stream),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(userStatusStreamLoaded != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result userStatusStreamLoaded(Stream<dynamic> stream),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_UserStatusBallStateInitial value),
    @required
        Result userStatusStreamLoaded(
            _UserStatusBallStatePeerStatusLoaded value),
    @required Result error(_UserStatusBallStateError value),
  }) {
    assert(initial != null);
    assert(userStatusStreamLoaded != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_UserStatusBallStateInitial value),
    Result userStatusStreamLoaded(_UserStatusBallStatePeerStatusLoaded value),
    Result error(_UserStatusBallStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UserStatusBallStateError implements UserStatusBallState {
  const factory _UserStatusBallStateError(String message) =
      _$_UserStatusBallStateError;

  String get message;
  _$UserStatusBallStateErrorCopyWith<_UserStatusBallStateError> get copyWith;
}
