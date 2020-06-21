// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'sign_up_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SignUpScreenEventTearOff {
  const _$SignUpScreenEventTearOff();

  _SignUpScreenEventRequestName requestNameScreen() {
    return const _SignUpScreenEventRequestName();
  }

  _SignUpScreenEventRequestBio requestBioScreen(String lastNameInput) {
    return _SignUpScreenEventRequestBio(
      lastNameInput,
    );
  }

  _SignUpScreenEventRequestEmail requestEmailScreen(String lastBioInput) {
    return _SignUpScreenEventRequestEmail(
      lastBioInput,
    );
  }

  _SignUpScreenEventRequestPassword requestPasswordScreen(
      String lastEmailInput) {
    return _SignUpScreenEventRequestPassword(
      lastEmailInput,
    );
  }

  _SignUpScreenEventRequestFinish requestFinishScreen(String lastPassword) {
    return _SignUpScreenEventRequestFinish(
      lastPassword,
    );
  }

  _SignUpScreenEventRequestLast requestLastState() {
    return const _SignUpScreenEventRequestLast();
  }
}

// ignore: unused_element
const $SignUpScreenEvent = _$SignUpScreenEventTearOff();

mixin _$SignUpScreenEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestNameScreen(),
    @required Result requestBioScreen(String lastNameInput),
    @required Result requestEmailScreen(String lastBioInput),
    @required Result requestPasswordScreen(String lastEmailInput),
    @required Result requestFinishScreen(String lastPassword),
    @required Result requestLastState(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestNameScreen(),
    Result requestBioScreen(String lastNameInput),
    Result requestEmailScreen(String lastBioInput),
    Result requestPasswordScreen(String lastEmailInput),
    Result requestFinishScreen(String lastPassword),
    Result requestLastState(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestNameScreen(_SignUpScreenEventRequestName value),
    @required Result requestBioScreen(_SignUpScreenEventRequestBio value),
    @required Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    @required
        Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    @required Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    @required Result requestLastState(_SignUpScreenEventRequestLast value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestNameScreen(_SignUpScreenEventRequestName value),
    Result requestBioScreen(_SignUpScreenEventRequestBio value),
    Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    Result requestLastState(_SignUpScreenEventRequestLast value),
    @required Result orElse(),
  });
}

abstract class $SignUpScreenEventCopyWith<$Res> {
  factory $SignUpScreenEventCopyWith(
          SignUpScreenEvent value, $Res Function(SignUpScreenEvent) then) =
      _$SignUpScreenEventCopyWithImpl<$Res>;
}

class _$SignUpScreenEventCopyWithImpl<$Res>
    implements $SignUpScreenEventCopyWith<$Res> {
  _$SignUpScreenEventCopyWithImpl(this._value, this._then);

  final SignUpScreenEvent _value;
  // ignore: unused_field
  final $Res Function(SignUpScreenEvent) _then;
}

abstract class _$SignUpScreenEventRequestNameCopyWith<$Res> {
  factory _$SignUpScreenEventRequestNameCopyWith(
          _SignUpScreenEventRequestName value,
          $Res Function(_SignUpScreenEventRequestName) then) =
      __$SignUpScreenEventRequestNameCopyWithImpl<$Res>;
}

class __$SignUpScreenEventRequestNameCopyWithImpl<$Res>
    extends _$SignUpScreenEventCopyWithImpl<$Res>
    implements _$SignUpScreenEventRequestNameCopyWith<$Res> {
  __$SignUpScreenEventRequestNameCopyWithImpl(
      _SignUpScreenEventRequestName _value,
      $Res Function(_SignUpScreenEventRequestName) _then)
      : super(_value, (v) => _then(v as _SignUpScreenEventRequestName));

  @override
  _SignUpScreenEventRequestName get _value =>
      super._value as _SignUpScreenEventRequestName;
}

class _$_SignUpScreenEventRequestName implements _SignUpScreenEventRequestName {
  const _$_SignUpScreenEventRequestName();

  @override
  String toString() {
    return 'SignUpScreenEvent.requestNameScreen()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignUpScreenEventRequestName);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestNameScreen(),
    @required Result requestBioScreen(String lastNameInput),
    @required Result requestEmailScreen(String lastBioInput),
    @required Result requestPasswordScreen(String lastEmailInput),
    @required Result requestFinishScreen(String lastPassword),
    @required Result requestLastState(),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestNameScreen();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestNameScreen(),
    Result requestBioScreen(String lastNameInput),
    Result requestEmailScreen(String lastBioInput),
    Result requestPasswordScreen(String lastEmailInput),
    Result requestFinishScreen(String lastPassword),
    Result requestLastState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestNameScreen != null) {
      return requestNameScreen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestNameScreen(_SignUpScreenEventRequestName value),
    @required Result requestBioScreen(_SignUpScreenEventRequestBio value),
    @required Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    @required
        Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    @required Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    @required Result requestLastState(_SignUpScreenEventRequestLast value),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestNameScreen(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestNameScreen(_SignUpScreenEventRequestName value),
    Result requestBioScreen(_SignUpScreenEventRequestBio value),
    Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    Result requestLastState(_SignUpScreenEventRequestLast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestNameScreen != null) {
      return requestNameScreen(this);
    }
    return orElse();
  }
}

abstract class _SignUpScreenEventRequestName implements SignUpScreenEvent {
  const factory _SignUpScreenEventRequestName() =
      _$_SignUpScreenEventRequestName;
}

abstract class _$SignUpScreenEventRequestBioCopyWith<$Res> {
  factory _$SignUpScreenEventRequestBioCopyWith(
          _SignUpScreenEventRequestBio value,
          $Res Function(_SignUpScreenEventRequestBio) then) =
      __$SignUpScreenEventRequestBioCopyWithImpl<$Res>;
  $Res call({String lastNameInput});
}

class __$SignUpScreenEventRequestBioCopyWithImpl<$Res>
    extends _$SignUpScreenEventCopyWithImpl<$Res>
    implements _$SignUpScreenEventRequestBioCopyWith<$Res> {
  __$SignUpScreenEventRequestBioCopyWithImpl(
      _SignUpScreenEventRequestBio _value,
      $Res Function(_SignUpScreenEventRequestBio) _then)
      : super(_value, (v) => _then(v as _SignUpScreenEventRequestBio));

  @override
  _SignUpScreenEventRequestBio get _value =>
      super._value as _SignUpScreenEventRequestBio;

  @override
  $Res call({
    Object lastNameInput = freezed,
  }) {
    return _then(_SignUpScreenEventRequestBio(
      lastNameInput == freezed ? _value.lastNameInput : lastNameInput as String,
    ));
  }
}

class _$_SignUpScreenEventRequestBio implements _SignUpScreenEventRequestBio {
  const _$_SignUpScreenEventRequestBio(this.lastNameInput)
      : assert(lastNameInput != null);

