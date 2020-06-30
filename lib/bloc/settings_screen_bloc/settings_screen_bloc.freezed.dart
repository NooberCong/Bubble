// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'settings_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SettingsScreenEventTearOff {
  const _$SettingsScreenEventTearOff();

  _SettingsScreenEditAvatar editAvatar(String imagePath) {
    return _SettingsScreenEditAvatar(
      imagePath,
    );
  }

  _SettingsScreenEventEditBio editBio(String uid, String bio) {
    return _SettingsScreenEventEditBio(
      uid,
      bio,
    );
  }

  _SettingsScreenEventRequestUserStream requestUserStream(String uid) {
    return _SettingsScreenEventRequestUserStream(
      uid,
    );
  }
}

// ignore: unused_element
const $SettingsScreenEvent = _$SettingsScreenEventTearOff();

mixin _$SettingsScreenEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result editAvatar(String imagePath),
    @required Result editBio(String uid, String bio),
    @required Result requestUserStream(String uid),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result editAvatar(String imagePath),
    Result editBio(String uid, String bio),
    Result requestUserStream(String uid),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result editAvatar(_SettingsScreenEditAvatar value),
    @required Result editBio(_SettingsScreenEventEditBio value),
    @required
        Result requestUserStream(_SettingsScreenEventRequestUserStream value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result editAvatar(_SettingsScreenEditAvatar value),
    Result editBio(_SettingsScreenEventEditBio value),
    Result requestUserStream(_SettingsScreenEventRequestUserStream value),
    @required Result orElse(),
  });
}

abstract class $SettingsScreenEventCopyWith<$Res> {
  factory $SettingsScreenEventCopyWith(
          SettingsScreenEvent value, $Res Function(SettingsScreenEvent) then) =
      _$SettingsScreenEventCopyWithImpl<$Res>;
}

class _$SettingsScreenEventCopyWithImpl<$Res>
    implements $SettingsScreenEventCopyWith<$Res> {
  _$SettingsScreenEventCopyWithImpl(this._value, this._then);

  final SettingsScreenEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsScreenEvent) _then;
}

abstract class _$SettingsScreenEditAvatarCopyWith<$Res> {
  factory _$SettingsScreenEditAvatarCopyWith(_SettingsScreenEditAvatar value,
          $Res Function(_SettingsScreenEditAvatar) then) =
      __$SettingsScreenEditAvatarCopyWithImpl<$Res>;
  $Res call({String imagePath});
}

class __$SettingsScreenEditAvatarCopyWithImpl<$Res>
    extends _$SettingsScreenEventCopyWithImpl<$Res>
    implements _$SettingsScreenEditAvatarCopyWith<$Res> {
  __$SettingsScreenEditAvatarCopyWithImpl(_SettingsScreenEditAvatar _value,
      $Res Function(_SettingsScreenEditAvatar) _then)
      : super(_value, (v) => _then(v as _SettingsScreenEditAvatar));

  @override
  _SettingsScreenEditAvatar get _value =>
      super._value as _SettingsScreenEditAvatar;

  @override
  $Res call({
    Object imagePath = freezed,
  }) {
    return _then(_SettingsScreenEditAvatar(
      imagePath == freezed ? _value.imagePath : imagePath as String,
    ));
  }
}

class _$_SettingsScreenEditAvatar implements _SettingsScreenEditAvatar {
  const _$_SettingsScreenEditAvatar(this.imagePath) : assert(imagePath != null);

  @override
  final String imagePath;

