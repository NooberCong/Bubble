// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'conversation_photos_showcase_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ConversationPhotosShowcaseEventTearOff {
  const _$ConversationPhotosShowcaseEventTearOff();

  _ConversationPhotosShowcaseEventLoad loadImages(String roomId) {
    return _ConversationPhotosShowcaseEventLoad(
      roomId,
    );
  }
}

// ignore: unused_element
const $ConversationPhotosShowcaseEvent =
    _$ConversationPhotosShowcaseEventTearOff();

mixin _$ConversationPhotosShowcaseEvent {
  String get roomId;

  $ConversationPhotosShowcaseEventCopyWith<ConversationPhotosShowcaseEvent>
      get copyWith;
}

abstract class $ConversationPhotosShowcaseEventCopyWith<$Res> {
  factory $ConversationPhotosShowcaseEventCopyWith(
          ConversationPhotosShowcaseEvent value,
          $Res Function(ConversationPhotosShowcaseEvent) then) =
      _$ConversationPhotosShowcaseEventCopyWithImpl<$Res>;
  $Res call({String roomId});
}

class _$ConversationPhotosShowcaseEventCopyWithImpl<$Res>
    implements $ConversationPhotosShowcaseEventCopyWith<$Res> {
  _$ConversationPhotosShowcaseEventCopyWithImpl(this._value, this._then);

  final ConversationPhotosShowcaseEvent _value;
  // ignore: unused_field
  final $Res Function(ConversationPhotosShowcaseEvent) _then;

  @override
  $Res call({
    Object roomId = freezed,
  }) {
    return _then(_value.copyWith(
      roomId: roomId == freezed ? _value.roomId : roomId as String,
    ));
  }
}

abstract class _$ConversationPhotosShowcaseEventLoadCopyWith<$Res>
    implements $ConversationPhotosShowcaseEventCopyWith<$Res> {
  factory _$ConversationPhotosShowcaseEventLoadCopyWith(
          _ConversationPhotosShowcaseEventLoad value,
          $Res Function(_ConversationPhotosShowcaseEventLoad) then) =
      __$ConversationPhotosShowcaseEventLoadCopyWithImpl<$Res>;
  @override
  $Res call({String roomId});
}

class __$ConversationPhotosShowcaseEventLoadCopyWithImpl<$Res>
    extends _$ConversationPhotosShowcaseEventCopyWithImpl<$Res>
    implements _$ConversationPhotosShowcaseEventLoadCopyWith<$Res> {
  __$ConversationPhotosShowcaseEventLoadCopyWithImpl(
      _ConversationPhotosShowcaseEventLoad _value,
      $Res Function(_ConversationPhotosShowcaseEventLoad) _then)
      : super(_value, (v) => _then(v as _ConversationPhotosShowcaseEventLoad));

  @override
  _ConversationPhotosShowcaseEventLoad get _value =>
      super._value as _ConversationPhotosShowcaseEventLoad;

  @override
  $Res call({
    Object roomId = freezed,
  }) {
    return _then(_ConversationPhotosShowcaseEventLoad(
      roomId == freezed ? _value.roomId : roomId as String,
    ));
  }
}

