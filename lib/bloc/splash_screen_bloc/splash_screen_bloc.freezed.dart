// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'splash_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SplashScreenEventTearOff {
  const _$SplashScreenEventTearOff();

  _SplashScreenEventAuthCheck requestAuthCheck() {
    return const _SplashScreenEventAuthCheck();
  }

  _SplashScreenEventSignOut signOut(String uid) {
    return _SplashScreenEventSignOut(
      uid,
    );
  }

  _SplashScreenEventAuthenticate authenticate(User user) {
    return _SplashScreenEventAuthenticate(
      user,
    );
  }
}

// ignore: unused_element
const $SplashScreenEvent = _$SplashScreenEventTearOff();

mixin _$SplashScreenEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestAuthCheck(),
    @required Result signOut(String uid),
    @required Result authenticate(User user),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestAuthCheck(),
    Result signOut(String uid),
    Result authenticate(User user),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestAuthCheck(_SplashScreenEventAuthCheck value),
    @required Result signOut(_SplashScreenEventSignOut value),
    @required Result authenticate(_SplashScreenEventAuthenticate value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestAuthCheck(_SplashScreenEventAuthCheck value),
    Result signOut(_SplashScreenEventSignOut value),
    Result authenticate(_SplashScreenEventAuthenticate value),
    @required Result orElse(),
  });
}

abstract class $SplashScreenEventCopyWith<$Res> {
  factory $SplashScreenEventCopyWith(
          SplashScreenEvent value, $Res Function(SplashScreenEvent) then) =
      _$SplashScreenEventCopyWithImpl<$Res>;
}

class _$SplashScreenEventCopyWithImpl<$Res>
    implements $SplashScreenEventCopyWith<$Res> {
  _$SplashScreenEventCopyWithImpl(this._value, this._then);

  final SplashScreenEvent _value;
  // ignore: unused_field
  final $Res Function(SplashScreenEvent) _then;
}

abstract class _$SplashScreenEventAuthCheckCopyWith<$Res> {
  factory _$SplashScreenEventAuthCheckCopyWith(
          _SplashScreenEventAuthCheck value,
          $Res Function(_SplashScreenEventAuthCheck) then) =
      __$SplashScreenEventAuthCheckCopyWithImpl<$Res>;
}

class __$SplashScreenEventAuthCheckCopyWithImpl<$Res>
    extends _$SplashScreenEventCopyWithImpl<$Res>
    implements _$SplashScreenEventAuthCheckCopyWith<$Res> {
  __$SplashScreenEventAuthCheckCopyWithImpl(_SplashScreenEventAuthCheck _value,
      $Res Function(_SplashScreenEventAuthCheck) _then)
      : super(_value, (v) => _then(v as _SplashScreenEventAuthCheck));

  @override
  _SplashScreenEventAuthCheck get _value =>
      super._value as _SplashScreenEventAuthCheck;
}

class _$_SplashScreenEventAuthCheck
    with DiagnosticableTreeMixin
    implements _SplashScreenEventAuthCheck {
  const _$_SplashScreenEventAuthCheck();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashScreenEvent.requestAuthCheck()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SplashScreenEvent.requestAuthCheck'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SplashScreenEventAuthCheck);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestAuthCheck(),
    @required Result signOut(String uid),
    @required Result authenticate(User user),
  }) {
    assert(requestAuthCheck != null);
    assert(signOut != null);
    assert(authenticate != null);
    return requestAuthCheck();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestAuthCheck(),
    Result signOut(String uid),
    Result authenticate(User user),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestAuthCheck != null) {
      return requestAuthCheck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestAuthCheck(_SplashScreenEventAuthCheck value),
    @required Result signOut(_SplashScreenEventSignOut value),
    @required Result authenticate(_SplashScreenEventAuthenticate value),
  }) {
    assert(requestAuthCheck != null);
    assert(signOut != null);
    assert(authenticate != null);
    return requestAuthCheck(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestAuthCheck(_SplashScreenEventAuthCheck value),
    Result signOut(_SplashScreenEventSignOut value),
    Result authenticate(_SplashScreenEventAuthenticate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestAuthCheck != null) {
      return requestAuthCheck(this);
    }
    return orElse();
  }
}

abstract class _SplashScreenEventAuthCheck implements SplashScreenEvent {
  const factory _SplashScreenEventAuthCheck() = _$_SplashScreenEventAuthCheck;
}

