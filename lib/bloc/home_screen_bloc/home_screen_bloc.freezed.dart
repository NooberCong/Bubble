// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'home_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HomeScreenEventTearOff {
  const _$HomeScreenEventTearOff();

  _HomeScreenEventConversations requestConversations(String uid) {
    return _HomeScreenEventConversations(
      uid,
    );
  }
}

// ignore: unused_element
const $HomeScreenEvent = _$HomeScreenEventTearOff();

mixin _$HomeScreenEvent {
  String get uid;

  $HomeScreenEventCopyWith<HomeScreenEvent> get copyWith;
}

abstract class $HomeScreenEventCopyWith<$Res> {
  factory $HomeScreenEventCopyWith(
          HomeScreenEvent value, $Res Function(HomeScreenEvent) then) =
      _$HomeScreenEventCopyWithImpl<$Res>;
  $Res call({String uid});
}

class _$HomeScreenEventCopyWithImpl<$Res>
    implements $HomeScreenEventCopyWith<$Res> {
  _$HomeScreenEventCopyWithImpl(this._value, this._then);

  final HomeScreenEvent _value;
  // ignore: unused_field
  final $Res Function(HomeScreenEvent) _then;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
    ));
  }
}

abstract class _$HomeScreenEventConversationsCopyWith<$Res>
    implements $HomeScreenEventCopyWith<$Res> {
  factory _$HomeScreenEventConversationsCopyWith(
          _HomeScreenEventConversations value,
          $Res Function(_HomeScreenEventConversations) then) =
      __$HomeScreenEventConversationsCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

class __$HomeScreenEventConversationsCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res>
    implements _$HomeScreenEventConversationsCopyWith<$Res> {
  __$HomeScreenEventConversationsCopyWithImpl(
      _HomeScreenEventConversations _value,
      $Res Function(_HomeScreenEventConversations) _then)
      : super(_value, (v) => _then(v as _HomeScreenEventConversations));

  @override
  _HomeScreenEventConversations get _value =>
      super._value as _HomeScreenEventConversations;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(_HomeScreenEventConversations(
      uid == freezed ? _value.uid : uid as String,
    ));
  }
}

class _$_HomeScreenEventConversations implements _HomeScreenEventConversations {
  const _$_HomeScreenEventConversations(this.uid) : assert(uid != null);

  @override
  final String uid;

  @override
  String toString() {
    return 'HomeScreenEvent.requestConversations(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeScreenEventConversations &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(uid);

  @override
  _$HomeScreenEventConversationsCopyWith<_HomeScreenEventConversations>
      get copyWith => __$HomeScreenEventConversationsCopyWithImpl<
          _HomeScreenEventConversations>(this, _$identity);
}

abstract class _HomeScreenEventConversations implements HomeScreenEvent {
  const factory _HomeScreenEventConversations(String uid) =
      _$_HomeScreenEventConversations;

  @override
  String get uid;
  @override
  _$HomeScreenEventConversationsCopyWith<_HomeScreenEventConversations>
      get copyWith;
}

class _$HomeScreenStateTearOff {
  const _$HomeScreenStateTearOff();

  _HomeScreenStateInitial initial() {
    return const _HomeScreenStateInitial();
  }

  _HomeScreenStateConversationsLoaded conversationsStreamLoaded(
      Stream<dynamic> conversationsStream) {
    return _HomeScreenStateConversationsLoaded(
      conversationsStream,
    );
  }

  _HomeScreenStateError error(String message) {
    return _HomeScreenStateError(
      message,
    );
  }
}

// ignore: unused_element
const $HomeScreenState = _$HomeScreenStateTearOff();

mixin _$HomeScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result conversationsStreamLoaded(Stream<dynamic> conversationsStream),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result conversationsStreamLoaded(Stream<dynamic> conversationsStream),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_HomeScreenStateInitial value),
    @required
        Result conversationsStreamLoaded(
            _HomeScreenStateConversationsLoaded value),
    @required Result error(_HomeScreenStateError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_HomeScreenStateInitial value),
    Result conversationsStreamLoaded(_HomeScreenStateConversationsLoaded value),
    Result error(_HomeScreenStateError value),
    @required Result orElse(),
  });
}

abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res>;
}

class _$HomeScreenStateCopyWithImpl<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  final HomeScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeScreenState) _then;
}

abstract class _$HomeScreenStateInitialCopyWith<$Res> {
  factory _$HomeScreenStateInitialCopyWith(_HomeScreenStateInitial value,
          $Res Function(_HomeScreenStateInitial) then) =
      __$HomeScreenStateInitialCopyWithImpl<$Res>;
}

class __$HomeScreenStateInitialCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$HomeScreenStateInitialCopyWith<$Res> {
  __$HomeScreenStateInitialCopyWithImpl(_HomeScreenStateInitial _value,
      $Res Function(_HomeScreenStateInitial) _then)
      : super(_value, (v) => _then(v as _HomeScreenStateInitial));

  @override
  _HomeScreenStateInitial get _value => super._value as _HomeScreenStateInitial;
}

class _$_HomeScreenStateInitial implements _HomeScreenStateInitial {
  const _$_HomeScreenStateInitial();