class _$_ConversationPhotosShowcaseEventLoad
    implements _ConversationPhotosShowcaseEventLoad {
  const _$_ConversationPhotosShowcaseEventLoad(this.roomId)
      : assert(roomId != null);

  @override
  final String roomId;

  @override
  String toString() {
    return 'ConversationPhotosShowcaseEvent.loadImages(roomId: $roomId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationPhotosShowcaseEventLoad &&
            (identical(other.roomId, roomId) ||
                const DeepCollectionEquality().equals(other.roomId, roomId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(roomId);

  @override
  _$ConversationPhotosShowcaseEventLoadCopyWith<
          _ConversationPhotosShowcaseEventLoad>
      get copyWith => __$ConversationPhotosShowcaseEventLoadCopyWithImpl<
          _ConversationPhotosShowcaseEventLoad>(this, _$identity);
}

abstract class _ConversationPhotosShowcaseEventLoad
    implements ConversationPhotosShowcaseEvent {
  const factory _ConversationPhotosShowcaseEventLoad(String roomId) =
      _$_ConversationPhotosShowcaseEventLoad;

  @override
  String get roomId;
  @override
  _$ConversationPhotosShowcaseEventLoadCopyWith<
      _ConversationPhotosShowcaseEventLoad> get copyWith;
}

class _$ConversationPhotosShowcaseStateTearOff {
  const _$ConversationPhotosShowcaseStateTearOff();

  _ConversationPhotosShowcaseStateInitial initial() {
    return const _ConversationPhotosShowcaseStateInitial();
  }

  _ConversationPhotosShowcaseStateLoaded loaded(List<String> photoUrls) {
    return _ConversationPhotosShowcaseStateLoaded(
      photoUrls,
    );
  }

  _ConversationPhotosShowcaseStateLoading loading() {
    return const _ConversationPhotosShowcaseStateLoading();
  }

  _ConversationPhotosShowcaseStateError error(String message) {
    return _ConversationPhotosShowcaseStateError(
      message,
    );
  }

  _ConversationPhotosShowcaseStateEnd endReached() {
    return const _ConversationPhotosShowcaseStateEnd();
  }
}

// ignore: unused_element
const $ConversationPhotosShowcaseState =
    _$ConversationPhotosShowcaseStateTearOff();

mixin _$ConversationPhotosShowcaseState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<String> photoUrls),
    @required Result loading(),
    @required Result error(String message),
    @required Result endReached(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(List<String> photoUrls),
    Result loading(),
    Result error(String message),
    Result endReached(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ConversationPhotosShowcaseStateInitial value),
    @required Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    @required Result loading(_ConversationPhotosShowcaseStateLoading value),
    @required Result error(_ConversationPhotosShowcaseStateError value),
    @required Result endReached(_ConversationPhotosShowcaseStateEnd value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ConversationPhotosShowcaseStateInitial value),
    Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    Result loading(_ConversationPhotosShowcaseStateLoading value),
    Result error(_ConversationPhotosShowcaseStateError value),
    Result endReached(_ConversationPhotosShowcaseStateEnd value),
    @required Result orElse(),
  });
}

abstract class $ConversationPhotosShowcaseStateCopyWith<$Res> {
  factory $ConversationPhotosShowcaseStateCopyWith(
          ConversationPhotosShowcaseState value,
          $Res Function(ConversationPhotosShowcaseState) then) =
      _$ConversationPhotosShowcaseStateCopyWithImpl<$Res>;
}

class _$ConversationPhotosShowcaseStateCopyWithImpl<$Res>
    implements $ConversationPhotosShowcaseStateCopyWith<$Res> {
  _$ConversationPhotosShowcaseStateCopyWithImpl(this._value, this._then);

  final ConversationPhotosShowcaseState _value;
  // ignore: unused_field
  final $Res Function(ConversationPhotosShowcaseState) _then;
}

abstract class _$ConversationPhotosShowcaseStateInitialCopyWith<$Res> {
  factory _$ConversationPhotosShowcaseStateInitialCopyWith(
          _ConversationPhotosShowcaseStateInitial value,
          $Res Function(_ConversationPhotosShowcaseStateInitial) then) =
      __$ConversationPhotosShowcaseStateInitialCopyWithImpl<$Res>;
}

class __$ConversationPhotosShowcaseStateInitialCopyWithImpl<$Res>
    extends _$ConversationPhotosShowcaseStateCopyWithImpl<$Res>
    implements _$ConversationPhotosShowcaseStateInitialCopyWith<$Res> {
  __$ConversationPhotosShowcaseStateInitialCopyWithImpl(
      _ConversationPhotosShowcaseStateInitial _value,
      $Res Function(_ConversationPhotosShowcaseStateInitial) _then)
      : super(
            _value, (v) => _then(v as _ConversationPhotosShowcaseStateInitial));

  @override
  _ConversationPhotosShowcaseStateInitial get _value =>
      super._value as _ConversationPhotosShowcaseStateInitial;
}