abstract class _$SplashScreenEventSignOutCopyWith<$Res> {
  factory _$SplashScreenEventSignOutCopyWith(_SplashScreenEventSignOut value,
          $Res Function(_SplashScreenEventSignOut) then) =
      __$SplashScreenEventSignOutCopyWithImpl<$Res>;
  $Res call({String uid});
}

class __$SplashScreenEventSignOutCopyWithImpl<$Res>
    extends _$SplashScreenEventCopyWithImpl<$Res>
    implements _$SplashScreenEventSignOutCopyWith<$Res> {
  __$SplashScreenEventSignOutCopyWithImpl(_SplashScreenEventSignOut _value,
      $Res Function(_SplashScreenEventSignOut) _then)
      : super(_value, (v) => _then(v as _SplashScreenEventSignOut));

  @override
  _SplashScreenEventSignOut get _value =>
      super._value as _SplashScreenEventSignOut;

  @override
  $Res call({
    Object uid = freezed,
  }) {
    return _then(_SplashScreenEventSignOut(
      uid == freezed ? _value.uid : uid as String,
    ));
  }
}

class _$_SplashScreenEventSignOut
    with DiagnosticableTreeMixin
    implements _SplashScreenEventSignOut {
  const _$_SplashScreenEventSignOut(this.uid) : assert(uid != null);

  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashScreenEvent.signOut(uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SplashScreenEvent.signOut'))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SplashScreenEventSignOut &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(uid);

  @override
  _$SplashScreenEventSignOutCopyWith<_SplashScreenEventSignOut> get copyWith =>
      __$SplashScreenEventSignOutCopyWithImpl<_SplashScreenEventSignOut>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestAuthCheck(),
    @required Result signOut(String uid),
    @required Result authenticate(User user),
  }) {
    assert(requestAuthCheck != null);
    assert(signOut != null);
    assert(authenticate != null);
    return signOut(uid);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestAuthCheck(),
    Result signOut(String uid),
    Result authenticate(User user),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signOut != null) {
      return signOut(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestAuthCheck(_SplashScreenEventAuthCheck value),
    @required Result signOut(_SplashScreenEventSignOut value),
    @required Result authenticate(_SplashScreenEventAuthenticate value),
  }) {
    assert(requestAuthCheck != null);
    assert(signOut != null);
    assert(authenticate != null);
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestAuthCheck(_SplashScreenEventAuthCheck value),
    Result signOut(_SplashScreenEventSignOut value),
    Result authenticate(_SplashScreenEventAuthenticate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SplashScreenEventSignOut implements SplashScreenEvent {
  const factory _SplashScreenEventSignOut(String uid) =
      _$_SplashScreenEventSignOut;

  String get uid;
  _$SplashScreenEventSignOutCopyWith<_SplashScreenEventSignOut> get copyWith;
}

abstract class _$SplashScreenEventAuthenticateCopyWith<$Res> {
  factory _$SplashScreenEventAuthenticateCopyWith(
          _SplashScreenEventAuthenticate value,
          $Res Function(_SplashScreenEventAuthenticate) then) =
      __$SplashScreenEventAuthenticateCopyWithImpl<$Res>;
  $Res call({User user});
}

class __$SplashScreenEventAuthenticateCopyWithImpl<$Res>
    extends _$SplashScreenEventCopyWithImpl<$Res>
    implements _$SplashScreenEventAuthenticateCopyWith<$Res> {
  __$SplashScreenEventAuthenticateCopyWithImpl(
      _SplashScreenEventAuthenticate _value,
      $Res Function(_SplashScreenEventAuthenticate) _then)
      : super(_value, (v) => _then(v as _SplashScreenEventAuthenticate));

  @override
  _SplashScreenEventAuthenticate get _value =>
      super._value as _SplashScreenEventAuthenticate;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(_SplashScreenEventAuthenticate(
      user == freezed ? _value.user : user as User,
    ));
  }
}

class _$_SplashScreenEventAuthenticate
    with DiagnosticableTreeMixin
    implements _SplashScreenEventAuthenticate {
  const _$_SplashScreenEventAuthenticate(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashScreenEvent.authenticate(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SplashScreenEvent.authenticate'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SplashScreenEventAuthenticate &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  _$SplashScreenEventAuthenticateCopyWith<_SplashScreenEventAuthenticate>
      get copyWith => __$SplashScreenEventAuthenticateCopyWithImpl<
          _SplashScreenEventAuthenticate>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestAuthCheck(),
    @required Result signOut(String uid),
    @required Result authenticate(User user),
  }) {
    assert(requestAuthCheck != null);
    assert(signOut != null);
    assert(authenticate != null);
    return authenticate(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestAuthCheck(),
    Result signOut(String uid),
    Result authenticate(User user),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticate != null) {
      return authenticate(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestAuthCheck(_SplashScreenEventAuthCheck value),
    @required Result signOut(_SplashScreenEventSignOut value),
    @required Result authenticate(_SplashScreenEventAuthenticate value),
  }) {
    assert(requestAuthCheck != null);
    assert(signOut != null);
    assert(authenticate != null);
    return authenticate(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestAuthCheck(_SplashScreenEventAuthCheck value),
    Result signOut(_SplashScreenEventSignOut value),
    Result authenticate(_SplashScreenEventAuthenticate value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticate != null) {
      return authenticate(this);
    }
    return orElse();
  }
}

abstract class _SplashScreenEventAuthenticate implements SplashScreenEvent {
  const factory _SplashScreenEventAuthenticate(User user) =
      _$_SplashScreenEventAuthenticate;

  User get user;
  _$SplashScreenEventAuthenticateCopyWith<_SplashScreenEventAuthenticate>
      get copyWith;
}

class _$SplashScreenStateTearOff {
  const _$SplashScreenStateTearOff();

  _SplashScreenStateInitial initial() {
    return const _SplashScreenStateInitial();
  }

  SplashScreenStateAuthenticated authenticated(User user) {
    return SplashScreenStateAuthenticated(
      user,
    );
  }

  _SplashScreenStateUnauthenticated unauthenticated() {
    return const _SplashScreenStateUnauthenticated();
  }
}

// ignore: unused_element
const $SplashScreenState = _$SplashScreenStateTearOff();

mixin _$SplashScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(User user),
    @required Result unauthenticated(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(User user),
    Result unauthenticated(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SplashScreenStateInitial value),
    @required Result authenticated(SplashScreenStateAuthenticated value),
    @required Result unauthenticated(_SplashScreenStateUnauthenticated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SplashScreenStateInitial value),
    Result authenticated(SplashScreenStateAuthenticated value),
    Result unauthenticated(_SplashScreenStateUnauthenticated value),
    @required Result orElse(),
  });
}

abstract class $SplashScreenStateCopyWith<$Res> {
  factory $SplashScreenStateCopyWith(
          SplashScreenState value, $Res Function(SplashScreenState) then) =
      _$SplashScreenStateCopyWithImpl<$Res>;
}

class _$SplashScreenStateCopyWithImpl<$Res>
    implements $SplashScreenStateCopyWith<$Res> {
  _$SplashScreenStateCopyWithImpl(this._value, this._then);

  final SplashScreenState _value;
  // ignore: unused_field
  final $Res Function(SplashScreenState) _then;
}

abstract class _$SplashScreenStateInitialCopyWith<$Res> {
  factory _$SplashScreenStateInitialCopyWith(_SplashScreenStateInitial value,
          $Res Function(_SplashScreenStateInitial) then) =
      __$SplashScreenStateInitialCopyWithImpl<$Res>;
}

class __$SplashScreenStateInitialCopyWithImpl<$Res>
    extends _$SplashScreenStateCopyWithImpl<$Res>
    implements _$SplashScreenStateInitialCopyWith<$Res> {
  __$SplashScreenStateInitialCopyWithImpl(_SplashScreenStateInitial _value,
      $Res Function(_SplashScreenStateInitial) _then)
      : super(_value, (v) => _then(v as _SplashScreenStateInitial));

  @override
  _SplashScreenStateInitial get _value =>
      super._value as _SplashScreenStateInitial;
}

class _$_SplashScreenStateInitial
    with DiagnosticableTreeMixin
    implements _SplashScreenStateInitial {
  const _$_SplashScreenStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashScreenState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SplashScreenState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SplashScreenStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(User user),
    @required Result unauthenticated(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(User user),
    Result unauthenticated(),
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
    @required Result initial(_SplashScreenStateInitial value),
    @required Result authenticated(SplashScreenStateAuthenticated value),
    @required Result unauthenticated(_SplashScreenStateUnauthenticated value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SplashScreenStateInitial value),
    Result authenticated(SplashScreenStateAuthenticated value),
    Result unauthenticated(_SplashScreenStateUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SplashScreenStateInitial implements SplashScreenState {
  const factory _SplashScreenStateInitial() = _$_SplashScreenStateInitial;
}

abstract class $SplashScreenStateAuthenticatedCopyWith<$Res> {
  factory $SplashScreenStateAuthenticatedCopyWith(
          SplashScreenStateAuthenticated value,
          $Res Function(SplashScreenStateAuthenticated) then) =
      _$SplashScreenStateAuthenticatedCopyWithImpl<$Res>;
  $Res call({User user});
}

class _$SplashScreenStateAuthenticatedCopyWithImpl<$Res>
    extends _$SplashScreenStateCopyWithImpl<$Res>
    implements $SplashScreenStateAuthenticatedCopyWith<$Res> {
  _$SplashScreenStateAuthenticatedCopyWithImpl(
      SplashScreenStateAuthenticated _value,
      $Res Function(SplashScreenStateAuthenticated) _then)
      : super(_value, (v) => _then(v as SplashScreenStateAuthenticated));

  @override
  SplashScreenStateAuthenticated get _value =>
      super._value as SplashScreenStateAuthenticated;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(SplashScreenStateAuthenticated(
      user == freezed ? _value.user : user as User,
    ));
  }
}

class _$SplashScreenStateAuthenticated
    with DiagnosticableTreeMixin
    implements SplashScreenStateAuthenticated {
  const _$SplashScreenStateAuthenticated(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashScreenState.authenticated(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SplashScreenState.authenticated'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SplashScreenStateAuthenticated &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  $SplashScreenStateAuthenticatedCopyWith<SplashScreenStateAuthenticated>
      get copyWith => _$SplashScreenStateAuthenticatedCopyWithImpl<
          SplashScreenStateAuthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(User user),
    @required Result unauthenticated(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(User user),
    Result unauthenticated(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SplashScreenStateInitial value),
    @required Result authenticated(SplashScreenStateAuthenticated value),
    @required Result unauthenticated(_SplashScreenStateUnauthenticated value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SplashScreenStateInitial value),
    Result authenticated(SplashScreenStateAuthenticated value),
    Result unauthenticated(_SplashScreenStateUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class SplashScreenStateAuthenticated implements SplashScreenState {
  const factory SplashScreenStateAuthenticated(User user) =
      _$SplashScreenStateAuthenticated;

  User get user;
  $SplashScreenStateAuthenticatedCopyWith<SplashScreenStateAuthenticated>
      get copyWith;
}

abstract class _$SplashScreenStateUnauthenticatedCopyWith<$Res> {
  factory _$SplashScreenStateUnauthenticatedCopyWith(
          _SplashScreenStateUnauthenticated value,
          $Res Function(_SplashScreenStateUnauthenticated) then) =
      __$SplashScreenStateUnauthenticatedCopyWithImpl<$Res>;
}

class __$SplashScreenStateUnauthenticatedCopyWithImpl<$Res>
    extends _$SplashScreenStateCopyWithImpl<$Res>
    implements _$SplashScreenStateUnauthenticatedCopyWith<$Res> {
  __$SplashScreenStateUnauthenticatedCopyWithImpl(
      _SplashScreenStateUnauthenticated _value,
      $Res Function(_SplashScreenStateUnauthenticated) _then)
      : super(_value, (v) => _then(v as _SplashScreenStateUnauthenticated));

  @override
  _SplashScreenStateUnauthenticated get _value =>
      super._value as _SplashScreenStateUnauthenticated;
}

class _$_SplashScreenStateUnauthenticated
    with DiagnosticableTreeMixin
    implements _SplashScreenStateUnauthenticated {
  const _$_SplashScreenStateUnauthenticated();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashScreenState.unauthenticated()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SplashScreenState.unauthenticated'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SplashScreenStateUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(User user),
    @required Result unauthenticated(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(User user),
    Result unauthenticated(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SplashScreenStateInitial value),
    @required Result authenticated(SplashScreenStateAuthenticated value),
    @required Result unauthenticated(_SplashScreenStateUnauthenticated value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SplashScreenStateInitial value),
    Result authenticated(SplashScreenStateAuthenticated value),
    Result unauthenticated(_SplashScreenStateUnauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _SplashScreenStateUnauthenticated implements SplashScreenState {
  const factory _SplashScreenStateUnauthenticated() =
      _$_SplashScreenStateUnauthenticated;
}