  @override
  String toString() {
    return 'HomeScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _HomeScreenStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result conversationsStreamLoaded(Stream<dynamic> conversationsStream),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(conversationsStreamLoaded != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result conversationsStreamLoaded(Stream<dynamic> conversationsStream),
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
    @required Result initial(_HomeScreenStateInitial value),
    @required
        Result conversationsStreamLoaded(
            _HomeScreenStateConversationsLoaded value),
    @required Result error(_HomeScreenStateError value),
  }) {
    assert(initial != null);
    assert(conversationsStreamLoaded != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_HomeScreenStateInitial value),
    Result conversationsStreamLoaded(_HomeScreenStateConversationsLoaded value),
    Result error(_HomeScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _HomeScreenStateInitial implements HomeScreenState {
  const factory _HomeScreenStateInitial() = _$_HomeScreenStateInitial;
}

abstract class _$HomeScreenStateConversationsLoadedCopyWith<$Res> {
  factory _$HomeScreenStateConversationsLoadedCopyWith(
          _HomeScreenStateConversationsLoaded value,
          $Res Function(_HomeScreenStateConversationsLoaded) then) =
      __$HomeScreenStateConversationsLoadedCopyWithImpl<$Res>;
  $Res call({Stream<dynamic> conversationsStream});
}

class __$HomeScreenStateConversationsLoadedCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$HomeScreenStateConversationsLoadedCopyWith<$Res> {
  __$HomeScreenStateConversationsLoadedCopyWithImpl(
      _HomeScreenStateConversationsLoaded _value,
      $Res Function(_HomeScreenStateConversationsLoaded) _then)
      : super(_value, (v) => _then(v as _HomeScreenStateConversationsLoaded));

  @override
  _HomeScreenStateConversationsLoaded get _value =>
      super._value as _HomeScreenStateConversationsLoaded;

  @override
  $Res call({
    Object conversationsStream = freezed,
  }) {
    return _then(_HomeScreenStateConversationsLoaded(
      conversationsStream == freezed
          ? _value.conversationsStream
          : conversationsStream as Stream<dynamic>,
    ));
  }
}

class _$_HomeScreenStateConversationsLoaded
    implements _HomeScreenStateConversationsLoaded {
  const _$_HomeScreenStateConversationsLoaded(this.conversationsStream)
      : assert(conversationsStream != null);

  @override
  final Stream<dynamic> conversationsStream;

  @override
  String toString() {
    return 'HomeScreenState.conversationsStreamLoaded(conversationsStream: $conversationsStream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeScreenStateConversationsLoaded &&
            (identical(other.conversationsStream, conversationsStream) ||
                const DeepCollectionEquality()
                    .equals(other.conversationsStream, conversationsStream)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(conversationsStream);

  @override
  _$HomeScreenStateConversationsLoadedCopyWith<
          _HomeScreenStateConversationsLoaded>
      get copyWith => __$HomeScreenStateConversationsLoadedCopyWithImpl<
          _HomeScreenStateConversationsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result conversationsStreamLoaded(Stream<dynamic> conversationsStream),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(conversationsStreamLoaded != null);
    assert(error != null);
    return conversationsStreamLoaded(conversationsStream);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result conversationsStreamLoaded(Stream<dynamic> conversationsStream),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (conversationsStreamLoaded != null) {
      return conversationsStreamLoaded(conversationsStream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_HomeScreenStateInitial value),
    @required
        Result conversationsStreamLoaded(
            _HomeScreenStateConversationsLoaded value),
    @required Result error(_HomeScreenStateError value),
  }) {
    assert(initial != null);
    assert(conversationsStreamLoaded != null);
    assert(error != null);
    return conversationsStreamLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_HomeScreenStateInitial value),
    Result conversationsStreamLoaded(_HomeScreenStateConversationsLoaded value),
    Result error(_HomeScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (conversationsStreamLoaded != null) {
      return conversationsStreamLoaded(this);
    }
    return orElse();
  }
}

abstract class _HomeScreenStateConversationsLoaded implements HomeScreenState {
  const factory _HomeScreenStateConversationsLoaded(
          Stream<dynamic> conversationsStream) =
      _$_HomeScreenStateConversationsLoaded;

  Stream<dynamic> get conversationsStream;
  _$HomeScreenStateConversationsLoadedCopyWith<
      _HomeScreenStateConversationsLoaded> get copyWith;
}

abstract class _$HomeScreenStateErrorCopyWith<$Res> {
  factory _$HomeScreenStateErrorCopyWith(_HomeScreenStateError value,
          $Res Function(_HomeScreenStateError) then) =
      __$HomeScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$HomeScreenStateErrorCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$HomeScreenStateErrorCopyWith<$Res> {
  __$HomeScreenStateErrorCopyWithImpl(
      _HomeScreenStateError _value, $Res Function(_HomeScreenStateError) _then)
      : super(_value, (v) => _then(v as _HomeScreenStateError));

  @override
  _HomeScreenStateError get _value => super._value as _HomeScreenStateError;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_HomeScreenStateError(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_HomeScreenStateError implements _HomeScreenStateError {
  const _$_HomeScreenStateError(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeScreenState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeScreenStateError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$HomeScreenStateErrorCopyWith<_HomeScreenStateError> get copyWith =>
      __$HomeScreenStateErrorCopyWithImpl<_HomeScreenStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required
        Result conversationsStreamLoaded(Stream<dynamic> conversationsStream),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(conversationsStreamLoaded != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result conversationsStreamLoaded(Stream<dynamic> conversationsStream),
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
    @required Result initial(_HomeScreenStateInitial value),
    @required
        Result conversationsStreamLoaded(
            _HomeScreenStateConversationsLoaded value),
    @required Result error(_HomeScreenStateError value),
  }) {
    assert(initial != null);
    assert(conversationsStreamLoaded != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_HomeScreenStateInitial value),
    Result conversationsStreamLoaded(_HomeScreenStateConversationsLoaded value),
    Result error(_HomeScreenStateError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _HomeScreenStateError implements HomeScreenState {
  const factory _HomeScreenStateError(String message) = _$_HomeScreenStateError;

  String get message;
  _$HomeScreenStateErrorCopyWith<_HomeScreenStateError> get copyWith;
}