  @override
  String toString() {
    return 'SettingsScreenEvent.editAvatar(imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsScreenEditAvatar &&
            (identical(other.imagePath, imagePath) ||
                const DeepCollectionEquality()
                    .equals(other.imagePath, imagePath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(imagePath);

  @override
  _$SettingsScreenEditAvatarCopyWith<_SettingsScreenEditAvatar> get copyWith =>
      __$SettingsScreenEditAvatarCopyWithImpl<_SettingsScreenEditAvatar>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result editAvatar(String imagePath),
    @required Result editBio(String uid, String bio),
    @required Result requestUserStream(String uid),
  }) {
    assert(editAvatar != null);
    assert(editBio != null);
    assert(requestUserStream != null);
    return editAvatar(imagePath);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result editAvatar(String imagePath),
    Result editBio(String uid, String bio),
    Result requestUserStream(String uid),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editAvatar != null) {
      return editAvatar(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result editAvatar(_SettingsScreenEditAvatar value),
    @required Result editBio(_SettingsScreenEventEditBio value),
    @required
        Result requestUserStream(_SettingsScreenEventRequestUserStream value),
  }) {
    assert(editAvatar != null);
    assert(editBio != null);
    assert(requestUserStream != null);
    return editAvatar(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result editAvatar(_SettingsScreenEditAvatar value),
    Result editBio(_SettingsScreenEventEditBio value),
    Result requestUserStream(_SettingsScreenEventRequestUserStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editAvatar != null) {
      return editAvatar(this);
    }
    return orElse();
  }
}

abstract class _SettingsScreenEditAvatar implements SettingsScreenEvent {
  const factory _SettingsScreenEditAvatar(String imagePath) =
      _$_SettingsScreenEditAvatar;

  String get imagePath;
  _$SettingsScreenEditAvatarCopyWith<_SettingsScreenEditAvatar> get copyWith;
}

abstract class _$SettingsScreenEventEditBioCopyWith<$Res> {
  factory _$SettingsScreenEventEditBioCopyWith(
          _SettingsScreenEventEditBio value,
          $Res Function(_SettingsScreenEventEditBio) then) =
      __$SettingsScreenEventEditBioCopyWithImpl<$Res>;
  $Res call({String uid, String bio});
}

class __$SettingsScreenEventEditBioCopyWithImpl<$Res>
    extends _$SettingsScreenEventCopyWithImpl<$Res>
    implements _$SettingsScreenEventEditBioCopyWith<$Res> {
  __$SettingsScreenEventEditBioCopyWithImpl(_SettingsScreenEventEditBio _value,
      $Res Function(_SettingsScreenEventEditBio) _then)
      : super(_value, (v) => _then(v as _SettingsScreenEventEditBio));

  @override
  _SettingsScreenEventEditBio get _value =>
      super._value as _SettingsScreenEventEditBio;

  @override
  $Res call({
    Object uid = freezed,
    Object bio = freezed,
  }) {
    return _then(_SettingsScreenEventEditBio(
      uid == freezed ? _value.uid : uid as String,
      bio == freezed ? _value.bio : bio as String,
    ));
  }
}

class _$_SettingsScreenEventEditBio implements _SettingsScreenEventEditBio {
  const _$_SettingsScreenEventEditBio(this.uid, this.bio)
      : assert(uid != null),
        assert(bio != null);

  @override
  final String uid;
  @override
  final String bio;

  @override
  String toString() {
    return 'SettingsScreenEvent.editBio(uid: $uid, bio: $bio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsScreenEventEditBio &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.bio, bio) ||
                const DeepCollectionEquality().equals(other.bio, bio)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(bio);

  @override
  _$SettingsScreenEventEditBioCopyWith<_SettingsScreenEventEditBio>
      get copyWith => __$SettingsScreenEventEditBioCopyWithImpl<
          _SettingsScreenEventEditBio>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result editAvatar(String imagePath),
    @required Result editBio(String uid, String bio),
    @required Result requestUserStream(String uid),
  }) {
    assert(editAvatar != null);
    assert(editBio != null);
    assert(requestUserStream != null);
    return editBio(uid, bio);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result editAvatar(String imagePath),
    Result editBio(String uid, String bio),
    Result requestUserStream(String uid),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editBio != null) {
      return editBio(uid, bio);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result editAvatar(_SettingsScreenEditAvatar value),
    @required Result editBio(_SettingsScreenEventEditBio value),
    @required
        Result requestUserStream(_SettingsScreenEventRequestUserStream value),
  }) {
    assert(editAvatar != null);
    assert(editBio != null);
    assert(requestUserStream != null);
    return editBio(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result editAvatar(_SettingsScreenEditAvatar value),
    Result editBio(_SettingsScreenEventEditBio value),
    Result requestUserStream(_SettingsScreenEventRequestUserStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editBio != null) {
      return editBio(this);
    }
    return orElse();
  }
}

abstract class _SettingsScreenEventEditBio implements SettingsScreenEvent {
  const factory _SettingsScreenEventEditBio(String uid, String bio) =
      _$_SettingsScreenEventEditBio;

