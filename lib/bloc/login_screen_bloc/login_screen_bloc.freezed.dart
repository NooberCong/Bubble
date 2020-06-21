// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'login_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginScreenEventTearOff {
  const _$LoginScreenEventTearOff();

  _LoginScreenEventEmailAndPassword loginWithEmailAndPassword(
      String email, String password) {
    return _LoginScreenEventEmailAndPassword(
      email,
      password,
    );
  }

  _LoginScreenEventGoogle loginWithGoogle() {
    return const _LoginScreenEventGoogle();
  }
}

// ignore: unused_element
const $LoginScreenEvent = _$LoginScreenEventTearOff();

mixin _$LoginScreenEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginWithEmailAndPassword(String email, String password),
    @required Result loginWithGoogle(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginWithEmailAndPassword(String email, String password),
    Result loginWithGoogle(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result loginWithEmailAndPassword(
            _LoginScreenEventEmailAndPassword value),
    @required Result loginWithGoogle(_LoginScreenEventGoogle value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginWithEmailAndPassword(_LoginScreenEventEmailAndPassword value),
    Result loginWithGoogle(_LoginScreenEventGoogle value),
    @required Result orElse(),
  });
}

abstract class $LoginScreenEventCopyWith<$Res> {
  factory $LoginScreenEventCopyWith(
          LoginScreenEvent value, $Res Function(LoginScreenEvent) then) =
      _$LoginScreenEventCopyWithImpl<$Res>;
}

class _$LoginScreenEventCopyWithImpl<$Res>
    implements $LoginScreenEventCopyWith<$Res> {
  _$LoginScreenEventCopyWithImpl(this._value, this._then);

  final LoginScreenEvent _value;
  // ignore: unused_field
  final $Res Function(LoginScreenEvent) _then;
}

abstract class _$LoginScreenEventEmailAndPasswordCopyWith<$Res> {
  factory _$LoginScreenEventEmailAndPasswordCopyWith(
          _LoginScreenEventEmailAndPassword value,
          $Res Function(_LoginScreenEventEmailAndPassword) then) =
      __$LoginScreenEventEmailAndPasswordCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

class __$LoginScreenEventEmailAndPasswordCopyWithImpl<$Res>
    extends _$LoginScreenEventCopyWithImpl<$Res>
    implements _$LoginScreenEventEmailAndPasswordCopyWith<$Res> {
  __$LoginScreenEventEmailAndPasswordCopyWithImpl(
      _LoginScreenEventEmailAndPassword _value,
      $Res Function(_LoginScreenEventEmailAndPassword) _then)
      : super(_value, (v) => _then(v as _LoginScreenEventEmailAndPassword));

  @override
  _LoginScreenEventEmailAndPassword get _value =>
      super._value as _LoginScreenEventEmailAndPassword;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_LoginScreenEventEmailAndPassword(
      email == freezed ? _value.email : email as String,
      password == freezed ? _value.password : password as String,
    ));
  }
}

