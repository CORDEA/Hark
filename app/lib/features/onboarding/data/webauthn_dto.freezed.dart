// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webauthn_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterFinishResponseDto {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'auth_token') String get authToken;@JsonKey(name: 'token_expires_at') DateTime get tokenExpiresAt;
/// Create a copy of RegisterFinishResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterFinishResponseDtoCopyWith<RegisterFinishResponseDto> get copyWith => _$RegisterFinishResponseDtoCopyWithImpl<RegisterFinishResponseDto>(this as RegisterFinishResponseDto, _$identity);

  /// Serializes this RegisterFinishResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterFinishResponseDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.tokenExpiresAt, tokenExpiresAt) || other.tokenExpiresAt == tokenExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,authToken,tokenExpiresAt);

@override
String toString() {
  return 'RegisterFinishResponseDto(userId: $userId, authToken: $authToken, tokenExpiresAt: $tokenExpiresAt)';
}


}

/// @nodoc
abstract mixin class $RegisterFinishResponseDtoCopyWith<$Res>  {
  factory $RegisterFinishResponseDtoCopyWith(RegisterFinishResponseDto value, $Res Function(RegisterFinishResponseDto) _then) = _$RegisterFinishResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'auth_token') String authToken,@JsonKey(name: 'token_expires_at') DateTime tokenExpiresAt
});




}
/// @nodoc
class _$RegisterFinishResponseDtoCopyWithImpl<$Res>
    implements $RegisterFinishResponseDtoCopyWith<$Res> {
  _$RegisterFinishResponseDtoCopyWithImpl(this._self, this._then);

  final RegisterFinishResponseDto _self;
  final $Res Function(RegisterFinishResponseDto) _then;

/// Create a copy of RegisterFinishResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? authToken = null,Object? tokenExpiresAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,tokenExpiresAt: null == tokenExpiresAt ? _self.tokenExpiresAt : tokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterFinishResponseDto].
extension RegisterFinishResponseDtoPatterns on RegisterFinishResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterFinishResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterFinishResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterFinishResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _RegisterFinishResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterFinishResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterFinishResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'auth_token')  String authToken, @JsonKey(name: 'token_expires_at')  DateTime tokenExpiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterFinishResponseDto() when $default != null:
return $default(_that.userId,_that.authToken,_that.tokenExpiresAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'auth_token')  String authToken, @JsonKey(name: 'token_expires_at')  DateTime tokenExpiresAt)  $default,) {final _that = this;
switch (_that) {
case _RegisterFinishResponseDto():
return $default(_that.userId,_that.authToken,_that.tokenExpiresAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'auth_token')  String authToken, @JsonKey(name: 'token_expires_at')  DateTime tokenExpiresAt)?  $default,) {final _that = this;
switch (_that) {
case _RegisterFinishResponseDto() when $default != null:
return $default(_that.userId,_that.authToken,_that.tokenExpiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterFinishResponseDto implements RegisterFinishResponseDto {
  const _RegisterFinishResponseDto({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'auth_token') required this.authToken, @JsonKey(name: 'token_expires_at') required this.tokenExpiresAt});
  factory _RegisterFinishResponseDto.fromJson(Map<String, dynamic> json) => _$RegisterFinishResponseDtoFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'auth_token') final  String authToken;
@override@JsonKey(name: 'token_expires_at') final  DateTime tokenExpiresAt;

/// Create a copy of RegisterFinishResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterFinishResponseDtoCopyWith<_RegisterFinishResponseDto> get copyWith => __$RegisterFinishResponseDtoCopyWithImpl<_RegisterFinishResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterFinishResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterFinishResponseDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.authToken, authToken) || other.authToken == authToken)&&(identical(other.tokenExpiresAt, tokenExpiresAt) || other.tokenExpiresAt == tokenExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,authToken,tokenExpiresAt);

@override
String toString() {
  return 'RegisterFinishResponseDto(userId: $userId, authToken: $authToken, tokenExpiresAt: $tokenExpiresAt)';
}


}

/// @nodoc
abstract mixin class _$RegisterFinishResponseDtoCopyWith<$Res> implements $RegisterFinishResponseDtoCopyWith<$Res> {
  factory _$RegisterFinishResponseDtoCopyWith(_RegisterFinishResponseDto value, $Res Function(_RegisterFinishResponseDto) _then) = __$RegisterFinishResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'auth_token') String authToken,@JsonKey(name: 'token_expires_at') DateTime tokenExpiresAt
});




}
/// @nodoc
class __$RegisterFinishResponseDtoCopyWithImpl<$Res>
    implements _$RegisterFinishResponseDtoCopyWith<$Res> {
  __$RegisterFinishResponseDtoCopyWithImpl(this._self, this._then);

  final _RegisterFinishResponseDto _self;
  final $Res Function(_RegisterFinishResponseDto) _then;

/// Create a copy of RegisterFinishResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? authToken = null,Object? tokenExpiresAt = null,}) {
  return _then(_RegisterFinishResponseDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,tokenExpiresAt: null == tokenExpiresAt ? _self.tokenExpiresAt : tokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$RegisterDeviceResponseDto {

@JsonKey(name: 'device_id') String get deviceId;
/// Create a copy of RegisterDeviceResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterDeviceResponseDtoCopyWith<RegisterDeviceResponseDto> get copyWith => _$RegisterDeviceResponseDtoCopyWithImpl<RegisterDeviceResponseDto>(this as RegisterDeviceResponseDto, _$identity);

  /// Serializes this RegisterDeviceResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterDeviceResponseDto&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'RegisterDeviceResponseDto(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $RegisterDeviceResponseDtoCopyWith<$Res>  {
  factory $RegisterDeviceResponseDtoCopyWith(RegisterDeviceResponseDto value, $Res Function(RegisterDeviceResponseDto) _then) = _$RegisterDeviceResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class _$RegisterDeviceResponseDtoCopyWithImpl<$Res>
    implements $RegisterDeviceResponseDtoCopyWith<$Res> {
  _$RegisterDeviceResponseDtoCopyWithImpl(this._self, this._then);

  final RegisterDeviceResponseDto _self;
  final $Res Function(RegisterDeviceResponseDto) _then;

/// Create a copy of RegisterDeviceResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterDeviceResponseDto].
extension RegisterDeviceResponseDtoPatterns on RegisterDeviceResponseDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterDeviceResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterDeviceResponseDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterDeviceResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _RegisterDeviceResponseDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterDeviceResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterDeviceResponseDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'device_id')  String deviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterDeviceResponseDto() when $default != null:
return $default(_that.deviceId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'device_id')  String deviceId)  $default,) {final _that = this;
switch (_that) {
case _RegisterDeviceResponseDto():
return $default(_that.deviceId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'device_id')  String deviceId)?  $default,) {final _that = this;
switch (_that) {
case _RegisterDeviceResponseDto() when $default != null:
return $default(_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterDeviceResponseDto implements RegisterDeviceResponseDto {
  const _RegisterDeviceResponseDto({@JsonKey(name: 'device_id') required this.deviceId});
  factory _RegisterDeviceResponseDto.fromJson(Map<String, dynamic> json) => _$RegisterDeviceResponseDtoFromJson(json);

@override@JsonKey(name: 'device_id') final  String deviceId;

/// Create a copy of RegisterDeviceResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterDeviceResponseDtoCopyWith<_RegisterDeviceResponseDto> get copyWith => __$RegisterDeviceResponseDtoCopyWithImpl<_RegisterDeviceResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterDeviceResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterDeviceResponseDto&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'RegisterDeviceResponseDto(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$RegisterDeviceResponseDtoCopyWith<$Res> implements $RegisterDeviceResponseDtoCopyWith<$Res> {
  factory _$RegisterDeviceResponseDtoCopyWith(_RegisterDeviceResponseDto value, $Res Function(_RegisterDeviceResponseDto) _then) = __$RegisterDeviceResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class __$RegisterDeviceResponseDtoCopyWithImpl<$Res>
    implements _$RegisterDeviceResponseDtoCopyWith<$Res> {
  __$RegisterDeviceResponseDtoCopyWithImpl(this._self, this._then);

  final _RegisterDeviceResponseDto _self;
  final $Res Function(_RegisterDeviceResponseDto) _then;

/// Create a copy of RegisterDeviceResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,}) {
  return _then(_RegisterDeviceResponseDto(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
