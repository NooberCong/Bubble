// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'find_user_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FindUserScreenEventTearOff {
  const _$FindUserScreenEventTearOff();

  _FindUserScreenEventUID findUserByUID(String uid) {
    return _FindUserScreenEventUID(
      uid,
    );
  }

  _FindUserScreenEventRandom random(String userId) {
    return _FindUserScreenEventRandom(
      userId,
    );
  }

  _FindUserScreenEventStartConversation startConveration(
      User user, User otherUser) {
    return _FindUserScreenEventStartConversation(
      user,
      otherUser,
    );
  }
}

// ignore: unused_element
const $FindUserScreenEvent = _$FindUserScreenEventTearOff();

mixin _$FindUserScreenEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result findUserByUID(String uid),
    @required Result random(String userId),
    @required Result startConveration(User user, User otherUser),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result findUserByUID(String uid),
    Result random(String userId),
    Result startConveration(User user, User otherUser),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result findUserByUID(_FindUserScreenEventUID value),
    @required Result random(_FindUserScreenEventRandom value),
    @required
        Result startConveration(_FindUserScreenEventStartConversation value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result findUserByUID(_FindUserScreenEventUID value),
    Result random(_FindUserScreenEventRandom value),
    Result startConveration(_FindUserScreenEventStartConversation value),
    @required Result orElse(),
  });
}

abstract class $FindUserScreenEventCopyWith<$Res> {
  factory $FindUserScreenEventCopyWith(
          FindUserScreenEvent value, $Res Function(FindUserScreenEvent) then) =
      _$FindUserScreenEventCopyWithImpl<$Res>;
}

class _$FindUserScreenEventCopyWithImpl<$Res>
    implements $FindUserScreenEventCopyWith<$Res> {
  _$FindUserScreenEventCopyWithImpl(this._value, this._then);

  final FindUserScreenEvent _value;
  // ignore: unused_field
  final $Res Function(FindUserScreenEvent) _then;
}

abstract class _$FindUserScreenEventUIDCopyWith<$Res> {
  factory _$FindUserScreenEventUIDCopyWith(_FindUserScreenEventUID value,
          $Res Function(_FindUserScreenEventUID) then) =
      __$FindUserScreenEventUIDCopyWithImpl<$Res>;
  $Res call({String uid});
}

class __$FindUserScreenEventUIDCopyWithImpl<$Res>
    extends _$FindUserScreenEventCopyWithImpl<$Res>
    implements _$FindUserScreenEventUIDCopyWith<$Res> {
  __$FindUserScreenEventUIDCopyWithImpl(_FindUserScreenEventUID _value,
      $Res Function(_FindUserScreenEventUID) _then)
      : super(_value, (v) => _then(v as _FindUserScreenEventUID));

  @override
  _FindUserScreenEventUID get _value => super._value as _FindUserScreenEventUID;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(_FindUserScreenEventUID(
      uid == freezed ? _value.uid : uid as String,
    ));
  }
}

class _$_FindUserScreenEventUID implements _FindUserScreenEventUID {
  const _$_FindUserScreenEventUID(this.uid) : assert(uid != null);

  @override
  final String uid;