class _$_LoginScreenEventEmailAndPassword
    implements _LoginScreenEventEmailAndPassword {
  const _$_LoginScreenEventEmailAndPassword(this.email, this.password)
      : assert(email != null),
        assert(password != null);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginScreenEvent.loginWithEmailAndPassword(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginScreenEventEmailAndPassword &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$LoginScreenEventEmailAndPasswordCopyWith<_LoginScreenEventEmailAndPassword>
      get copyWith => __$LoginScreenEventEmailAndPasswordCopyWithImpl<
          _LoginScreenEventEmailAndPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginWithEmailAndPassword(String email, String password),
    @required Result loginWithGoogle(),
  }) {
    assert(loginWithEmailAndPassword != null);
    assert(loginWithGoogle != null);
    return loginWithEmailAndPassword(email, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginWithEmailAndPassword(String email, String password),
    Result loginWithGoogle(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithEmailAndPassword != null) {
      return loginWithEmailAndPassword(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result loginWithEmailAndPassword(
            _LoginScreenEventEmailAndPassword value),
    @required Result loginWithGoogle(_LoginScreenEventGoogle value),
  }) {
    assert(loginWithEmailAndPassword != null);
    assert(loginWithGoogle != null);
    return loginWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginWithEmailAndPassword(_LoginScreenEventEmailAndPassword value),
    Result loginWithGoogle(_LoginScreenEventGoogle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithEmailAndPassword != null) {
      return loginWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class _LoginScreenEventEmailAndPassword implements LoginScreenEvent {
  const factory _LoginScreenEventEmailAndPassword(
      String email, String password) = _$_LoginScreenEventEmailAndPassword;

  String get email;
  String get password;
  _$LoginScreenEventEmailAndPasswordCopyWith<_LoginScreenEventEmailAndPassword>
      get copyWith;
}

abstract class _$LoginScreenEventGoogleCopyWith<$Res> {
  factory _$LoginScreenEventGoogleCopyWith(_LoginScreenEventGoogle value,
          $Res Function(_LoginScreenEventGoogle) then) =
      __$LoginScreenEventGoogleCopyWithImpl<$Res>;
}

class __$LoginScreenEventGoogleCopyWithImpl<$Res>
    extends _$LoginScreenEventCopyWithImpl<$Res>
    implements _$LoginScreenEventGoogleCopyWith<$Res> {
  __$LoginScreenEventGoogleCopyWithImpl(_LoginScreenEventGoogle _value,
      $Res Function(_LoginScreenEventGoogle) _then)
      : super(_value, (v) => _then(v as _LoginScreenEventGoogle));

  @override
  _LoginScreenEventGoogle get _value => super._value as _LoginScreenEventGoogle;
}

class _$_LoginScreenEventGoogle implements _LoginScreenEventGoogle {
  const _$_LoginScreenEventGoogle();

  @override
  String toString() {
    return 'LoginScreenEvent.loginWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoginScreenEventGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loginWithEmailAndPassword(String email, String password),
    @required Result loginWithGoogle(),
  }) {
    assert(loginWithEmailAndPassword != null);
    assert(loginWithGoogle != null);
    return loginWithGoogle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loginWithEmailAndPassword(String email, String password),
    Result loginWithGoogle(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithGoogle != null) {
      return loginWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required
        Result loginWithEmailAndPassword(
            _LoginScreenEventEmailAndPassword value),
    @required Result loginWithGoogle(_LoginScreenEventGoogle value),
  }) {
    assert(loginWithEmailAndPassword != null);
    assert(loginWithGoogle != null);
    return loginWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loginWithEmailAndPassword(_LoginScreenEventEmailAndPassword value),
    Result loginWithGoogle(_LoginScreenEventGoogle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginWithGoogle != null) {
      return loginWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _LoginScreenEventGoogle implements LoginScreenEvent {
  const factory _LoginScreenEventGoogle() = _$_LoginScreenEventGoogle;
}

class _$LoginScreenStateTearOff {
  const _$LoginScreenStateTearOff();

  _LoginScreenStateInitial initial() {
    return const _LoginScreenStateInitial();
  }

  _LoginScreenStateError error(String message) {
    return _LoginScreenStateError(
      message,
    );
  }

  _LoginScreenStateSuccess success(User user) {
    return _LoginScreenStateSuccess(
      user,
    );
  }

  _LoginScreenStateLoading loading() {
    return const _LoginScreenStateLoading();
  }
}

// ignore: unused_element
const $LoginScreenState = _$LoginScreenStateTearOff();

mixin _$LoginScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result error(String message),
    @required Result success(User user),
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result error(String message),
    Result success(User user),
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_LoginScreenStateInitial value),
    @required Result error(_LoginScreenStateError value),
    @required Result success(_LoginScreenStateSuccess value),
    @required Result loading(_LoginScreenStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_LoginScreenStateInitial value),
    Result error(_LoginScreenStateError value),
    Result success(_LoginScreenStateSuccess value),
    Result loading(_LoginScreenStateLoading value),
    @required Result orElse(),
  });
}

abstract class $LoginScreenStateCopyWith<$Res> {
  factory $LoginScreenStateCopyWith(
          LoginScreenState value, $Res Function(LoginScreenState) then) =
      _$LoginScreenStateCopyWithImpl<$Res>;
}

class _$LoginScreenStateCopyWithImpl<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  _$LoginScreenStateCopyWithImpl(this._value, this._then);

  final LoginScreenState _value;
  // ignore: unused_field
  final $Res Function(LoginScreenState) _then;
}

abstract class _$LoginScreenStateInitialCopyWith<$Res> {
  factory _$LoginScreenStateInitialCopyWith(_LoginScreenStateInitial value,
          $Res Function(_LoginScreenStateInitial) then) =
      __$LoginScreenStateInitialCopyWithImpl<$Res>;
}

class __$LoginScreenStateInitialCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res>
    implements _$LoginScreenStateInitialCopyWith<$Res> {
  __$LoginScreenStateInitialCopyWithImpl(_LoginScreenStateInitial _value,
      $Res Function(_LoginScreenStateInitial) _then)
      : super(_value, (v) => _then(v as _LoginScreenStateInitial));

  @override
  _LoginScreenStateInitial get _value =>
      super._value as _LoginScreenStateInitial;
}

class _$_LoginScreenStateInitial implements _LoginScreenStateInitial {
  const _$_LoginScreenStateInitial();

  @override
  String toString() {
    return 'LoginScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoginScreenStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result error(String message),
    @required Result success(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(error != null);
    assert(success != null);
    assert(loading != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result error(String message),
    Result success(User user),
    Result loading(),
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
    @required Result initial(_LoginScreenStateInitial value),
    @required Result error(_LoginScreenStateError value),
    @required Result success(_LoginScreenStateSuccess value),
    @required Result loading(_LoginScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(error != null);
    assert(success != null);
    assert(loading != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_LoginScreenStateInitial value),
    Result error(_LoginScreenStateError value),
    Result success(_LoginScreenStateSuccess value),
    Result loading(_LoginScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _LoginScreenStateInitial implements LoginScreenState {
  const factory _LoginScreenStateInitial() = _$_LoginScreenStateInitial;
}

abstract class _$LoginScreenStateErrorCopyWith<$Res> {
  factory _$LoginScreenStateErrorCopyWith(_LoginScreenStateError value,
          $Res Function(_LoginScreenStateError) then) =
      __$LoginScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$LoginScreenStateErrorCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res>
    implements _$LoginScreenStateErrorCopyWith<$Res> {
  __$LoginScreenStateErrorCopyWithImpl(_LoginScreenStateError _value,
      $Res Function(_LoginScreenStateError) _then)
      : super(_value, (v) => _then(v as _LoginScreenStateError));

  @override
  _LoginScreenStateError get _value => super._value as _LoginScreenStateError;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_LoginScreenStateError(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_LoginScreenStateError implements _LoginScreenStateError {
  const _$_LoginScreenStateError(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'LoginScreenState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginScreenStateError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$LoginScreenStateErrorCopyWith<_LoginScreenStateError> get copyWith =>
      __$LoginScreenStateErrorCopyWithImpl<_LoginScreenStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result error(String message),
    @required Result success(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(error != null);
    assert(success != null);
    assert(loading != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result error(String message),
    Result success(User user),
    Result loading(),
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
    @required Result initial(_LoginScreenStateInitial value),
    @required Result error(_LoginScreenStateError value),
    @required Result success(_LoginScreenStateSuccess value),
    @required Result loading(_LoginScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(error != null);
    assert(success != null);
    assert(loading != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_LoginScreenStateInitial value),
    Result error(_LoginScreenStateError value),
    Result success(_LoginScreenStateSuccess value),
    Result loading(_LoginScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _LoginScreenStateError implements LoginScreenState {
  const factory _LoginScreenStateError(String message) =
      _$_LoginScreenStateError;

  String get message;
  _$LoginScreenStateErrorCopyWith<_LoginScreenStateError> get copyWith;
}

abstract class _$LoginScreenStateSuccessCopyWith<$Res> {
  factory _$LoginScreenStateSuccessCopyWith(_LoginScreenStateSuccess value,
          $Res Function(_LoginScreenStateSuccess) then) =
      __$LoginScreenStateSuccessCopyWithImpl<$Res>;
  $Res call({User user});
}

class __$LoginScreenStateSuccessCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res>
    implements _$LoginScreenStateSuccessCopyWith<$Res> {
  __$LoginScreenStateSuccessCopyWithImpl(_LoginScreenStateSuccess _value,
      $Res Function(_LoginScreenStateSuccess) _then)
      : super(_value, (v) => _then(v as _LoginScreenStateSuccess));

  @override
  _LoginScreenStateSuccess get _value =>
      super._value as _LoginScreenStateSuccess;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(_LoginScreenStateSuccess(
      user == freezed ? _value.user : user as User,
    ));
  }
}

class _$_LoginScreenStateSuccess implements _LoginScreenStateSuccess {
  const _$_LoginScreenStateSuccess(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString() {
    return 'LoginScreenState.success(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginScreenStateSuccess &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  _$LoginScreenStateSuccessCopyWith<_LoginScreenStateSuccess> get copyWith =>
      __$LoginScreenStateSuccessCopyWithImpl<_LoginScreenStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result error(String message),
    @required Result success(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(error != null);
    assert(success != null);
    assert(loading != null);
    return success(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result error(String message),
    Result success(User user),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_LoginScreenStateInitial value),
    @required Result error(_LoginScreenStateError value),
    @required Result success(_LoginScreenStateSuccess value),
    @required Result loading(_LoginScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(error != null);
    assert(success != null);
    assert(loading != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_LoginScreenStateInitial value),
    Result error(_LoginScreenStateError value),
    Result success(_LoginScreenStateSuccess value),
    Result loading(_LoginScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _LoginScreenStateSuccess implements LoginScreenState {
  const factory _LoginScreenStateSuccess(User user) =
      _$_LoginScreenStateSuccess;

  User get user;
  _$LoginScreenStateSuccessCopyWith<_LoginScreenStateSuccess> get copyWith;
}

abstract class _$LoginScreenStateLoadingCopyWith<$Res> {
  factory _$LoginScreenStateLoadingCopyWith(_LoginScreenStateLoading value,
          $Res Function(_LoginScreenStateLoading) then) =
      __$LoginScreenStateLoadingCopyWithImpl<$Res>;
}

class __$LoginScreenStateLoadingCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res>
    implements _$LoginScreenStateLoadingCopyWith<$Res> {
  __$LoginScreenStateLoadingCopyWithImpl(_LoginScreenStateLoading _value,
      $Res Function(_LoginScreenStateLoading) _then)
      : super(_value, (v) => _then(v as _LoginScreenStateLoading));

  @override
  _LoginScreenStateLoading get _value =>
      super._value as _LoginScreenStateLoading;
}

class _$_LoginScreenStateLoading implements _LoginScreenStateLoading {
  const _$_LoginScreenStateLoading();

  @override
  String toString() {
    return 'LoginScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoginScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result error(String message),
    @required Result success(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(error != null);
    assert(success != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result error(String message),
    Result success(User user),
    Result loading(),
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
    @required Result initial(_LoginScreenStateInitial value),
    @required Result error(_LoginScreenStateError value),
    @required Result success(_LoginScreenStateSuccess value),
    @required Result loading(_LoginScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(error != null);
    assert(success != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_LoginScreenStateInitial value),
    Result error(_LoginScreenStateError value),
    Result success(_LoginScreenStateSuccess value),
    Result loading(_LoginScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoginScreenStateLoading implements LoginScreenState {
  const factory _LoginScreenStateLoading() = _$_LoginScreenStateLoading;
}
