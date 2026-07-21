// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentUserProfileDto {

 String get id;@JsonKey(name: 'display_name') String get displayName;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of CurrentUserProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserProfileDtoCopyWith<CurrentUserProfileDto> get copyWith => _$CurrentUserProfileDtoCopyWithImpl<CurrentUserProfileDto>(this as CurrentUserProfileDto, _$identity);

  /// Serializes this CurrentUserProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserProfileDto&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,createdAt);

@override
String toString() {
  return 'CurrentUserProfileDto(id: $id, displayName: $displayName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CurrentUserProfileDtoCopyWith<$Res>  {
  factory $CurrentUserProfileDtoCopyWith(CurrentUserProfileDto value, $Res Function(CurrentUserProfileDto) _then) = _$CurrentUserProfileDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$CurrentUserProfileDtoCopyWithImpl<$Res>
    implements $CurrentUserProfileDtoCopyWith<$Res> {
  _$CurrentUserProfileDtoCopyWithImpl(this._self, this._then);

  final CurrentUserProfileDto _self;
  final $Res Function(CurrentUserProfileDto) _then;

/// Create a copy of CurrentUserProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentUserProfileDto].
extension CurrentUserProfileDtoPatterns on CurrentUserProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentUserProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentUserProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentUserProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _CurrentUserProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentUserProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentUserProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentUserProfileDto() when $default != null:
return $default(_that.id,_that.displayName,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CurrentUserProfileDto():
return $default(_that.id,_that.displayName,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'display_name')  String displayName, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CurrentUserProfileDto() when $default != null:
return $default(_that.id,_that.displayName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentUserProfileDto implements CurrentUserProfileDto {
  const _CurrentUserProfileDto({required this.id, @JsonKey(name: 'display_name') required this.displayName, @JsonKey(name: 'created_at') required this.createdAt});
  factory _CurrentUserProfileDto.fromJson(Map<String, dynamic> json) => _$CurrentUserProfileDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'display_name') final  String displayName;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of CurrentUserProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentUserProfileDtoCopyWith<_CurrentUserProfileDto> get copyWith => __$CurrentUserProfileDtoCopyWithImpl<_CurrentUserProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentUserProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentUserProfileDto&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,createdAt);

@override
String toString() {
  return 'CurrentUserProfileDto(id: $id, displayName: $displayName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CurrentUserProfileDtoCopyWith<$Res> implements $CurrentUserProfileDtoCopyWith<$Res> {
  factory _$CurrentUserProfileDtoCopyWith(_CurrentUserProfileDto value, $Res Function(_CurrentUserProfileDto) _then) = __$CurrentUserProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'display_name') String displayName,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$CurrentUserProfileDtoCopyWithImpl<$Res>
    implements _$CurrentUserProfileDtoCopyWith<$Res> {
  __$CurrentUserProfileDtoCopyWithImpl(this._self, this._then);

  final _CurrentUserProfileDto _self;
  final $Res Function(_CurrentUserProfileDto) _then;

/// Create a copy of CurrentUserProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? createdAt = null,}) {
  return _then(_CurrentUserProfileDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$CurrentUserDeviceDto {

 String get id;@JsonKey(name: 'device_name') String get deviceName; String get locale;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of CurrentUserDeviceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserDeviceDtoCopyWith<CurrentUserDeviceDto> get copyWith => _$CurrentUserDeviceDtoCopyWithImpl<CurrentUserDeviceDto>(this as CurrentUserDeviceDto, _$identity);

  /// Serializes this CurrentUserDeviceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserDeviceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceName,locale,createdAt);

@override
String toString() {
  return 'CurrentUserDeviceDto(id: $id, deviceName: $deviceName, locale: $locale, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CurrentUserDeviceDtoCopyWith<$Res>  {
  factory $CurrentUserDeviceDtoCopyWith(CurrentUserDeviceDto value, $Res Function(CurrentUserDeviceDto) _then) = _$CurrentUserDeviceDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'device_name') String deviceName, String locale,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$CurrentUserDeviceDtoCopyWithImpl<$Res>
    implements $CurrentUserDeviceDtoCopyWith<$Res> {
  _$CurrentUserDeviceDtoCopyWithImpl(this._self, this._then);

  final CurrentUserDeviceDto _self;
  final $Res Function(CurrentUserDeviceDto) _then;

/// Create a copy of CurrentUserDeviceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deviceName = null,Object? locale = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentUserDeviceDto].
extension CurrentUserDeviceDtoPatterns on CurrentUserDeviceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentUserDeviceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentUserDeviceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentUserDeviceDto value)  $default,){
final _that = this;
switch (_that) {
case _CurrentUserDeviceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentUserDeviceDto value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentUserDeviceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'device_name')  String deviceName,  String locale, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentUserDeviceDto() when $default != null:
return $default(_that.id,_that.deviceName,_that.locale,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'device_name')  String deviceName,  String locale, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CurrentUserDeviceDto():
return $default(_that.id,_that.deviceName,_that.locale,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'device_name')  String deviceName,  String locale, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CurrentUserDeviceDto() when $default != null:
return $default(_that.id,_that.deviceName,_that.locale,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentUserDeviceDto implements CurrentUserDeviceDto {
  const _CurrentUserDeviceDto({required this.id, @JsonKey(name: 'device_name') required this.deviceName, required this.locale, @JsonKey(name: 'created_at') required this.createdAt});
  factory _CurrentUserDeviceDto.fromJson(Map<String, dynamic> json) => _$CurrentUserDeviceDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'device_name') final  String deviceName;
@override final  String locale;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of CurrentUserDeviceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentUserDeviceDtoCopyWith<_CurrentUserDeviceDto> get copyWith => __$CurrentUserDeviceDtoCopyWithImpl<_CurrentUserDeviceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentUserDeviceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentUserDeviceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceName,locale,createdAt);

@override
String toString() {
  return 'CurrentUserDeviceDto(id: $id, deviceName: $deviceName, locale: $locale, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CurrentUserDeviceDtoCopyWith<$Res> implements $CurrentUserDeviceDtoCopyWith<$Res> {
  factory _$CurrentUserDeviceDtoCopyWith(_CurrentUserDeviceDto value, $Res Function(_CurrentUserDeviceDto) _then) = __$CurrentUserDeviceDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'device_name') String deviceName, String locale,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$CurrentUserDeviceDtoCopyWithImpl<$Res>
    implements _$CurrentUserDeviceDtoCopyWith<$Res> {
  __$CurrentUserDeviceDtoCopyWithImpl(this._self, this._then);

  final _CurrentUserDeviceDto _self;
  final $Res Function(_CurrentUserDeviceDto) _then;

/// Create a copy of CurrentUserDeviceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deviceName = null,Object? locale = null,Object? createdAt = null,}) {
  return _then(_CurrentUserDeviceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$CurrentUserCredentialDto {

 int get id; String get nickname;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'last_used_at') DateTime? get lastUsedAt;
/// Create a copy of CurrentUserCredentialDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserCredentialDtoCopyWith<CurrentUserCredentialDto> get copyWith => _$CurrentUserCredentialDtoCopyWithImpl<CurrentUserCredentialDto>(this as CurrentUserCredentialDto, _$identity);

  /// Serializes this CurrentUserCredentialDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserCredentialDto&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,createdAt,lastUsedAt);

@override
String toString() {
  return 'CurrentUserCredentialDto(id: $id, nickname: $nickname, createdAt: $createdAt, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class $CurrentUserCredentialDtoCopyWith<$Res>  {
  factory $CurrentUserCredentialDtoCopyWith(CurrentUserCredentialDto value, $Res Function(CurrentUserCredentialDto) _then) = _$CurrentUserCredentialDtoCopyWithImpl;
@useResult
$Res call({
 int id, String nickname,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'last_used_at') DateTime? lastUsedAt
});




}
/// @nodoc
class _$CurrentUserCredentialDtoCopyWithImpl<$Res>
    implements $CurrentUserCredentialDtoCopyWith<$Res> {
  _$CurrentUserCredentialDtoCopyWithImpl(this._self, this._then);

  final CurrentUserCredentialDto _self;
  final $Res Function(CurrentUserCredentialDto) _then;

/// Create a copy of CurrentUserCredentialDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nickname = null,Object? createdAt = null,Object? lastUsedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentUserCredentialDto].
extension CurrentUserCredentialDtoPatterns on CurrentUserCredentialDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentUserCredentialDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentUserCredentialDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentUserCredentialDto value)  $default,){
final _that = this;
switch (_that) {
case _CurrentUserCredentialDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentUserCredentialDto value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentUserCredentialDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nickname, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'last_used_at')  DateTime? lastUsedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentUserCredentialDto() when $default != null:
return $default(_that.id,_that.nickname,_that.createdAt,_that.lastUsedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nickname, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'last_used_at')  DateTime? lastUsedAt)  $default,) {final _that = this;
switch (_that) {
case _CurrentUserCredentialDto():
return $default(_that.id,_that.nickname,_that.createdAt,_that.lastUsedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nickname, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'last_used_at')  DateTime? lastUsedAt)?  $default,) {final _that = this;
switch (_that) {
case _CurrentUserCredentialDto() when $default != null:
return $default(_that.id,_that.nickname,_that.createdAt,_that.lastUsedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentUserCredentialDto implements CurrentUserCredentialDto {
  const _CurrentUserCredentialDto({required this.id, required this.nickname, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'last_used_at') this.lastUsedAt});
  factory _CurrentUserCredentialDto.fromJson(Map<String, dynamic> json) => _$CurrentUserCredentialDtoFromJson(json);

@override final  int id;
@override final  String nickname;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'last_used_at') final  DateTime? lastUsedAt;

/// Create a copy of CurrentUserCredentialDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentUserCredentialDtoCopyWith<_CurrentUserCredentialDto> get copyWith => __$CurrentUserCredentialDtoCopyWithImpl<_CurrentUserCredentialDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentUserCredentialDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentUserCredentialDto&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,createdAt,lastUsedAt);

@override
String toString() {
  return 'CurrentUserCredentialDto(id: $id, nickname: $nickname, createdAt: $createdAt, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class _$CurrentUserCredentialDtoCopyWith<$Res> implements $CurrentUserCredentialDtoCopyWith<$Res> {
  factory _$CurrentUserCredentialDtoCopyWith(_CurrentUserCredentialDto value, $Res Function(_CurrentUserCredentialDto) _then) = __$CurrentUserCredentialDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String nickname,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'last_used_at') DateTime? lastUsedAt
});




}
/// @nodoc
class __$CurrentUserCredentialDtoCopyWithImpl<$Res>
    implements _$CurrentUserCredentialDtoCopyWith<$Res> {
  __$CurrentUserCredentialDtoCopyWithImpl(this._self, this._then);

  final _CurrentUserCredentialDto _self;
  final $Res Function(_CurrentUserCredentialDto) _then;

/// Create a copy of CurrentUserCredentialDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nickname = null,Object? createdAt = null,Object? lastUsedAt = freezed,}) {
  return _then(_CurrentUserCredentialDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CurrentUserDto {

 CurrentUserProfileDto get user;@JsonKey(name: 'org_name') String get orgName; List<CurrentUserDeviceDto> get devices; List<CurrentUserCredentialDto> get credentials;
/// Create a copy of CurrentUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserDtoCopyWith<CurrentUserDto> get copyWith => _$CurrentUserDtoCopyWithImpl<CurrentUserDto>(this as CurrentUserDto, _$identity);

  /// Serializes this CurrentUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserDto&&(identical(other.user, user) || other.user == user)&&(identical(other.orgName, orgName) || other.orgName == orgName)&&const DeepCollectionEquality().equals(other.devices, devices)&&const DeepCollectionEquality().equals(other.credentials, credentials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,orgName,const DeepCollectionEquality().hash(devices),const DeepCollectionEquality().hash(credentials));

@override
String toString() {
  return 'CurrentUserDto(user: $user, orgName: $orgName, devices: $devices, credentials: $credentials)';
}


}

/// @nodoc
abstract mixin class $CurrentUserDtoCopyWith<$Res>  {
  factory $CurrentUserDtoCopyWith(CurrentUserDto value, $Res Function(CurrentUserDto) _then) = _$CurrentUserDtoCopyWithImpl;
@useResult
$Res call({
 CurrentUserProfileDto user,@JsonKey(name: 'org_name') String orgName, List<CurrentUserDeviceDto> devices, List<CurrentUserCredentialDto> credentials
});


$CurrentUserProfileDtoCopyWith<$Res> get user;

}
/// @nodoc
class _$CurrentUserDtoCopyWithImpl<$Res>
    implements $CurrentUserDtoCopyWith<$Res> {
  _$CurrentUserDtoCopyWithImpl(this._self, this._then);

  final CurrentUserDto _self;
  final $Res Function(CurrentUserDto) _then;

/// Create a copy of CurrentUserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? orgName = null,Object? devices = null,Object? credentials = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CurrentUserProfileDto,orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as List<CurrentUserDeviceDto>,credentials: null == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as List<CurrentUserCredentialDto>,
  ));
}
/// Create a copy of CurrentUserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentUserProfileDtoCopyWith<$Res> get user {
  
  return $CurrentUserProfileDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [CurrentUserDto].
extension CurrentUserDtoPatterns on CurrentUserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentUserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentUserDto value)  $default,){
final _that = this;
switch (_that) {
case _CurrentUserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentUserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CurrentUserProfileDto user, @JsonKey(name: 'org_name')  String orgName,  List<CurrentUserDeviceDto> devices,  List<CurrentUserCredentialDto> credentials)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentUserDto() when $default != null:
return $default(_that.user,_that.orgName,_that.devices,_that.credentials);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CurrentUserProfileDto user, @JsonKey(name: 'org_name')  String orgName,  List<CurrentUserDeviceDto> devices,  List<CurrentUserCredentialDto> credentials)  $default,) {final _that = this;
switch (_that) {
case _CurrentUserDto():
return $default(_that.user,_that.orgName,_that.devices,_that.credentials);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CurrentUserProfileDto user, @JsonKey(name: 'org_name')  String orgName,  List<CurrentUserDeviceDto> devices,  List<CurrentUserCredentialDto> credentials)?  $default,) {final _that = this;
switch (_that) {
case _CurrentUserDto() when $default != null:
return $default(_that.user,_that.orgName,_that.devices,_that.credentials);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentUserDto implements CurrentUserDto {
  const _CurrentUserDto({required this.user, @JsonKey(name: 'org_name') required this.orgName, final  List<CurrentUserDeviceDto> devices = const <CurrentUserDeviceDto>[], final  List<CurrentUserCredentialDto> credentials = const <CurrentUserCredentialDto>[]}): _devices = devices,_credentials = credentials;
  factory _CurrentUserDto.fromJson(Map<String, dynamic> json) => _$CurrentUserDtoFromJson(json);

@override final  CurrentUserProfileDto user;
@override@JsonKey(name: 'org_name') final  String orgName;
 final  List<CurrentUserDeviceDto> _devices;
@override@JsonKey() List<CurrentUserDeviceDto> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}

 final  List<CurrentUserCredentialDto> _credentials;
@override@JsonKey() List<CurrentUserCredentialDto> get credentials {
  if (_credentials is EqualUnmodifiableListView) return _credentials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_credentials);
}


/// Create a copy of CurrentUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentUserDtoCopyWith<_CurrentUserDto> get copyWith => __$CurrentUserDtoCopyWithImpl<_CurrentUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentUserDto&&(identical(other.user, user) || other.user == user)&&(identical(other.orgName, orgName) || other.orgName == orgName)&&const DeepCollectionEquality().equals(other._devices, _devices)&&const DeepCollectionEquality().equals(other._credentials, _credentials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,orgName,const DeepCollectionEquality().hash(_devices),const DeepCollectionEquality().hash(_credentials));

@override
String toString() {
  return 'CurrentUserDto(user: $user, orgName: $orgName, devices: $devices, credentials: $credentials)';
}


}

/// @nodoc
abstract mixin class _$CurrentUserDtoCopyWith<$Res> implements $CurrentUserDtoCopyWith<$Res> {
  factory _$CurrentUserDtoCopyWith(_CurrentUserDto value, $Res Function(_CurrentUserDto) _then) = __$CurrentUserDtoCopyWithImpl;
@override @useResult
$Res call({
 CurrentUserProfileDto user,@JsonKey(name: 'org_name') String orgName, List<CurrentUserDeviceDto> devices, List<CurrentUserCredentialDto> credentials
});


@override $CurrentUserProfileDtoCopyWith<$Res> get user;

}
/// @nodoc
class __$CurrentUserDtoCopyWithImpl<$Res>
    implements _$CurrentUserDtoCopyWith<$Res> {
  __$CurrentUserDtoCopyWithImpl(this._self, this._then);

  final _CurrentUserDto _self;
  final $Res Function(_CurrentUserDto) _then;

/// Create a copy of CurrentUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? orgName = null,Object? devices = null,Object? credentials = null,}) {
  return _then(_CurrentUserDto(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as CurrentUserProfileDto,orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<CurrentUserDeviceDto>,credentials: null == credentials ? _self._credentials : credentials // ignore: cast_nullable_to_non_nullable
as List<CurrentUserCredentialDto>,
  ));
}

/// Create a copy of CurrentUserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentUserProfileDtoCopyWith<$Res> get user {
  
  return $CurrentUserProfileDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