  @override
  String toString() {
    return 'FindUserScreenEvent.findUserByUID(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FindUserScreenEventUID &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(uid);

  @override
  _$FindUserScreenEventUIDCopyWith<_FindUserScreenEventUID> get copyWith =>
      __$FindUserScreenEventUIDCopyWithImpl<_FindUserScreenEventUID>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result findUserByUID(String uid),
    @required Result random(String userId),
    @required Result startConveration(User user, User otherUser),
  }) {
    assert(findUserByUID != null);
    assert(random != null);
    assert(startConveration != null);
    return findUserByUID(uid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result findUserByUID(String uid),
    Result random(String userId),
    Result startConveration(User user, User otherUser),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (findUserByUID != null) {
      return findUserByUID(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result findUserByUID(_FindUserScreenEventUID value),
    @required Result random(_FindUserScreenEventRandom value),
    @required
        Result startConveration(_FindUserScreenEventStartConversation value),
  }) {
    assert(findUserByUID != null);
    assert(random != null);
    assert(startConveration != null);
    return findUserByUID(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result findUserByUID(_FindUserScreenEventUID value),
    Result random(_FindUserScreenEventRandom value),
    Result startConveration(_FindUserScreenEventStartConversation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (findUserByUID != null) {
      return findUserByUID(this);
    }
    return orElse();
  }
}

abstract class _FindUserScreenEventUID implements FindUserScreenEvent {
  const factory _FindUserScreenEventUID(String uid) = _$_FindUserScreenEventUID;

  String get uid;
  _$FindUserScreenEventUIDCopyWith<_FindUserScreenEventUID> get copyWith;
}

abstract class _$FindUserScreenEventRandomCopyWith<$Res> {
  factory _$FindUserScreenEventRandomCopyWith(_FindUserScreenEventRandom value,
          $Res Function(_FindUserScreenEventRandom) then) =
      __$FindUserScreenEventRandomCopyWithImpl<$Res>;
  $Res call({String userId});
}

class __$FindUserScreenEventRandomCopyWithImpl<$Res>
    extends _$FindUserScreenEventCopyWithImpl<$Res>
    implements _$FindUserScreenEventRandomCopyWith<$Res> {
  __$FindUserScreenEventRandomCopyWithImpl(_FindUserScreenEventRandom _value,
      $Res Function(_FindUserScreenEventRandom) _then)
      : super(_value, (v) => _then(v as _FindUserScreenEventRandom));

  @override
  _FindUserScreenEventRandom get _value =>
      super._value as _FindUserScreenEventRandom;

  @override
  $Res call({
    Object userId = freezed,
  }) {
    return _then(_FindUserScreenEventRandom(
      userId == freezed ? _value.userId : userId as String,
    ));
  }
}

class _$_FindUserScreenEventRandom implements _FindUserScreenEventRandom {
  const _$_FindUserScreenEventRandom(this.userId) : assert(userId != null);

  @override
  final String userId;

  @override
  String toString() {
    return 'FindUserScreenEvent.random(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FindUserScreenEventRandom &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userId);

  @override
  _$FindUserScreenEventRandomCopyWith<_FindUserScreenEventRandom>
      get copyWith =>
          __$FindUserScreenEventRandomCopyWithImpl<_FindUserScreenEventRandom>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result findUserByUID(String uid),
    @required Result random(String userId),
    @required Result startConveration(User user, User otherUser),
  }) {
    assert(findUserByUID != null);
    assert(random != null);
    assert(startConveration != null);
    return random(userId);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result findUserByUID(String uid),
    Result random(String userId),
    Result startConveration(User user, User otherUser),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (random != null) {
      return random(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result findUserByUID(_FindUserScreenEventUID value),
    @required Result random(_FindUserScreenEventRandom value),
    @required
        Result startConveration(_FindUserScreenEventStartConversation value),
  }) {
    assert(findUserByUID != null);
    assert(random != null);
    assert(startConveration != null);
    return random(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result findUserByUID(_FindUserScreenEventUID value),
    Result random(_FindUserScreenEventRandom value),
    Result startConveration(_FindUserScreenEventStartConversation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (random != null) {
      return random(this);
    }
    return orElse();
  }
}

abstract class _FindUserScreenEventRandom implements FindUserScreenEvent {
  const factory _FindUserScreenEventRandom(String userId) =
      _$_FindUserScreenEventRandom;

  String get userId;
  _$FindUserScreenEventRandomCopyWith<_FindUserScreenEventRandom> get copyWith;
}

abstract class _$FindUserScreenEventStartConversationCopyWith<$Res> {
  factory _$FindUserScreenEventStartConversationCopyWith(
          _FindUserScreenEventStartConversation value,
          $Res Function(_FindUserScreenEventStartConversation) then) =
      __$FindUserScreenEventStartConversationCopyWithImpl<$Res>;
  $Res call({User user, User otherUser});
}

class __$FindUserScreenEventStartConversationCopyWithImpl<$Res>
    extends _$FindUserScreenEventCopyWithImpl<$Res>
    implements _$FindUserScreenEventStartConversationCopyWith<$Res> {
  __$FindUserScreenEventStartConversationCopyWithImpl(
      _FindUserScreenEventStartConversation _value,
      $Res Function(_FindUserScreenEventStartConversation) _then)
      : super(_value, (v) => _then(v as _FindUserScreenEventStartConversation));

  @override
  _FindUserScreenEventStartConversation get _value =>
      super._value as _FindUserScreenEventStartConversation;

  @override
  $Res call({
    Object user = freezed,
    Object otherUser = freezed,
  }) {
    return _then(_FindUserScreenEventStartConversation(
      user == freezed ? _value.user : user as User,
      otherUser == freezed ? _value.otherUser : otherUser as User,
    ));
  }
}

class _$_FindUserScreenEventStartConversation
    implements _FindUserScreenEventStartConversation {
  const _$_FindUserScreenEventStartConversation(this.user, this.otherUser)
      : assert(user != null),
        assert(otherUser != null);

  @override
  final User user;
  @override
  final User otherUser;

  @override
  String toString() {
    return 'FindUserScreenEvent.startConveration(user: $user, otherUser: $otherUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FindUserScreenEventStartConversation &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.otherUser, otherUser) ||
                const DeepCollectionEquality()
                    .equals(other.otherUser, otherUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(otherUser);

  @override
  _$FindUserScreenEventStartConversationCopyWith<
          _FindUserScreenEventStartConversation>
      get copyWith => __$FindUserScreenEventStartConversationCopyWithImpl<
          _FindUserScreenEventStartConversation>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result findUserByUID(String uid),
    @required Result random(String userId),
    @required Result startConveration(User user, User otherUser),
  }) {
    assert(findUserByUID != null);
    assert(random != null);
    assert(startConveration != null);
    return startConveration(user, otherUser);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result findUserByUID(String uid),
    Result random(String userId),
    Result startConveration(User user, User otherUser),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (startConveration != null) {
      return startConveration(user, otherUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result findUserByUID(_FindUserScreenEventUID value),
    @required Result random(_FindUserScreenEventRandom value),
    @required
        Result startConveration(_FindUserScreenEventStartConversation value),
  }) {
    assert(findUserByUID != null);
    assert(random != null);
    assert(startConveration != null);
    return startConveration(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result findUserByUID(_FindUserScreenEventUID value),
    Result random(_FindUserScreenEventRandom value),
    Result startConveration(_FindUserScreenEventStartConversation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (startConveration != null) {
      return startConveration(this);
    }
    return orElse();
  }
}

abstract class _FindUserScreenEventStartConversation
    implements FindUserScreenEvent {
  const factory _FindUserScreenEventStartConversation(
      User user, User otherUser) = _$_FindUserScreenEventStartConversation;

  User get user;
  User get otherUser;
  _$FindUserScreenEventStartConversationCopyWith<
      _FindUserScreenEventStartConversation> get copyWith;
}

class _$FindUserScreenStateTearOff {
  const _$FindUserScreenStateTearOff();

  _FindUserScreenStateInitial initial() {
    return const _FindUserScreenStateInitial();
  }

  FindUserScreenStateLoading loading() {
    return const FindUserScreenStateLoading();
  }

  _FindUserScreenStateLoaded loaded(User user) {
    return _FindUserScreenStateLoaded(
      user,
    );
  }

  _FindUserScreenStateError error(String message) {
    return _FindUserScreenStateError(
      message,
    );
  }
}

// ignore: unused_element
const $FindUserScreenState = _$FindUserScreenStateTearOff();

mixin _$FindUserScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(User user),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(User user),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_FindUserScreenStateInitial value),
    @required Result loading(FindUserScreenStateLoading value),
    @required Result loaded(_FindUserScreenStateLoaded value),
    @required Result error(_FindUserScreenStateError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_FindUserScreenStateInitial value),
    Result loading(FindUserScreenStateLoading value),
    Result loaded(_FindUserScreenStateLoaded value),
    Result error(_FindUserScreenStateError value),
    @required Result orElse(),
  });
}

abstract class $FindUserScreenStateCopyWith<$Res> {
  factory $FindUserScreenStateCopyWith(
          FindUserScreenState value, $Res Function(FindUserScreenState) then) =
      _$FindUserScreenStateCopyWithImpl<$Res>;
}

class _$FindUserScreenStateCopyWithImpl<$Res>
    implements $FindUserScreenStateCopyWith<$Res> {
  _$FindUserScreenStateCopyWithImpl(this._value, this._then);

  final FindUserScreenState _value;
  // ignore: unused_field
  final $Res Function(FindUserScreenState) _then;
}

abstract class _$FindUserScreenStateInitialCopyWith<$Res> {
  factory _$FindUserScreenStateInitialCopyWith(
          _FindUserScreenStateInitial value,
          $Res Function(_FindUserScreenStateInitial) then) =
      __$FindUserScreenStateInitialCopyWithImpl<$Res>;
}

class __$FindUserScreenStateInitialCopyWithImpl<$Res>
    extends _$FindUserScreenStateCopyWithImpl<$Res>
    implements _$FindUserScreenStateInitialCopyWith<$Res> {
  __$FindUserScreenStateInitialCopyWithImpl(_FindUserScreenStateInitial _value,
      $Res Function(_FindUserScreenStateInitial) _then)
      : super(_value, (v) => _then(v as _FindUserScreenStateInitial));

  @override
  _FindUserScreenStateInitial get _value =>
      super._value as _FindUserScreenStateInitial;
}

class _$_FindUserScreenStateInitial implements _FindUserScreenStateInitial {
  const _$_FindUserScreenStateInitial();

  @override
  String toString() {
    return 'FindUserScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FindUserScreenStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(User user),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(User user),
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
    @required Result initial(_FindUserScreenStateInitial value),
    @required Result loading(FindUserScreenStateLoading value),
    @required Result loaded(_FindUserScreenStateLoaded value),
    @required Result error(_FindUserScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_FindUserScreenStateInitial value),
    Result loading(FindUserScreenStateLoading value),
    Result loaded(_FindUserScreenStateLoaded value),
    Result error(_FindUserScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _FindUserScreenStateInitial implements FindUserScreenState {
  const factory _FindUserScreenStateInitial() = _$_FindUserScreenStateInitial;
}

abstract class $FindUserScreenStateLoadingCopyWith<$Res> {
  factory $FindUserScreenStateLoadingCopyWith(FindUserScreenStateLoading value,
          $Res Function(FindUserScreenStateLoading) then) =
      _$FindUserScreenStateLoadingCopyWithImpl<$Res>;
}

class _$FindUserScreenStateLoadingCopyWithImpl<$Res>
    extends _$FindUserScreenStateCopyWithImpl<$Res>
    implements $FindUserScreenStateLoadingCopyWith<$Res> {
  _$FindUserScreenStateLoadingCopyWithImpl(FindUserScreenStateLoading _value,
      $Res Function(FindUserScreenStateLoading) _then)
      : super(_value, (v) => _then(v as FindUserScreenStateLoading));

  @override
  FindUserScreenStateLoading get _value =>
      super._value as FindUserScreenStateLoading;
}

class _$FindUserScreenStateLoading implements FindUserScreenStateLoading {
  const _$FindUserScreenStateLoading();

  @override
  String toString() {
    return 'FindUserScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FindUserScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(User user),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(User user),
    Result error(String message),
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
    @required Result initial(_FindUserScreenStateInitial value),
    @required Result loading(FindUserScreenStateLoading value),
    @required Result loaded(_FindUserScreenStateLoaded value),
    @required Result error(_FindUserScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_FindUserScreenStateInitial value),
    Result loading(FindUserScreenStateLoading value),
    Result loaded(_FindUserScreenStateLoaded value),
    Result error(_FindUserScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FindUserScreenStateLoading implements FindUserScreenState {
  const factory FindUserScreenStateLoading() = _$FindUserScreenStateLoading;
}

abstract class _$FindUserScreenStateLoadedCopyWith<$Res> {
  factory _$FindUserScreenStateLoadedCopyWith(_FindUserScreenStateLoaded value,
          $Res Function(_FindUserScreenStateLoaded) then) =
      __$FindUserScreenStateLoadedCopyWithImpl<$Res>;
  $Res call({User user});
}

class __$FindUserScreenStateLoadedCopyWithImpl<$Res>
    extends _$FindUserScreenStateCopyWithImpl<$Res>
    implements _$FindUserScreenStateLoadedCopyWith<$Res> {
  __$FindUserScreenStateLoadedCopyWithImpl(_FindUserScreenStateLoaded _value,
      $Res Function(_FindUserScreenStateLoaded) _then)
      : super(_value, (v) => _then(v as _FindUserScreenStateLoaded));

  @override
  _FindUserScreenStateLoaded get _value =>
      super._value as _FindUserScreenStateLoaded;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(_FindUserScreenStateLoaded(
      user == freezed ? _value.user : user as User,
    ));
  }
}

class _$_FindUserScreenStateLoaded implements _FindUserScreenStateLoaded {
  const _$_FindUserScreenStateLoaded(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString() {
    return 'FindUserScreenState.loaded(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FindUserScreenStateLoaded &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  _$FindUserScreenStateLoadedCopyWith<_FindUserScreenStateLoaded>
      get copyWith =>
          __$FindUserScreenStateLoadedCopyWithImpl<_FindUserScreenStateLoaded>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(User user),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(User user),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_FindUserScreenStateInitial value),
    @required Result loading(FindUserScreenStateLoading value),
    @required Result loaded(_FindUserScreenStateLoaded value),
    @required Result error(_FindUserScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_FindUserScreenStateInitial value),
    Result loading(FindUserScreenStateLoading value),
    Result loaded(_FindUserScreenStateLoaded value),
    Result error(_FindUserScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _FindUserScreenStateLoaded implements FindUserScreenState {
  const factory _FindUserScreenStateLoaded(User user) =
      _$_FindUserScreenStateLoaded;

  User get user;
  _$FindUserScreenStateLoadedCopyWith<_FindUserScreenStateLoaded> get copyWith;
}

abstract class _$FindUserScreenStateErrorCopyWith<$Res> {
  factory _$FindUserScreenStateErrorCopyWith(_FindUserScreenStateError value,
          $Res Function(_FindUserScreenStateError) then) =
      __$FindUserScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$FindUserScreenStateErrorCopyWithImpl<$Res>
    extends _$FindUserScreenStateCopyWithImpl<$Res>
    implements _$FindUserScreenStateErrorCopyWith<$Res> {
  __$FindUserScreenStateErrorCopyWithImpl(_FindUserScreenStateError _value,
      $Res Function(_FindUserScreenStateError) _then)
      : super(_value, (v) => _then(v as _FindUserScreenStateError));

  @override
  _FindUserScreenStateError get _value =>
      super._value as _FindUserScreenStateError;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_FindUserScreenStateError(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_FindUserScreenStateError implements _FindUserScreenStateError {
  const _$_FindUserScreenStateError(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'FindUserScreenState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FindUserScreenStateError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$FindUserScreenStateErrorCopyWith<_FindUserScreenStateError> get copyWith =>
      __$FindUserScreenStateErrorCopyWithImpl<_FindUserScreenStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loaded(User user),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loaded(User user),
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
    @required Result initial(_FindUserScreenStateInitial value),
    @required Result loading(FindUserScreenStateLoading value),
    @required Result loaded(_FindUserScreenStateLoaded value),
    @required Result error(_FindUserScreenStateError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_FindUserScreenStateInitial value),
    Result loading(FindUserScreenStateLoading value),
    Result loaded(_FindUserScreenStateLoaded value),
    Result error(_FindUserScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _FindUserScreenStateError implements FindUserScreenState {
  const factory _FindUserScreenStateError(String message) =
      _$_FindUserScreenStateError;

  String get message;
  _$FindUserScreenStateErrorCopyWith<_FindUserScreenStateError> get copyWith;
}