  String get uid;
  String get bio;
  _$SettingsScreenEventEditBioCopyWith<_SettingsScreenEventEditBio>
      get copyWith;
}

abstract class _$SettingsScreenEventRequestUserStreamCopyWith<$Res> {
  factory _$SettingsScreenEventRequestUserStreamCopyWith(
          _SettingsScreenEventRequestUserStream value,
          $Res Function(_SettingsScreenEventRequestUserStream) then) =
      __$SettingsScreenEventRequestUserStreamCopyWithImpl<$Res>;
  $Res call({String uid});
}

class __$SettingsScreenEventRequestUserStreamCopyWithImpl<$Res>
    extends _$SettingsScreenEventCopyWithImpl<$Res>
    implements _$SettingsScreenEventRequestUserStreamCopyWith<$Res> {
  __$SettingsScreenEventRequestUserStreamCopyWithImpl(
      _SettingsScreenEventRequestUserStream _value,
      $Res Function(_SettingsScreenEventRequestUserStream) _then)
      : super(_value, (v) => _then(v as _SettingsScreenEventRequestUserStream));

  @override
  _SettingsScreenEventRequestUserStream get _value =>
      super._value as _SettingsScreenEventRequestUserStream;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(_SettingsScreenEventRequestUserStream(
      uid == freezed ? _value.uid : uid as String,
    ));
  }
}

class _$_SettingsScreenEventRequestUserStream
    implements _SettingsScreenEventRequestUserStream {
  const _$_SettingsScreenEventRequestUserStream(this.uid) : assert(uid != null);

  @override
  final String uid;

  @override
  String toString() {
    return 'SettingsScreenEvent.requestUserStream(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsScreenEventRequestUserStream &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(uid);

  @override
  _$SettingsScreenEventRequestUserStreamCopyWith<
          _SettingsScreenEventRequestUserStream>
      get copyWith => __$SettingsScreenEventRequestUserStreamCopyWithImpl<
          _SettingsScreenEventRequestUserStream>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result editAvatar(String imagePath),
    @required Result editBio(String uid, String bio),
    @required Result requestUserStream(String uid),
  }) {
    assert(editAvatar != null);
    assert(editBio != null);
    assert(requestUserStream != null);
    return requestUserStream(uid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result editAvatar(String imagePath),
    Result editBio(String uid, String bio),
    Result requestUserStream(String uid),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestUserStream != null) {
      return requestUserStream(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result editAvatar(_SettingsScreenEditAvatar value),
    @required Result editBio(_SettingsScreenEventEditBio value),
    @required
        Result requestUserStream(_SettingsScreenEventRequestUserStream value),
  }) {
    assert(editAvatar != null);
    assert(editBio != null);
    assert(requestUserStream != null);
    return requestUserStream(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result editAvatar(_SettingsScreenEditAvatar value),
    Result editBio(_SettingsScreenEventEditBio value),
    Result requestUserStream(_SettingsScreenEventRequestUserStream value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestUserStream != null) {
      return requestUserStream(this);
    }
    return orElse();
  }
}

abstract class _SettingsScreenEventRequestUserStream
    implements SettingsScreenEvent {
  const factory _SettingsScreenEventRequestUserStream(String uid) =
      _$_SettingsScreenEventRequestUserStream;

  String get uid;
  _$SettingsScreenEventRequestUserStreamCopyWith<
      _SettingsScreenEventRequestUserStream> get copyWith;
}

class _$SettingsScreenStateTearOff {
  const _$SettingsScreenStateTearOff();

  _SettingsScreenStateInitial initial() {
    return const _SettingsScreenStateInitial();
  }

  _SettingsScreenStateUserStreamLoaded userStreamLoaded(
      Stream<dynamic> stream) {
    return _SettingsScreenStateUserStreamLoaded(
      stream,
    );
  }

  SettingsScreenStateNotify notify(String message) {
    return SettingsScreenStateNotify(
      message,
    );
  }
}

// ignore: unused_element
const $SettingsScreenState = _$SettingsScreenStateTearOff();

mixin _$SettingsScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result userStreamLoaded(Stream<dynamic> stream),
    @required Result notify(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result userStreamLoaded(Stream<dynamic> stream),
    Result notify(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SettingsScreenStateInitial value),
    @required
        Result userStreamLoaded(_SettingsScreenStateUserStreamLoaded value),
    @required Result notify(SettingsScreenStateNotify value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SettingsScreenStateInitial value),
    Result userStreamLoaded(_SettingsScreenStateUserStreamLoaded value),
    Result notify(SettingsScreenStateNotify value),
    @required Result orElse(),
  });
}