  @override
  final String lastNameInput;

  @override
  String toString() {
    return 'SignUpScreenEvent.requestBioScreen(lastNameInput: $lastNameInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpScreenEventRequestBio &&
            (identical(other.lastNameInput, lastNameInput) ||
                const DeepCollectionEquality()
                    .equals(other.lastNameInput, lastNameInput)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lastNameInput);

  @override
  _$SignUpScreenEventRequestBioCopyWith<_SignUpScreenEventRequestBio>
      get copyWith => __$SignUpScreenEventRequestBioCopyWithImpl<
          _SignUpScreenEventRequestBio>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestNameScreen(),
    @required Result requestBioScreen(String lastNameInput),
    @required Result requestEmailScreen(String lastBioInput),
    @required Result requestPasswordScreen(String lastEmailInput),
    @required Result requestFinishScreen(String lastPassword),
    @required Result requestLastState(),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestBioScreen(lastNameInput);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestNameScreen(),
    Result requestBioScreen(String lastNameInput),
    Result requestEmailScreen(String lastBioInput),
    Result requestPasswordScreen(String lastEmailInput),
    Result requestFinishScreen(String lastPassword),
    Result requestLastState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestBioScreen != null) {
      return requestBioScreen(lastNameInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestNameScreen(_SignUpScreenEventRequestName value),
    @required Result requestBioScreen(_SignUpScreenEventRequestBio value),
    @required Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    @required
        Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    @required Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    @required Result requestLastState(_SignUpScreenEventRequestLast value),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestBioScreen(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestNameScreen(_SignUpScreenEventRequestName value),
    Result requestBioScreen(_SignUpScreenEventRequestBio value),
    Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    Result requestLastState(_SignUpScreenEventRequestLast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestBioScreen != null) {
      return requestBioScreen(this);
    }
    return orElse();
  }
}

abstract class _SignUpScreenEventRequestBio implements SignUpScreenEvent {
  const factory _SignUpScreenEventRequestBio(String lastNameInput) =
      _$_SignUpScreenEventRequestBio;

  String get lastNameInput;
  _$SignUpScreenEventRequestBioCopyWith<_SignUpScreenEventRequestBio>
      get copyWith;
}

abstract class _$SignUpScreenEventRequestEmailCopyWith<$Res> {
  factory _$SignUpScreenEventRequestEmailCopyWith(
          _SignUpScreenEventRequestEmail value,
          $Res Function(_SignUpScreenEventRequestEmail) then) =
      __$SignUpScreenEventRequestEmailCopyWithImpl<$Res>;
  $Res call({String lastBioInput});
}

class __$SignUpScreenEventRequestEmailCopyWithImpl<$Res>
    extends _$SignUpScreenEventCopyWithImpl<$Res>
    implements _$SignUpScreenEventRequestEmailCopyWith<$Res> {
  __$SignUpScreenEventRequestEmailCopyWithImpl(
      _SignUpScreenEventRequestEmail _value,
      $Res Function(_SignUpScreenEventRequestEmail) _then)
      : super(_value, (v) => _then(v as _SignUpScreenEventRequestEmail));

  @override
  _SignUpScreenEventRequestEmail get _value =>
      super._value as _SignUpScreenEventRequestEmail;

  @override
  $Res call({
    Object lastBioInput = freezed,
  }) {
    return _then(_SignUpScreenEventRequestEmail(
      lastBioInput == freezed ? _value.lastBioInput : lastBioInput as String,
    ));
  }
}

class _$_SignUpScreenEventRequestEmail
    implements _SignUpScreenEventRequestEmail {
  const _$_SignUpScreenEventRequestEmail(this.lastBioInput)
      : assert(lastBioInput != null);

  @override
  final String lastBioInput;

  @override
  String toString() {
    return 'SignUpScreenEvent.requestEmailScreen(lastBioInput: $lastBioInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpScreenEventRequestEmail &&
            (identical(other.lastBioInput, lastBioInput) ||
                const DeepCollectionEquality()
                    .equals(other.lastBioInput, lastBioInput)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lastBioInput);

  @override
  _$SignUpScreenEventRequestEmailCopyWith<_SignUpScreenEventRequestEmail>
      get copyWith => __$SignUpScreenEventRequestEmailCopyWithImpl<
          _SignUpScreenEventRequestEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestNameScreen(),
    @required Result requestBioScreen(String lastNameInput),
    @required Result requestEmailScreen(String lastBioInput),
    @required Result requestPasswordScreen(String lastEmailInput),
    @required Result requestFinishScreen(String lastPassword),
    @required Result requestLastState(),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestEmailScreen(lastBioInput);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestNameScreen(),
    Result requestBioScreen(String lastNameInput),
    Result requestEmailScreen(String lastBioInput),
    Result requestPasswordScreen(String lastEmailInput),
    Result requestFinishScreen(String lastPassword),
    Result requestLastState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestEmailScreen != null) {
      return requestEmailScreen(lastBioInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestNameScreen(_SignUpScreenEventRequestName value),
    @required Result requestBioScreen(_SignUpScreenEventRequestBio value),
    @required Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    @required
        Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    @required Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    @required Result requestLastState(_SignUpScreenEventRequestLast value),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestEmailScreen(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestNameScreen(_SignUpScreenEventRequestName value),
    Result requestBioScreen(_SignUpScreenEventRequestBio value),
    Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    Result requestLastState(_SignUpScreenEventRequestLast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestEmailScreen != null) {
      return requestEmailScreen(this);
    }
    return orElse();
  }
}

abstract class _SignUpScreenEventRequestEmail implements SignUpScreenEvent {
  const factory _SignUpScreenEventRequestEmail(String lastBioInput) =
      _$_SignUpScreenEventRequestEmail;

  String get lastBioInput;
  _$SignUpScreenEventRequestEmailCopyWith<_SignUpScreenEventRequestEmail>
      get copyWith;
}

abstract class _$SignUpScreenEventRequestPasswordCopyWith<$Res> {
  factory _$SignUpScreenEventRequestPasswordCopyWith(
          _SignUpScreenEventRequestPassword value,
          $Res Function(_SignUpScreenEventRequestPassword) then) =
      __$SignUpScreenEventRequestPasswordCopyWithImpl<$Res>;
  $Res call({String lastEmailInput});
}

class __$SignUpScreenEventRequestPasswordCopyWithImpl<$Res>
    extends _$SignUpScreenEventCopyWithImpl<$Res>
    implements _$SignUpScreenEventRequestPasswordCopyWith<$Res> {
  __$SignUpScreenEventRequestPasswordCopyWithImpl(
      _SignUpScreenEventRequestPassword _value,
      $Res Function(_SignUpScreenEventRequestPassword) _then)
      : super(_value, (v) => _then(v as _SignUpScreenEventRequestPassword));

  @override
  _SignUpScreenEventRequestPassword get _value =>
      super._value as _SignUpScreenEventRequestPassword;

  @override
  $Res call({
    Object lastEmailInput = freezed,
  }) {
    return _then(_SignUpScreenEventRequestPassword(
      lastEmailInput == freezed
          ? _value.lastEmailInput
          : lastEmailInput as String,
    ));
  }
}

class _$_SignUpScreenEventRequestPassword
    implements _SignUpScreenEventRequestPassword {
  const _$_SignUpScreenEventRequestPassword(this.lastEmailInput)
      : assert(lastEmailInput != null);

  @override
  final String lastEmailInput;

  @override
  String toString() {
    return 'SignUpScreenEvent.requestPasswordScreen(lastEmailInput: $lastEmailInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpScreenEventRequestPassword &&
            (identical(other.lastEmailInput, lastEmailInput) ||
                const DeepCollectionEquality()
                    .equals(other.lastEmailInput, lastEmailInput)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lastEmailInput);

  @override
  _$SignUpScreenEventRequestPasswordCopyWith<_SignUpScreenEventRequestPassword>
      get copyWith => __$SignUpScreenEventRequestPasswordCopyWithImpl<
          _SignUpScreenEventRequestPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestNameScreen(),
    @required Result requestBioScreen(String lastNameInput),
    @required Result requestEmailScreen(String lastBioInput),
    @required Result requestPasswordScreen(String lastEmailInput),
    @required Result requestFinishScreen(String lastPassword),
    @required Result requestLastState(),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestPasswordScreen(lastEmailInput);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestNameScreen(),
    Result requestBioScreen(String lastNameInput),
    Result requestEmailScreen(String lastBioInput),
    Result requestPasswordScreen(String lastEmailInput),
    Result requestFinishScreen(String lastPassword),
    Result requestLastState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestPasswordScreen != null) {
      return requestPasswordScreen(lastEmailInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestNameScreen(_SignUpScreenEventRequestName value),
    @required Result requestBioScreen(_SignUpScreenEventRequestBio value),
    @required Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    @required
        Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    @required Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    @required Result requestLastState(_SignUpScreenEventRequestLast value),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestPasswordScreen(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestNameScreen(_SignUpScreenEventRequestName value),
    Result requestBioScreen(_SignUpScreenEventRequestBio value),
    Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    Result requestLastState(_SignUpScreenEventRequestLast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestPasswordScreen != null) {
      return requestPasswordScreen(this);
    }
    return orElse();
  }
}

abstract class _SignUpScreenEventRequestPassword implements SignUpScreenEvent {
  const factory _SignUpScreenEventRequestPassword(String lastEmailInput) =
      _$_SignUpScreenEventRequestPassword;

  String get lastEmailInput;
  _$SignUpScreenEventRequestPasswordCopyWith<_SignUpScreenEventRequestPassword>
      get copyWith;
}

abstract class _$SignUpScreenEventRequestFinishCopyWith<$Res> {
  factory _$SignUpScreenEventRequestFinishCopyWith(
          _SignUpScreenEventRequestFinish value,
          $Res Function(_SignUpScreenEventRequestFinish) then) =
      __$SignUpScreenEventRequestFinishCopyWithImpl<$Res>;
  $Res call({String lastPassword});
}

class __$SignUpScreenEventRequestFinishCopyWithImpl<$Res>
    extends _$SignUpScreenEventCopyWithImpl<$Res>
    implements _$SignUpScreenEventRequestFinishCopyWith<$Res> {
  __$SignUpScreenEventRequestFinishCopyWithImpl(
      _SignUpScreenEventRequestFinish _value,
      $Res Function(_SignUpScreenEventRequestFinish) _then)
      : super(_value, (v) => _then(v as _SignUpScreenEventRequestFinish));

  @override
  _SignUpScreenEventRequestFinish get _value =>
      super._value as _SignUpScreenEventRequestFinish;

  @override
  $Res call({
    Object lastPassword = freezed,
  }) {
    return _then(_SignUpScreenEventRequestFinish(
      lastPassword == freezed ? _value.lastPassword : lastPassword as String,
    ));
  }
}

class _$_SignUpScreenEventRequestFinish
    implements _SignUpScreenEventRequestFinish {
  const _$_SignUpScreenEventRequestFinish(this.lastPassword)
      : assert(lastPassword != null);

  @override
  final String lastPassword;

  @override
  String toString() {
    return 'SignUpScreenEvent.requestFinishScreen(lastPassword: $lastPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpScreenEventRequestFinish &&
            (identical(other.lastPassword, lastPassword) ||
                const DeepCollectionEquality()
                    .equals(other.lastPassword, lastPassword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(lastPassword);

  @override
  _$SignUpScreenEventRequestFinishCopyWith<_SignUpScreenEventRequestFinish>
      get copyWith => __$SignUpScreenEventRequestFinishCopyWithImpl<
          _SignUpScreenEventRequestFinish>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestNameScreen(),
    @required Result requestBioScreen(String lastNameInput),
    @required Result requestEmailScreen(String lastBioInput),
    @required Result requestPasswordScreen(String lastEmailInput),
    @required Result requestFinishScreen(String lastPassword),
    @required Result requestLastState(),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestFinishScreen(lastPassword);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestNameScreen(),
    Result requestBioScreen(String lastNameInput),
    Result requestEmailScreen(String lastBioInput),
    Result requestPasswordScreen(String lastEmailInput),
    Result requestFinishScreen(String lastPassword),
    Result requestLastState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestFinishScreen != null) {
      return requestFinishScreen(lastPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestNameScreen(_SignUpScreenEventRequestName value),
    @required Result requestBioScreen(_SignUpScreenEventRequestBio value),
    @required Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    @required
        Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    @required Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    @required Result requestLastState(_SignUpScreenEventRequestLast value),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestFinishScreen(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestNameScreen(_SignUpScreenEventRequestName value),
    Result requestBioScreen(_SignUpScreenEventRequestBio value),
    Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    Result requestLastState(_SignUpScreenEventRequestLast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestFinishScreen != null) {
      return requestFinishScreen(this);
    }
    return orElse();
  }
}

abstract class _SignUpScreenEventRequestFinish implements SignUpScreenEvent {
  const factory _SignUpScreenEventRequestFinish(String lastPassword) =
      _$_SignUpScreenEventRequestFinish;

  String get lastPassword;
  _$SignUpScreenEventRequestFinishCopyWith<_SignUpScreenEventRequestFinish>
      get copyWith;
}

abstract class _$SignUpScreenEventRequestLastCopyWith<$Res> {
  factory _$SignUpScreenEventRequestLastCopyWith(
          _SignUpScreenEventRequestLast value,
          $Res Function(_SignUpScreenEventRequestLast) then) =
      __$SignUpScreenEventRequestLastCopyWithImpl<$Res>;
}

class __$SignUpScreenEventRequestLastCopyWithImpl<$Res>
    extends _$SignUpScreenEventCopyWithImpl<$Res>
    implements _$SignUpScreenEventRequestLastCopyWith<$Res> {
  __$SignUpScreenEventRequestLastCopyWithImpl(
      _SignUpScreenEventRequestLast _value,
      $Res Function(_SignUpScreenEventRequestLast) _then)
      : super(_value, (v) => _then(v as _SignUpScreenEventRequestLast));

  @override
  _SignUpScreenEventRequestLast get _value =>
      super._value as _SignUpScreenEventRequestLast;
}

class _$_SignUpScreenEventRequestLast implements _SignUpScreenEventRequestLast {
  const _$_SignUpScreenEventRequestLast();

  @override
  String toString() {
    return 'SignUpScreenEvent.requestLastState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignUpScreenEventRequestLast);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result requestNameScreen(),
    @required Result requestBioScreen(String lastNameInput),
    @required Result requestEmailScreen(String lastBioInput),
    @required Result requestPasswordScreen(String lastEmailInput),
    @required Result requestFinishScreen(String lastPassword),
    @required Result requestLastState(),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestLastState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result requestNameScreen(),
    Result requestBioScreen(String lastNameInput),
    Result requestEmailScreen(String lastBioInput),
    Result requestPasswordScreen(String lastEmailInput),
    Result requestFinishScreen(String lastPassword),
    Result requestLastState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestLastState != null) {
      return requestLastState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result requestNameScreen(_SignUpScreenEventRequestName value),
    @required Result requestBioScreen(_SignUpScreenEventRequestBio value),
    @required Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    @required
        Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    @required Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    @required Result requestLastState(_SignUpScreenEventRequestLast value),
  }) {
    assert(requestNameScreen != null);
    assert(requestBioScreen != null);
    assert(requestEmailScreen != null);
    assert(requestPasswordScreen != null);
    assert(requestFinishScreen != null);
    assert(requestLastState != null);
    return requestLastState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result requestNameScreen(_SignUpScreenEventRequestName value),
    Result requestBioScreen(_SignUpScreenEventRequestBio value),
    Result requestEmailScreen(_SignUpScreenEventRequestEmail value),
    Result requestPasswordScreen(_SignUpScreenEventRequestPassword value),
    Result requestFinishScreen(_SignUpScreenEventRequestFinish value),
    Result requestLastState(_SignUpScreenEventRequestLast value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (requestLastState != null) {
      return requestLastState(this);
    }
    return orElse();
  }
}

abstract class _SignUpScreenEventRequestLast implements SignUpScreenEvent {
  const factory _SignUpScreenEventRequestLast() =
      _$_SignUpScreenEventRequestLast;
}

class _$SignUpScreenStateTearOff {
  const _$SignUpScreenStateTearOff();

  _SignUpScreenStateInitial initial() {
    return const _SignUpScreenStateInitial();
  }

  SignUpScreenStateName name(String initialValue, String errorMsgOrEmpty) {
    return SignUpScreenStateName(
      initialValue,
      errorMsgOrEmpty,
    );
  }

  SignUpScreenStateBio bio(String initialValue, String errorMsgOrEmpty) {
    return SignUpScreenStateBio(
      initialValue,
      errorMsgOrEmpty,
    );
  }

  SignUpScreenStateEmail email(String initialValue, String errorMsgOrEmpty) {
    return SignUpScreenStateEmail(
      initialValue,
      errorMsgOrEmpty,
    );
  }

  SignUpScreenStatePassword password(
      String initialValue, String errorMsgOrEmpty) {
    return SignUpScreenStatePassword(
      initialValue,
      errorMsgOrEmpty,
    );
  }

  _SignUpScreenStateFinish finish(User user) {
    return _SignUpScreenStateFinish(
      user,
    );
  }

  _SignUpScreenStateLoading loading() {
    return const _SignUpScreenStateLoading();
  }
}

// ignore: unused_element
const $SignUpScreenState = _$SignUpScreenStateTearOff();

mixin _$SignUpScreenState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result name(String initialValue, String errorMsgOrEmpty),
    @required Result bio(String initialValue, String errorMsgOrEmpty),
    @required Result email(String initialValue, String errorMsgOrEmpty),
    @required Result password(String initialValue, String errorMsgOrEmpty),
    @required Result finish(User user),
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result name(String initialValue, String errorMsgOrEmpty),
    Result bio(String initialValue, String errorMsgOrEmpty),
    Result email(String initialValue, String errorMsgOrEmpty),
    Result password(String initialValue, String errorMsgOrEmpty),
    Result finish(User user),
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SignUpScreenStateInitial value),
    @required Result name(SignUpScreenStateName value),
    @required Result bio(SignUpScreenStateBio value),
    @required Result email(SignUpScreenStateEmail value),
    @required Result password(SignUpScreenStatePassword value),
    @required Result finish(_SignUpScreenStateFinish value),
    @required Result loading(_SignUpScreenStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SignUpScreenStateInitial value),
    Result name(SignUpScreenStateName value),
    Result bio(SignUpScreenStateBio value),
    Result email(SignUpScreenStateEmail value),
    Result password(SignUpScreenStatePassword value),
    Result finish(_SignUpScreenStateFinish value),
    Result loading(_SignUpScreenStateLoading value),
    @required Result orElse(),
  });
}

abstract class $SignUpScreenStateCopyWith<$Res> {
  factory $SignUpScreenStateCopyWith(
          SignUpScreenState value, $Res Function(SignUpScreenState) then) =
      _$SignUpScreenStateCopyWithImpl<$Res>;
}

class _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenStateCopyWith<$Res> {
  _$SignUpScreenStateCopyWithImpl(this._value, this._then);

  final SignUpScreenState _value;
  // ignore: unused_field
  final $Res Function(SignUpScreenState) _then;
}

abstract class _$SignUpScreenStateInitialCopyWith<$Res> {
  factory _$SignUpScreenStateInitialCopyWith(_SignUpScreenStateInitial value,
          $Res Function(_SignUpScreenStateInitial) then) =
      __$SignUpScreenStateInitialCopyWithImpl<$Res>;
}

class __$SignUpScreenStateInitialCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements _$SignUpScreenStateInitialCopyWith<$Res> {
  __$SignUpScreenStateInitialCopyWithImpl(_SignUpScreenStateInitial _value,
      $Res Function(_SignUpScreenStateInitial) _then)
      : super(_value, (v) => _then(v as _SignUpScreenStateInitial));

  @override
  _SignUpScreenStateInitial get _value =>
      super._value as _SignUpScreenStateInitial;
}

class _$_SignUpScreenStateInitial implements _SignUpScreenStateInitial {
  const _$_SignUpScreenStateInitial();

  @override
  String toString() {
    return 'SignUpScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignUpScreenStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result name(String initialValue, String errorMsgOrEmpty),
    @required Result bio(String initialValue, String errorMsgOrEmpty),
    @required Result email(String initialValue, String errorMsgOrEmpty),
    @required Result password(String initialValue, String errorMsgOrEmpty),
    @required Result finish(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result name(String initialValue, String errorMsgOrEmpty),
    Result bio(String initialValue, String errorMsgOrEmpty),
    Result email(String initialValue, String errorMsgOrEmpty),
    Result password(String initialValue, String errorMsgOrEmpty),
    Result finish(User user),
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
    @required Result initial(_SignUpScreenStateInitial value),
    @required Result name(SignUpScreenStateName value),
    @required Result bio(SignUpScreenStateBio value),
    @required Result email(SignUpScreenStateEmail value),
    @required Result password(SignUpScreenStatePassword value),
    @required Result finish(_SignUpScreenStateFinish value),
    @required Result loading(_SignUpScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SignUpScreenStateInitial value),
    Result name(SignUpScreenStateName value),
    Result bio(SignUpScreenStateBio value),
    Result email(SignUpScreenStateEmail value),
    Result password(SignUpScreenStatePassword value),
    Result finish(_SignUpScreenStateFinish value),
    Result loading(_SignUpScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignUpScreenStateInitial implements SignUpScreenState {
  const factory _SignUpScreenStateInitial() = _$_SignUpScreenStateInitial;
}

abstract class $SignUpScreenStateNameCopyWith<$Res> {
  factory $SignUpScreenStateNameCopyWith(SignUpScreenStateName value,
          $Res Function(SignUpScreenStateName) then) =
      _$SignUpScreenStateNameCopyWithImpl<$Res>;
  $Res call({String initialValue, String errorMsgOrEmpty});
}

class _$SignUpScreenStateNameCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenStateNameCopyWith<$Res> {
  _$SignUpScreenStateNameCopyWithImpl(
      SignUpScreenStateName _value, $Res Function(SignUpScreenStateName) _then)
      : super(_value, (v) => _then(v as SignUpScreenStateName));

  @override
  SignUpScreenStateName get _value => super._value as SignUpScreenStateName;

  @override
  $Res call({
    Object initialValue = freezed,
    Object errorMsgOrEmpty = freezed,
  }) {
    return _then(SignUpScreenStateName(
      initialValue == freezed ? _value.initialValue : initialValue as String,
      errorMsgOrEmpty == freezed
          ? _value.errorMsgOrEmpty
          : errorMsgOrEmpty as String,
    ));
  }
}

class _$SignUpScreenStateName implements SignUpScreenStateName {
  const _$SignUpScreenStateName(this.initialValue, this.errorMsgOrEmpty)
      : assert(initialValue != null),
        assert(errorMsgOrEmpty != null);

  @override
  final String initialValue;
  @override
  final String errorMsgOrEmpty;

  @override
  String toString() {
    return 'SignUpScreenState.name(initialValue: $initialValue, errorMsgOrEmpty: $errorMsgOrEmpty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignUpScreenStateName &&
            (identical(other.initialValue, initialValue) ||
                const DeepCollectionEquality()
                    .equals(other.initialValue, initialValue)) &&
            (identical(other.errorMsgOrEmpty, errorMsgOrEmpty) ||
                const DeepCollectionEquality()
                    .equals(other.errorMsgOrEmpty, errorMsgOrEmpty)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialValue) ^
      const DeepCollectionEquality().hash(errorMsgOrEmpty);

  @override
  $SignUpScreenStateNameCopyWith<SignUpScreenStateName> get copyWith =>
      _$SignUpScreenStateNameCopyWithImpl<SignUpScreenStateName>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result name(String initialValue, String errorMsgOrEmpty),
    @required Result bio(String initialValue, String errorMsgOrEmpty),
    @required Result email(String initialValue, String errorMsgOrEmpty),
    @required Result password(String initialValue, String errorMsgOrEmpty),
    @required Result finish(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return name(initialValue, errorMsgOrEmpty);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result name(String initialValue, String errorMsgOrEmpty),
    Result bio(String initialValue, String errorMsgOrEmpty),
    Result email(String initialValue, String errorMsgOrEmpty),
    Result password(String initialValue, String errorMsgOrEmpty),
    Result finish(User user),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (name != null) {
      return name(initialValue, errorMsgOrEmpty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SignUpScreenStateInitial value),
    @required Result name(SignUpScreenStateName value),
    @required Result bio(SignUpScreenStateBio value),
    @required Result email(SignUpScreenStateEmail value),
    @required Result password(SignUpScreenStatePassword value),
    @required Result finish(_SignUpScreenStateFinish value),
    @required Result loading(_SignUpScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return name(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SignUpScreenStateInitial value),
    Result name(SignUpScreenStateName value),
    Result bio(SignUpScreenStateBio value),
    Result email(SignUpScreenStateEmail value),
    Result password(SignUpScreenStatePassword value),
    Result finish(_SignUpScreenStateFinish value),
    Result loading(_SignUpScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (name != null) {
      return name(this);
    }
    return orElse();
  }
}

abstract class SignUpScreenStateName implements SignUpScreenState {
  const factory SignUpScreenStateName(
      String initialValue, String errorMsgOrEmpty) = _$SignUpScreenStateName;

  String get initialValue;
  String get errorMsgOrEmpty;
  $SignUpScreenStateNameCopyWith<SignUpScreenStateName> get copyWith;
}

abstract class $SignUpScreenStateBioCopyWith<$Res> {
  factory $SignUpScreenStateBioCopyWith(SignUpScreenStateBio value,
          $Res Function(SignUpScreenStateBio) then) =
      _$SignUpScreenStateBioCopyWithImpl<$Res>;
  $Res call({String initialValue, String errorMsgOrEmpty});
}

class _$SignUpScreenStateBioCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenStateBioCopyWith<$Res> {
  _$SignUpScreenStateBioCopyWithImpl(
      SignUpScreenStateBio _value, $Res Function(SignUpScreenStateBio) _then)
      : super(_value, (v) => _then(v as SignUpScreenStateBio));

  @override
  SignUpScreenStateBio get _value => super._value as SignUpScreenStateBio;

  @override
  $Res call({
    Object initialValue = freezed,
    Object errorMsgOrEmpty = freezed,
  }) {
    return _then(SignUpScreenStateBio(
      initialValue == freezed ? _value.initialValue : initialValue as String,
      errorMsgOrEmpty == freezed
          ? _value.errorMsgOrEmpty
          : errorMsgOrEmpty as String,
    ));
  }
}

class _$SignUpScreenStateBio implements SignUpScreenStateBio {
  const _$SignUpScreenStateBio(this.initialValue, this.errorMsgOrEmpty)
      : assert(initialValue != null),
        assert(errorMsgOrEmpty != null);

  @override
  final String initialValue;
  @override
  final String errorMsgOrEmpty;

  @override
  String toString() {
    return 'SignUpScreenState.bio(initialValue: $initialValue, errorMsgOrEmpty: $errorMsgOrEmpty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignUpScreenStateBio &&
            (identical(other.initialValue, initialValue) ||
                const DeepCollectionEquality()
                    .equals(other.initialValue, initialValue)) &&
            (identical(other.errorMsgOrEmpty, errorMsgOrEmpty) ||
                const DeepCollectionEquality()
                    .equals(other.errorMsgOrEmpty, errorMsgOrEmpty)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialValue) ^
      const DeepCollectionEquality().hash(errorMsgOrEmpty);

  @override
  $SignUpScreenStateBioCopyWith<SignUpScreenStateBio> get copyWith =>
      _$SignUpScreenStateBioCopyWithImpl<SignUpScreenStateBio>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result name(String initialValue, String errorMsgOrEmpty),
    @required Result bio(String initialValue, String errorMsgOrEmpty),
    @required Result email(String initialValue, String errorMsgOrEmpty),
    @required Result password(String initialValue, String errorMsgOrEmpty),
    @required Result finish(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return bio(initialValue, errorMsgOrEmpty);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result name(String initialValue, String errorMsgOrEmpty),
    Result bio(String initialValue, String errorMsgOrEmpty),
    Result email(String initialValue, String errorMsgOrEmpty),
    Result password(String initialValue, String errorMsgOrEmpty),
    Result finish(User user),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (bio != null) {
      return bio(initialValue, errorMsgOrEmpty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SignUpScreenStateInitial value),
    @required Result name(SignUpScreenStateName value),
    @required Result bio(SignUpScreenStateBio value),
    @required Result email(SignUpScreenStateEmail value),
    @required Result password(SignUpScreenStatePassword value),
    @required Result finish(_SignUpScreenStateFinish value),
    @required Result loading(_SignUpScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return bio(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SignUpScreenStateInitial value),
    Result name(SignUpScreenStateName value),
    Result bio(SignUpScreenStateBio value),
    Result email(SignUpScreenStateEmail value),
    Result password(SignUpScreenStatePassword value),
    Result finish(_SignUpScreenStateFinish value),
    Result loading(_SignUpScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (bio != null) {
      return bio(this);
    }
    return orElse();
  }
}

abstract class SignUpScreenStateBio implements SignUpScreenState {
  const factory SignUpScreenStateBio(
      String initialValue, String errorMsgOrEmpty) = _$SignUpScreenStateBio;

  String get initialValue;
  String get errorMsgOrEmpty;
  $SignUpScreenStateBioCopyWith<SignUpScreenStateBio> get copyWith;
}

abstract class $SignUpScreenStateEmailCopyWith<$Res> {
  factory $SignUpScreenStateEmailCopyWith(SignUpScreenStateEmail value,
          $Res Function(SignUpScreenStateEmail) then) =
      _$SignUpScreenStateEmailCopyWithImpl<$Res>;
  $Res call({String initialValue, String errorMsgOrEmpty});
}

class _$SignUpScreenStateEmailCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenStateEmailCopyWith<$Res> {
  _$SignUpScreenStateEmailCopyWithImpl(SignUpScreenStateEmail _value,
      $Res Function(SignUpScreenStateEmail) _then)
      : super(_value, (v) => _then(v as SignUpScreenStateEmail));

  @override
  SignUpScreenStateEmail get _value => super._value as SignUpScreenStateEmail;

  @override
  $Res call({
    Object initialValue = freezed,
    Object errorMsgOrEmpty = freezed,
  }) {
    return _then(SignUpScreenStateEmail(
      initialValue == freezed ? _value.initialValue : initialValue as String,
      errorMsgOrEmpty == freezed
          ? _value.errorMsgOrEmpty
          : errorMsgOrEmpty as String,
    ));
  }
}

class _$SignUpScreenStateEmail implements SignUpScreenStateEmail {
  const _$SignUpScreenStateEmail(this.initialValue, this.errorMsgOrEmpty)
      : assert(initialValue != null),
        assert(errorMsgOrEmpty != null);

  @override
  final String initialValue;
  @override
  final String errorMsgOrEmpty;

  @override
  String toString() {
    return 'SignUpScreenState.email(initialValue: $initialValue, errorMsgOrEmpty: $errorMsgOrEmpty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignUpScreenStateEmail &&
            (identical(other.initialValue, initialValue) ||
                const DeepCollectionEquality()
                    .equals(other.initialValue, initialValue)) &&
            (identical(other.errorMsgOrEmpty, errorMsgOrEmpty) ||
                const DeepCollectionEquality()
                    .equals(other.errorMsgOrEmpty, errorMsgOrEmpty)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialValue) ^
      const DeepCollectionEquality().hash(errorMsgOrEmpty);

  @override
  $SignUpScreenStateEmailCopyWith<SignUpScreenStateEmail> get copyWith =>
      _$SignUpScreenStateEmailCopyWithImpl<SignUpScreenStateEmail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result name(String initialValue, String errorMsgOrEmpty),
    @required Result bio(String initialValue, String errorMsgOrEmpty),
    @required Result email(String initialValue, String errorMsgOrEmpty),
    @required Result password(String initialValue, String errorMsgOrEmpty),
    @required Result finish(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return email(initialValue, errorMsgOrEmpty);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result name(String initialValue, String errorMsgOrEmpty),
    Result bio(String initialValue, String errorMsgOrEmpty),
    Result email(String initialValue, String errorMsgOrEmpty),
    Result password(String initialValue, String errorMsgOrEmpty),
    Result finish(User user),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (email != null) {
      return email(initialValue, errorMsgOrEmpty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SignUpScreenStateInitial value),
    @required Result name(SignUpScreenStateName value),
    @required Result bio(SignUpScreenStateBio value),
    @required Result email(SignUpScreenStateEmail value),
    @required Result password(SignUpScreenStatePassword value),
    @required Result finish(_SignUpScreenStateFinish value),
    @required Result loading(_SignUpScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return email(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SignUpScreenStateInitial value),
    Result name(SignUpScreenStateName value),
    Result bio(SignUpScreenStateBio value),
    Result email(SignUpScreenStateEmail value),
    Result password(SignUpScreenStatePassword value),
    Result finish(_SignUpScreenStateFinish value),
    Result loading(_SignUpScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (email != null) {
      return email(this);
    }
    return orElse();
  }
}

abstract class SignUpScreenStateEmail implements SignUpScreenState {
  const factory SignUpScreenStateEmail(
      String initialValue, String errorMsgOrEmpty) = _$SignUpScreenStateEmail;

  String get initialValue;
  String get errorMsgOrEmpty;
  $SignUpScreenStateEmailCopyWith<SignUpScreenStateEmail> get copyWith;
}

abstract class $SignUpScreenStatePasswordCopyWith<$Res> {
  factory $SignUpScreenStatePasswordCopyWith(SignUpScreenStatePassword value,
          $Res Function(SignUpScreenStatePassword) then) =
      _$SignUpScreenStatePasswordCopyWithImpl<$Res>;
  $Res call({String initialValue, String errorMsgOrEmpty});
}

class _$SignUpScreenStatePasswordCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements $SignUpScreenStatePasswordCopyWith<$Res> {
  _$SignUpScreenStatePasswordCopyWithImpl(SignUpScreenStatePassword _value,
      $Res Function(SignUpScreenStatePassword) _then)
      : super(_value, (v) => _then(v as SignUpScreenStatePassword));

  @override
  SignUpScreenStatePassword get _value =>
      super._value as SignUpScreenStatePassword;

  @override
  $Res call({
    Object initialValue = freezed,
    Object errorMsgOrEmpty = freezed,
  }) {
    return _then(SignUpScreenStatePassword(
      initialValue == freezed ? _value.initialValue : initialValue as String,
      errorMsgOrEmpty == freezed
          ? _value.errorMsgOrEmpty
          : errorMsgOrEmpty as String,
    ));
  }
}

class _$SignUpScreenStatePassword implements SignUpScreenStatePassword {
  const _$SignUpScreenStatePassword(this.initialValue, this.errorMsgOrEmpty)
      : assert(initialValue != null),
        assert(errorMsgOrEmpty != null);

  @override
  final String initialValue;
  @override
  final String errorMsgOrEmpty;

  @override
  String toString() {
    return 'SignUpScreenState.password(initialValue: $initialValue, errorMsgOrEmpty: $errorMsgOrEmpty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignUpScreenStatePassword &&
            (identical(other.initialValue, initialValue) ||
                const DeepCollectionEquality()
                    .equals(other.initialValue, initialValue)) &&
            (identical(other.errorMsgOrEmpty, errorMsgOrEmpty) ||
                const DeepCollectionEquality()
                    .equals(other.errorMsgOrEmpty, errorMsgOrEmpty)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialValue) ^
      const DeepCollectionEquality().hash(errorMsgOrEmpty);

  @override
  $SignUpScreenStatePasswordCopyWith<SignUpScreenStatePassword> get copyWith =>
      _$SignUpScreenStatePasswordCopyWithImpl<SignUpScreenStatePassword>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result name(String initialValue, String errorMsgOrEmpty),
    @required Result bio(String initialValue, String errorMsgOrEmpty),
    @required Result email(String initialValue, String errorMsgOrEmpty),
    @required Result password(String initialValue, String errorMsgOrEmpty),
    @required Result finish(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return password(initialValue, errorMsgOrEmpty);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result name(String initialValue, String errorMsgOrEmpty),
    Result bio(String initialValue, String errorMsgOrEmpty),
    Result email(String initialValue, String errorMsgOrEmpty),
    Result password(String initialValue, String errorMsgOrEmpty),
    Result finish(User user),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (password != null) {
      return password(initialValue, errorMsgOrEmpty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SignUpScreenStateInitial value),
    @required Result name(SignUpScreenStateName value),
    @required Result bio(SignUpScreenStateBio value),
    @required Result email(SignUpScreenStateEmail value),
    @required Result password(SignUpScreenStatePassword value),
    @required Result finish(_SignUpScreenStateFinish value),
    @required Result loading(_SignUpScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return password(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SignUpScreenStateInitial value),
    Result name(SignUpScreenStateName value),
    Result bio(SignUpScreenStateBio value),
    Result email(SignUpScreenStateEmail value),
    Result password(SignUpScreenStatePassword value),
    Result finish(_SignUpScreenStateFinish value),
    Result loading(_SignUpScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (password != null) {
      return password(this);
    }
    return orElse();
  }
}

abstract class SignUpScreenStatePassword implements SignUpScreenState {
  const factory SignUpScreenStatePassword(
          String initialValue, String errorMsgOrEmpty) =
      _$SignUpScreenStatePassword;

  String get initialValue;
  String get errorMsgOrEmpty;
  $SignUpScreenStatePasswordCopyWith<SignUpScreenStatePassword> get copyWith;
}

abstract class _$SignUpScreenStateFinishCopyWith<$Res> {
  factory _$SignUpScreenStateFinishCopyWith(_SignUpScreenStateFinish value,
          $Res Function(_SignUpScreenStateFinish) then) =
      __$SignUpScreenStateFinishCopyWithImpl<$Res>;
  $Res call({User user});
}

class __$SignUpScreenStateFinishCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements _$SignUpScreenStateFinishCopyWith<$Res> {
  __$SignUpScreenStateFinishCopyWithImpl(_SignUpScreenStateFinish _value,
      $Res Function(_SignUpScreenStateFinish) _then)
      : super(_value, (v) => _then(v as _SignUpScreenStateFinish));

  @override
  _SignUpScreenStateFinish get _value =>
      super._value as _SignUpScreenStateFinish;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(_SignUpScreenStateFinish(
      user == freezed ? _value.user : user as User,
    ));
  }
}

class _$_SignUpScreenStateFinish implements _SignUpScreenStateFinish {
  const _$_SignUpScreenStateFinish(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString() {
    return 'SignUpScreenState.finish(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpScreenStateFinish &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  _$SignUpScreenStateFinishCopyWith<_SignUpScreenStateFinish> get copyWith =>
      __$SignUpScreenStateFinishCopyWithImpl<_SignUpScreenStateFinish>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result name(String initialValue, String errorMsgOrEmpty),
    @required Result bio(String initialValue, String errorMsgOrEmpty),
    @required Result email(String initialValue, String errorMsgOrEmpty),
    @required Result password(String initialValue, String errorMsgOrEmpty),
    @required Result finish(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return finish(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result name(String initialValue, String errorMsgOrEmpty),
    Result bio(String initialValue, String errorMsgOrEmpty),
    Result email(String initialValue, String errorMsgOrEmpty),
    Result password(String initialValue, String errorMsgOrEmpty),
    Result finish(User user),
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (finish != null) {
      return finish(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_SignUpScreenStateInitial value),
    @required Result name(SignUpScreenStateName value),
    @required Result bio(SignUpScreenStateBio value),
    @required Result email(SignUpScreenStateEmail value),
    @required Result password(SignUpScreenStatePassword value),
    @required Result finish(_SignUpScreenStateFinish value),
    @required Result loading(_SignUpScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return finish(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SignUpScreenStateInitial value),
    Result name(SignUpScreenStateName value),
    Result bio(SignUpScreenStateBio value),
    Result email(SignUpScreenStateEmail value),
    Result password(SignUpScreenStatePassword value),
    Result finish(_SignUpScreenStateFinish value),
    Result loading(_SignUpScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (finish != null) {
      return finish(this);
    }
    return orElse();
  }
}

abstract class _SignUpScreenStateFinish implements SignUpScreenState {
  const factory _SignUpScreenStateFinish(User user) =
      _$_SignUpScreenStateFinish;

  User get user;
  _$SignUpScreenStateFinishCopyWith<_SignUpScreenStateFinish> get copyWith;
}

abstract class _$SignUpScreenStateLoadingCopyWith<$Res> {
  factory _$SignUpScreenStateLoadingCopyWith(_SignUpScreenStateLoading value,
          $Res Function(_SignUpScreenStateLoading) then) =
      __$SignUpScreenStateLoadingCopyWithImpl<$Res>;
}

class __$SignUpScreenStateLoadingCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res>
    implements _$SignUpScreenStateLoadingCopyWith<$Res> {
  __$SignUpScreenStateLoadingCopyWithImpl(_SignUpScreenStateLoading _value,
      $Res Function(_SignUpScreenStateLoading) _then)
      : super(_value, (v) => _then(v as _SignUpScreenStateLoading));

  @override
  _SignUpScreenStateLoading get _value =>
      super._value as _SignUpScreenStateLoading;
}

class _$_SignUpScreenStateLoading implements _SignUpScreenStateLoading {
  const _$_SignUpScreenStateLoading();

  @override
  String toString() {
    return 'SignUpScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignUpScreenStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result name(String initialValue, String errorMsgOrEmpty),
    @required Result bio(String initialValue, String errorMsgOrEmpty),
    @required Result email(String initialValue, String errorMsgOrEmpty),
    @required Result password(String initialValue, String errorMsgOrEmpty),
    @required Result finish(User user),
    @required Result loading(),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result name(String initialValue, String errorMsgOrEmpty),
    Result bio(String initialValue, String errorMsgOrEmpty),
    Result email(String initialValue, String errorMsgOrEmpty),
    Result password(String initialValue, String errorMsgOrEmpty),
    Result finish(User user),
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
    @required Result initial(_SignUpScreenStateInitial value),
    @required Result name(SignUpScreenStateName value),
    @required Result bio(SignUpScreenStateBio value),
    @required Result email(SignUpScreenStateEmail value),
    @required Result password(SignUpScreenStatePassword value),
    @required Result finish(_SignUpScreenStateFinish value),
    @required Result loading(_SignUpScreenStateLoading value),
  }) {
    assert(initial != null);
    assert(name != null);
    assert(bio != null);
    assert(email != null);
    assert(password != null);
    assert(finish != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_SignUpScreenStateInitial value),
    Result name(SignUpScreenStateName value),
    Result bio(SignUpScreenStateBio value),
    Result email(SignUpScreenStateEmail value),
    Result password(SignUpScreenStatePassword value),
    Result finish(_SignUpScreenStateFinish value),
    Result loading(_SignUpScreenStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignUpScreenStateLoading implements SignUpScreenState {
  const factory _SignUpScreenStateLoading() = _$_SignUpScreenStateLoading;
}
