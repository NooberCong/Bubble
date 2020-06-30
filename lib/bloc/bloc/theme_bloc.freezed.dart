// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeEventTearOff {
  const _$ThemeEventTearOff();

  _ThemeEventSystem setTheme(ThemeMode mode) {
    return _ThemeEventSystem(
      mode,
    );
  }

  __ThemeEventStored restoreSavedTheme() {
    return const __ThemeEventStored();
  }
}

// ignore: unused_element
const $ThemeEvent = _$ThemeEventTearOff();

mixin _$ThemeEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setTheme(ThemeMode mode),
    @required Result restoreSavedTheme(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setTheme(ThemeMode mode),
    Result restoreSavedTheme(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setTheme(_ThemeEventSystem value),
    @required Result restoreSavedTheme(__ThemeEventStored value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setTheme(_ThemeEventSystem value),
    Result restoreSavedTheme(__ThemeEventStored value),
    @required Result orElse(),
  });
}

abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res>;
}

class _$ThemeEventCopyWithImpl<$Res> implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  final ThemeEvent _value;
  // ignore: unused_field
  final $Res Function(ThemeEvent) _then;
}

abstract class _$ThemeEventSystemCopyWith<$Res> {
  factory _$ThemeEventSystemCopyWith(
          _ThemeEventSystem value, $Res Function(_ThemeEventSystem) then) =
      __$ThemeEventSystemCopyWithImpl<$Res>;
  $Res call({ThemeMode mode});
}

class __$ThemeEventSystemCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res>
    implements _$ThemeEventSystemCopyWith<$Res> {
  __$ThemeEventSystemCopyWithImpl(
      _ThemeEventSystem _value, $Res Function(_ThemeEventSystem) _then)
      : super(_value, (v) => _then(v as _ThemeEventSystem));

  @override
  _ThemeEventSystem get _value => super._value as _ThemeEventSystem;

  @override
  $Res call({
    Object mode = freezed,
  }) {
    return _then(_ThemeEventSystem(
      mode == freezed ? _value.mode : mode as ThemeMode,
    ));
  }
}

class _$_ThemeEventSystem
    with DiagnosticableTreeMixin
    implements _ThemeEventSystem {
  const _$_ThemeEventSystem(this.mode) : assert(mode != null);

  @override
  final ThemeMode mode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeEvent.setTheme(mode: $mode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeEvent.setTheme'))
      ..add(DiagnosticsProperty('mode', mode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeEventSystem &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(mode);

  @override
  _$ThemeEventSystemCopyWith<_ThemeEventSystem> get copyWith =>
      __$ThemeEventSystemCopyWithImpl<_ThemeEventSystem>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setTheme(ThemeMode mode),
    @required Result restoreSavedTheme(),
  }) {
    assert(setTheme != null);
    assert(restoreSavedTheme != null);
    return setTheme(mode);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setTheme(ThemeMode mode),
    Result restoreSavedTheme(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setTheme != null) {
      return setTheme(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setTheme(_ThemeEventSystem value),
    @required Result restoreSavedTheme(__ThemeEventStored value),
  }) {
    assert(setTheme != null);
    assert(restoreSavedTheme != null);
    return setTheme(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setTheme(_ThemeEventSystem value),
    Result restoreSavedTheme(__ThemeEventStored value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setTheme != null) {
      return setTheme(this);
    }
    return orElse();
  }
}

abstract class _ThemeEventSystem implements ThemeEvent {
  const factory _ThemeEventSystem(ThemeMode mode) = _$_ThemeEventSystem;

  ThemeMode get mode;
  _$ThemeEventSystemCopyWith<_ThemeEventSystem> get copyWith;
}

abstract class _$_ThemeEventStoredCopyWith<$Res> {
  factory _$_ThemeEventStoredCopyWith(
          __ThemeEventStored value, $Res Function(__ThemeEventStored) then) =
      __$_ThemeEventStoredCopyWithImpl<$Res>;
}

class __$_ThemeEventStoredCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res>
    implements _$_ThemeEventStoredCopyWith<$Res> {
  __$_ThemeEventStoredCopyWithImpl(
      __ThemeEventStored _value, $Res Function(__ThemeEventStored) _then)
      : super(_value, (v) => _then(v as __ThemeEventStored));

  @override
  __ThemeEventStored get _value => super._value as __ThemeEventStored;
}

class _$__ThemeEventStored
    with DiagnosticableTreeMixin
    implements __ThemeEventStored {
  const _$__ThemeEventStored();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeEvent.restoreSavedTheme()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeEvent.restoreSavedTheme'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is __ThemeEventStored);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result setTheme(ThemeMode mode),
    @required Result restoreSavedTheme(),
  }) {
    assert(setTheme != null);
    assert(restoreSavedTheme != null);
    return restoreSavedTheme();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result setTheme(ThemeMode mode),
    Result restoreSavedTheme(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (restoreSavedTheme != null) {
      return restoreSavedTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result setTheme(_ThemeEventSystem value),
    @required Result restoreSavedTheme(__ThemeEventStored value),
  }) {
    assert(setTheme != null);
    assert(restoreSavedTheme != null);
    return restoreSavedTheme(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result setTheme(_ThemeEventSystem value),
    Result restoreSavedTheme(__ThemeEventStored value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (restoreSavedTheme != null) {
      return restoreSavedTheme(this);
    }
    return orElse();
  }
}

abstract class __ThemeEventStored implements ThemeEvent {
  const factory __ThemeEventStored() = _$__ThemeEventStored;
}

class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  _ThemeStateInitial initial() {
    return const _ThemeStateInitial();
  }

  ThemeStateLoaded loaded(ThemeMode mode) {
    return ThemeStateLoaded(
      mode,
    );
  }
}

// ignore: unused_element
const $ThemeState = _$ThemeStateTearOff();

mixin _$ThemeState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(ThemeMode mode),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(ThemeMode mode),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ThemeStateInitial value),
    @required Result loaded(ThemeStateLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ThemeStateInitial value),
    Result loaded(ThemeStateLoaded value),
    @required Result orElse(),
  });
}

abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
}

class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;
}

abstract class _$ThemeStateInitialCopyWith<$Res> {
  factory _$ThemeStateInitialCopyWith(
          _ThemeStateInitial value, $Res Function(_ThemeStateInitial) then) =
      __$ThemeStateInitialCopyWithImpl<$Res>;
}

class __$ThemeStateInitialCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res>
    implements _$ThemeStateInitialCopyWith<$Res> {
  __$ThemeStateInitialCopyWithImpl(
      _ThemeStateInitial _value, $Res Function(_ThemeStateInitial) _then)
      : super(_value, (v) => _then(v as _ThemeStateInitial));

  @override
  _ThemeStateInitial get _value => super._value as _ThemeStateInitial;
}

class _$_ThemeStateInitial
    with DiagnosticableTreeMixin
    implements _ThemeStateInitial {
  const _$_ThemeStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ThemeState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ThemeStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(ThemeMode mode),
  }) {
    assert(initial != null);
    assert(loaded != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(ThemeMode mode),
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
    @required Result initial(_ThemeStateInitial value),
    @required Result loaded(ThemeStateLoaded value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ThemeStateInitial value),
    Result loaded(ThemeStateLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ThemeStateInitial implements ThemeState {
  const factory _ThemeStateInitial() = _$_ThemeStateInitial;
}

abstract class $ThemeStateLoadedCopyWith<$Res> {
  factory $ThemeStateLoadedCopyWith(
          ThemeStateLoaded value, $Res Function(ThemeStateLoaded) then) =
      _$ThemeStateLoadedCopyWithImpl<$Res>;
  $Res call({ThemeMode mode});
}

class _$ThemeStateLoadedCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res>
    implements $ThemeStateLoadedCopyWith<$Res> {
  _$ThemeStateLoadedCopyWithImpl(
      ThemeStateLoaded _value, $Res Function(ThemeStateLoaded) _then)
      : super(_value, (v) => _then(v as ThemeStateLoaded));

  @override
  ThemeStateLoaded get _value => super._value as ThemeStateLoaded;

  @override
  $Res call({
    Object mode = freezed,
  }) {
    return _then(ThemeStateLoaded(
      mode == freezed ? _value.mode : mode as ThemeMode,
    ));
  }
}

class _$ThemeStateLoaded
    with DiagnosticableTreeMixin
    implements ThemeStateLoaded {
  const _$ThemeStateLoaded(this.mode) : assert(mode != null);

  @override
  final ThemeMode mode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeState.loaded(mode: $mode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeState.loaded'))
      ..add(DiagnosticsProperty('mode', mode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ThemeStateLoaded &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(mode);

  @override
  $ThemeStateLoadedCopyWith<ThemeStateLoaded> get copyWith =>
      _$ThemeStateLoadedCopyWithImpl<ThemeStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loaded(ThemeMode mode),
  }) {
    assert(initial != null);
    assert(loaded != null);
    return loaded(mode);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loaded(ThemeMode mode),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_ThemeStateInitial value),
    @required Result loaded(ThemeStateLoaded value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_ThemeStateInitial value),
    Result loaded(ThemeStateLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ThemeStateLoaded implements ThemeState {
  const factory ThemeStateLoaded(ThemeMode mode) = _$ThemeStateLoaded;

  ThemeMode get mode;
  $ThemeStateLoadedCopyWith<ThemeStateLoaded> get copyWith;
}