abstract class $SettingsScreenStateCopyWith<$Res> {
  factory $SettingsScreenStateCopyWith(
          SettingsScreenState value, $Res Function(SettingsScreenState) then) =
      _$SettingsScreenStateCopyWithImpl<$Res>;
}

class _$SettingsScreenStateCopyWithImpl<$Res>
    implements $SettingsScreenStateCopyWith<$Res> {
  _$SettingsScreenStateCopyWithImpl(this._value, this._then);

  final SettingsScreenState _value;
  // ignore: unused_field
  final $Res Function(SettingsScreenState) _then;
}

abstract class _$SettingsScreenStateInitialCopyWith<$Res> {
  factory _$SettingsScreenStateInitialCopyWith(
          _SettingsScreenStateInitial value,
          $Res Function(_SettingsScreenStateInitial) then) =
      __$SettingsScreenStateInitialCopyWithImpl<$Res>;
}

class __$SettingsScreenStateInitialCopyWithImpl<$Res>
    extends _$SettingsScreenStateCopyWithImpl<$Res>
    implements _$SettingsScreenStateInitialCopyWith<$Res> {
  __$SettingsScreenStateInitialCopyWithImpl(_SettingsScreenStateInitial _value,
      $Res Function(_SettingsScreenStateInitial) _then)
      : super(_value, (v) => _then(v as _SettingsScreenStateInitial));

  @override
  _SettingsScreenStateInitial get _value =>
      super._value as _SettingsScreenStateInitial;
}

class _$_SettingsScreenStateInitial implements _SettingsScreenStateInitial {
  const _$_SettingsScreenStateInitial();

  @override
  String toString() {
    return 'SettingsScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SettingsScreenStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result userStreamLoaded(Stream<dynamic> stream),
    @required Result notify(String message),
  }) {
    assert(initial != null);
    assert(userStreamLoaded != null);
    assert(notify != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result userStreamLoaded(Stream<dynamic> stream),
    Result notify(String message),
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
    @required Result initial(_SettingsScreenStateInitial value),
    @required
        Result userStreamLoaded(_SettingsScreenStateUserStreamLoaded value),
    @required Result notify(SettingsScreenStateNotify value),
  }) {
    assert(initial != null);
    assert(userStreamLoaded != null);
    assert(notify != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SettingsScreenStateInitial value),
    Result userStreamLoaded(_SettingsScreenStateUserStreamLoaded value),
    Result notify(SettingsScreenStateNotify value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SettingsScreenStateInitial implements SettingsScreenState {
  const factory _SettingsScreenStateInitial() = _$_SettingsScreenStateInitial;
}

abstract class _$SettingsScreenStateUserStreamLoadedCopyWith<$Res> {
  factory _$SettingsScreenStateUserStreamLoadedCopyWith(
          _SettingsScreenStateUserStreamLoaded value,
          $Res Function(_SettingsScreenStateUserStreamLoaded) then) =
      __$SettingsScreenStateUserStreamLoadedCopyWithImpl<$Res>;
  $Res call({Stream<dynamic> stream});
}

class __$SettingsScreenStateUserStreamLoadedCopyWithImpl<$Res>
    extends _$SettingsScreenStateCopyWithImpl<$Res>
    implements _$SettingsScreenStateUserStreamLoadedCopyWith<$Res> {
  __$SettingsScreenStateUserStreamLoadedCopyWithImpl(
      _SettingsScreenStateUserStreamLoaded _value,
      $Res Function(_SettingsScreenStateUserStreamLoaded) _then)
      : super(_value, (v) => _then(v as _SettingsScreenStateUserStreamLoaded));

  @override
  _SettingsScreenStateUserStreamLoaded get _value =>
      super._value as _SettingsScreenStateUserStreamLoaded;

  @override
  $Res call({
    Object stream = freezed,
  }) {
    return _then(_SettingsScreenStateUserStreamLoaded(
      stream == freezed ? _value.stream : stream as Stream<dynamic>,
    ));
  }
}

class _$_SettingsScreenStateUserStreamLoaded
    implements _SettingsScreenStateUserStreamLoaded {
  const _$_SettingsScreenStateUserStreamLoaded(this.stream)
      : assert(stream != null);

  @override
  final Stream<dynamic> stream;

  @override
  String toString() {
    return 'SettingsScreenState.userStreamLoaded(stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsScreenStateUserStreamLoaded &&
            (identical(other.stream, stream) ||
                const DeepCollectionEquality().equals(other.stream, stream)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stream);

  @override
  _$SettingsScreenStateUserStreamLoadedCopyWith<
          _SettingsScreenStateUserStreamLoaded>
      get copyWith => __$SettingsScreenStateUserStreamLoadedCopyWithImpl<
          _SettingsScreenStateUserStreamLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result userStreamLoaded(Stream<dynamic> stream),
    @required Result notify(String message),
  }) {
    assert(initial != null);
    assert(userStreamLoaded != null);
    assert(notify != null);
    return userStreamLoaded(stream);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result userStreamLoaded(Stream<dynamic> stream),
    Result notify(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userStreamLoaded != null) {
      return userStreamLoaded(stream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SettingsScreenStateInitial value),
    @required
        Result userStreamLoaded(_SettingsScreenStateUserStreamLoaded value),
    @required Result notify(SettingsScreenStateNotify value),
  }) {
    assert(initial != null);
    assert(userStreamLoaded != null);
    assert(notify != null);
    return userStreamLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SettingsScreenStateInitial value),
    Result userStreamLoaded(_SettingsScreenStateUserStreamLoaded value),
    Result notify(SettingsScreenStateNotify value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userStreamLoaded != null) {
      return userStreamLoaded(this);
    }
    return orElse();
  }
}