class _$_ConversationPhotosShowcaseStateInitial
    implements _ConversationPhotosShowcaseStateInitial {
  const _$_ConversationPhotosShowcaseStateInitial();

  @override
  String toString() {
    return 'ConversationPhotosShowcaseState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationPhotosShowcaseStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<String> photoUrls),
    @required Result loading(),
    @required Result error(String message),
    @required Result endReached(),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(List<String> photoUrls),
    Result loading(),
    Result error(String message),
    Result endReached(),
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
    @required Result initial(_ConversationPhotosShowcaseStateInitial value),
    @required Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    @required Result loading(_ConversationPhotosShowcaseStateLoading value),
    @required Result error(_ConversationPhotosShowcaseStateError value),
    @required Result endReached(_ConversationPhotosShowcaseStateEnd value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ConversationPhotosShowcaseStateInitial value),
    Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    Result loading(_ConversationPhotosShowcaseStateLoading value),
    Result error(_ConversationPhotosShowcaseStateError value),
    Result endReached(_ConversationPhotosShowcaseStateEnd value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ConversationPhotosShowcaseStateInitial
    implements ConversationPhotosShowcaseState {
  const factory _ConversationPhotosShowcaseStateInitial() =
      _$_ConversationPhotosShowcaseStateInitial;
}

abstract class _$ConversationPhotosShowcaseStateLoadedCopyWith<$Res> {
  factory _$ConversationPhotosShowcaseStateLoadedCopyWith(
          _ConversationPhotosShowcaseStateLoaded value,
          $Res Function(_ConversationPhotosShowcaseStateLoaded) then) =
      __$ConversationPhotosShowcaseStateLoadedCopyWithImpl<$Res>;
  $Res call({List<String> photoUrls});
}

class __$ConversationPhotosShowcaseStateLoadedCopyWithImpl<$Res>
    extends _$ConversationPhotosShowcaseStateCopyWithImpl<$Res>
    implements _$ConversationPhotosShowcaseStateLoadedCopyWith<$Res> {
  __$ConversationPhotosShowcaseStateLoadedCopyWithImpl(
      _ConversationPhotosShowcaseStateLoaded _value,
      $Res Function(_ConversationPhotosShowcaseStateLoaded) _then)
      : super(
            _value, (v) => _then(v as _ConversationPhotosShowcaseStateLoaded));

  @override
  _ConversationPhotosShowcaseStateLoaded get _value =>
      super._value as _ConversationPhotosShowcaseStateLoaded;

  @override
  $Res call({
    Object photoUrls = freezed,
  }) {
    return _then(_ConversationPhotosShowcaseStateLoaded(
      photoUrls == freezed ? _value.photoUrls : photoUrls as List<String>,
    ));
  }
}

class _$_ConversationPhotosShowcaseStateLoaded
    implements _ConversationPhotosShowcaseStateLoaded {
  const _$_ConversationPhotosShowcaseStateLoaded(this.photoUrls)
      : assert(photoUrls != null);

  @override
  final List<String> photoUrls;

  @override
  String toString() {
    return 'ConversationPhotosShowcaseState.loaded(photoUrls: $photoUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationPhotosShowcaseStateLoaded &&
            (identical(other.photoUrls, photoUrls) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrls, photoUrls)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(photoUrls);

  @override
  _$ConversationPhotosShowcaseStateLoadedCopyWith<
          _ConversationPhotosShowcaseStateLoaded>
      get copyWith => __$ConversationPhotosShowcaseStateLoadedCopyWithImpl<
          _ConversationPhotosShowcaseStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<String> photoUrls),
    @required Result loading(),
    @required Result error(String message),
    @required Result endReached(),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return loaded(photoUrls);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(List<String> photoUrls),
    Result loading(),
    Result error(String message),
    Result endReached(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(photoUrls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ConversationPhotosShowcaseStateInitial value),
    @required Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    @required Result loading(_ConversationPhotosShowcaseStateLoading value),
    @required Result error(_ConversationPhotosShowcaseStateError value),
    @required Result endReached(_ConversationPhotosShowcaseStateEnd value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ConversationPhotosShowcaseStateInitial value),
    Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    Result loading(_ConversationPhotosShowcaseStateLoading value),
    Result error(_ConversationPhotosShowcaseStateError value),
    Result endReached(_ConversationPhotosShowcaseStateEnd value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _ConversationPhotosShowcaseStateLoaded
    implements ConversationPhotosShowcaseState {
  const factory _ConversationPhotosShowcaseStateLoaded(List<String> photoUrls) =
      _$_ConversationPhotosShowcaseStateLoaded;

  List<String> get photoUrls;
  _$ConversationPhotosShowcaseStateLoadedCopyWith<
      _ConversationPhotosShowcaseStateLoaded> get copyWith;
}

abstract class _$ConversationPhotosShowcaseStateLoadingCopyWith<$Res> {
  factory _$ConversationPhotosShowcaseStateLoadingCopyWith(
          _ConversationPhotosShowcaseStateLoading value,
          $Res Function(_ConversationPhotosShowcaseStateLoading) then) =
      __$ConversationPhotosShowcaseStateLoadingCopyWithImpl<$Res>;
}

class __$ConversationPhotosShowcaseStateLoadingCopyWithImpl<$Res>
    extends _$ConversationPhotosShowcaseStateCopyWithImpl<$Res>
    implements _$ConversationPhotosShowcaseStateLoadingCopyWith<$Res> {
  __$ConversationPhotosShowcaseStateLoadingCopyWithImpl(
      _ConversationPhotosShowcaseStateLoading _value,
      $Res Function(_ConversationPhotosShowcaseStateLoading) _then)
      : super(
            _value, (v) => _then(v as _ConversationPhotosShowcaseStateLoading));

  @override
  _ConversationPhotosShowcaseStateLoading get _value =>
      super._value as _ConversationPhotosShowcaseStateLoading;
}

class _$_ConversationPhotosShowcaseStateLoading
    implements _ConversationPhotosShowcaseStateLoading {
  const _$_ConversationPhotosShowcaseStateLoading();

  @override
  String toString() {
    return 'ConversationPhotosShowcaseState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationPhotosShowcaseStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<String> photoUrls),
    @required Result loading(),
    @required Result error(String message),
    @required Result endReached(),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(List<String> photoUrls),
    Result loading(),
    Result error(String message),
    Result endReached(),
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
    @required Result initial(_ConversationPhotosShowcaseStateInitial value),
    @required Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    @required Result loading(_ConversationPhotosShowcaseStateLoading value),
    @required Result error(_ConversationPhotosShowcaseStateError value),
    @required Result endReached(_ConversationPhotosShowcaseStateEnd value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ConversationPhotosShowcaseStateInitial value),
    Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    Result loading(_ConversationPhotosShowcaseStateLoading value),
    Result error(_ConversationPhotosShowcaseStateError value),
    Result endReached(_ConversationPhotosShowcaseStateEnd value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ConversationPhotosShowcaseStateLoading
    implements ConversationPhotosShowcaseState {
  const factory _ConversationPhotosShowcaseStateLoading() =
      _$_ConversationPhotosShowcaseStateLoading;
}

abstract class _$ConversationPhotosShowcaseStateErrorCopyWith<$Res> {
  factory _$ConversationPhotosShowcaseStateErrorCopyWith(
          _ConversationPhotosShowcaseStateError value,
          $Res Function(_ConversationPhotosShowcaseStateError) then) =
      __$ConversationPhotosShowcaseStateErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$ConversationPhotosShowcaseStateErrorCopyWithImpl<$Res>
    extends _$ConversationPhotosShowcaseStateCopyWithImpl<$Res>
    implements _$ConversationPhotosShowcaseStateErrorCopyWith<$Res> {
  __$ConversationPhotosShowcaseStateErrorCopyWithImpl(
      _ConversationPhotosShowcaseStateError _value,
      $Res Function(_ConversationPhotosShowcaseStateError) _then)
      : super(_value, (v) => _then(v as _ConversationPhotosShowcaseStateError));

  @override
  _ConversationPhotosShowcaseStateError get _value =>
      super._value as _ConversationPhotosShowcaseStateError;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_ConversationPhotosShowcaseStateError(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_ConversationPhotosShowcaseStateError
    implements _ConversationPhotosShowcaseStateError {
  const _$_ConversationPhotosShowcaseStateError(this.message)
      : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'ConversationPhotosShowcaseState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationPhotosShowcaseStateError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$ConversationPhotosShowcaseStateErrorCopyWith<
          _ConversationPhotosShowcaseStateError>
      get copyWith => __$ConversationPhotosShowcaseStateErrorCopyWithImpl<
          _ConversationPhotosShowcaseStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<String> photoUrls),
    @required Result loading(),
    @required Result error(String message),
    @required Result endReached(),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(List<String> photoUrls),
    Result loading(),
    Result error(String message),
    Result endReached(),
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
    @required Result initial(_ConversationPhotosShowcaseStateInitial value),
    @required Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    @required Result loading(_ConversationPhotosShowcaseStateLoading value),
    @required Result error(_ConversationPhotosShowcaseStateError value),
    @required Result endReached(_ConversationPhotosShowcaseStateEnd value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ConversationPhotosShowcaseStateInitial value),
    Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    Result loading(_ConversationPhotosShowcaseStateLoading value),
    Result error(_ConversationPhotosShowcaseStateError value),
    Result endReached(_ConversationPhotosShowcaseStateEnd value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ConversationPhotosShowcaseStateError
    implements ConversationPhotosShowcaseState {
  const factory _ConversationPhotosShowcaseStateError(String message) =
      _$_ConversationPhotosShowcaseStateError;

  String get message;
  _$ConversationPhotosShowcaseStateErrorCopyWith<
      _ConversationPhotosShowcaseStateError> get copyWith;
}

abstract class _$ConversationPhotosShowcaseStateEndCopyWith<$Res> {
  factory _$ConversationPhotosShowcaseStateEndCopyWith(
          _ConversationPhotosShowcaseStateEnd value,
          $Res Function(_ConversationPhotosShowcaseStateEnd) then) =
      __$ConversationPhotosShowcaseStateEndCopyWithImpl<$Res>;
}

class __$ConversationPhotosShowcaseStateEndCopyWithImpl<$Res>
    extends _$ConversationPhotosShowcaseStateCopyWithImpl<$Res>
    implements _$ConversationPhotosShowcaseStateEndCopyWith<$Res> {
  __$ConversationPhotosShowcaseStateEndCopyWithImpl(
      _ConversationPhotosShowcaseStateEnd _value,
      $Res Function(_ConversationPhotosShowcaseStateEnd) _then)
      : super(_value, (v) => _then(v as _ConversationPhotosShowcaseStateEnd));

  @override
  _ConversationPhotosShowcaseStateEnd get _value =>
      super._value as _ConversationPhotosShowcaseStateEnd;
}

class _$_ConversationPhotosShowcaseStateEnd
    implements _ConversationPhotosShowcaseStateEnd {
  const _$_ConversationPhotosShowcaseStateEnd();

  @override
  String toString() {
    return 'ConversationPhotosShowcaseState.endReached()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationPhotosShowcaseStateEnd);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(List<String> photoUrls),
    @required Result loading(),
    @required Result error(String message),
    @required Result endReached(),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return endReached();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(List<String> photoUrls),
    Result loading(),
    Result error(String message),
    Result endReached(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (endReached != null) {
      return endReached();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ConversationPhotosShowcaseStateInitial value),
    @required Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    @required Result loading(_ConversationPhotosShowcaseStateLoading value),
    @required Result error(_ConversationPhotosShowcaseStateError value),
    @required Result endReached(_ConversationPhotosShowcaseStateEnd value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(loading != null);
    assert(error != null);
    assert(endReached != null);
    return endReached(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ConversationPhotosShowcaseStateInitial value),
    Result loaded(_ConversationPhotosShowcaseStateLoaded value),
    Result loading(_ConversationPhotosShowcaseStateLoading value),
    Result error(_ConversationPhotosShowcaseStateError value),
    Result endReached(_ConversationPhotosShowcaseStateEnd value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (endReached != null) {
      return endReached(this);
    }
    return orElse();
  }
}

abstract class _ConversationPhotosShowcaseStateEnd
    implements ConversationPhotosShowcaseState {
  const factory _ConversationPhotosShowcaseStateEnd() =
      _$_ConversationPhotosShowcaseStateEnd;
}