abstract class _SettingsScreenStateUserStreamLoaded
    implements SettingsScreenState {
  const factory _SettingsScreenStateUserStreamLoaded(Stream<dynamic> stream) =
      _$_SettingsScreenStateUserStreamLoaded;

  Stream<dynamic> get stream;
  _$SettingsScreenStateUserStreamLoadedCopyWith<
      _SettingsScreenStateUserStreamLoaded> get copyWith;
}

abstract class $SettingsScreenStateNotifyCopyWith<$Res> {
  factory $SettingsScreenStateNotifyCopyWith(SettingsScreenStateNotify value,
          $Res Function(SettingsScreenStateNotify) then) =
      _$SettingsScreenStateNotifyCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$SettingsScreenStateNotifyCopyWithImpl<$Res>
    extends _$SettingsScreenStateCopyWithImpl<$Res>
    implements $SettingsScreenStateNotifyCopyWith<$Res> {
  _$SettingsScreenStateNotifyCopyWithImpl(SettingsScreenStateNotify _value,
      $Res Function(SettingsScreenStateNotify) _then)
      : super(_value, (v) => _then(v as SettingsScreenStateNotify));

  @override
  SettingsScreenStateNotify get _value =>
      super._value as SettingsScreenStateNotify;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(SettingsScreenStateNotify(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$SettingsScreenStateNotify implements SettingsScreenStateNotify {
  const _$SettingsScreenStateNotify(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'SettingsScreenState.notify(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SettingsScreenStateNotify &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $SettingsScreenStateNotifyCopyWith<SettingsScreenStateNotify> get copyWith =>
      _$SettingsScreenStateNotifyCopyWithImpl<SettingsScreenStateNotify>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result userStreamLoaded(Stream<dynamic> stream),
    @required Result notify(String message),
  }) {
    assert(initial != null);
    assert(userStreamLoaded != null);
    assert(notify != null);
    return notify(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result userStreamLoaded(Stream<dynamic> stream),
    Result notify(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notify != null) {
      return notify(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SettingsScreenStateInitial value),
    @required
        Result userStreamLoaded(_SettingsScreenStateUserStreamLoaded value),
    @required Result notify(SettingsScreenStateNotify value),
  }) {
    assert(initial != null);
    assert(userStreamLoaded != null);
    assert(notify != null);
    return notify(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SettingsScreenStateInitial value),
    Result userStreamLoaded(_SettingsScreenStateUserStreamLoaded value),
    Result notify(SettingsScreenStateNotify value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notify != null) {
      return notify(this);
    }
    return orElse();
  }
}

abstract class SettingsScreenStateNotify implements SettingsScreenState {
  const factory SettingsScreenStateNotify(String message) =
      _$SettingsScreenStateNotify;

  String get message;
  $SettingsScreenStateNotifyCopyWith<SettingsScreenStateNotify> get copyWith;
}
