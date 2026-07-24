// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrgProfile {

@JsonKey(name: 'server_url') String get serverUrl;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'auth_token') String get authToken;
/// Create a copy of OrgProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgProfileCopyWith<OrgProfile> get copyWith => _$OrgProfileCopyWithImpl<OrgProfile>(this as OrgProfile, _$identity);

  /// Serializes this OrgProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgProfile&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.authToken, authToken) || other.authToken == authToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverUrl,userId,authToken);

@override
String toString() {
  return 'OrgProfile(serverUrl: $serverUrl, userId: $userId, authToken: $authToken)';
}


}

/// @nodoc
abstract mixin class $OrgProfileCopyWith<$Res>  {
  factory $OrgProfileCopyWith(OrgProfile value, $Res Function(OrgProfile) _then) = _$OrgProfileCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'server_url') String serverUrl,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'auth_token') String authToken
});




}
/// @nodoc
class _$OrgProfileCopyWithImpl<$Res>
    implements $OrgProfileCopyWith<$Res> {
  _$OrgProfileCopyWithImpl(this._self, this._then);

  final OrgProfile _self;
  final $Res Function(OrgProfile) _then;

/// Create a copy of OrgProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverUrl = null,Object? userId = null,Object? authToken = null,}) {
  return _then(_self.copyWith(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrgProfile].
extension OrgProfilePatterns on OrgProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrgProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrgProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrgProfile value)  $default,){
final _that = this;
switch (_that) {
case _OrgProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrgProfile value)?  $default,){
final _that = this;
switch (_that) {
case _OrgProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'server_url')  String serverUrl, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'auth_token')  String authToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrgProfile() when $default != null:
return $default(_that.serverUrl,_that.userId,_that.authToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'server_url')  String serverUrl, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'auth_token')  String authToken)  $default,) {final _that = this;
switch (_that) {
case _OrgProfile():
return $default(_that.serverUrl,_that.userId,_that.authToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'server_url')  String serverUrl, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'auth_token')  String authToken)?  $default,) {final _that = this;
switch (_that) {
case _OrgProfile() when $default != null:
return $default(_that.serverUrl,_that.userId,_that.authToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrgProfile extends OrgProfile {
  const _OrgProfile({@JsonKey(name: 'server_url') required this.serverUrl, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'auth_token') required this.authToken}): super._();
  factory _OrgProfile.fromJson(Map<String, dynamic> json) => _$OrgProfileFromJson(json);

@override@JsonKey(name: 'server_url') final  String serverUrl;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'auth_token') final  String authToken;

/// Create a copy of OrgProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrgProfileCopyWith<_OrgProfile> get copyWith => __$OrgProfileCopyWithImpl<_OrgProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrgProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrgProfile&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.authToken, authToken) || other.authToken == authToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverUrl,userId,authToken);

@override
String toString() {
  return 'OrgProfile(serverUrl: $serverUrl, userId: $userId, authToken: $authToken)';
}


}

/// @nodoc
abstract mixin class _$OrgProfileCopyWith<$Res> implements $OrgProfileCopyWith<$Res> {
  factory _$OrgProfileCopyWith(_OrgProfile value, $Res Function(_OrgProfile) _then) = __$OrgProfileCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'server_url') String serverUrl,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'auth_token') String authToken
});




}
/// @nodoc
class __$OrgProfileCopyWithImpl<$Res>
    implements _$OrgProfileCopyWith<$Res> {
  __$OrgProfileCopyWithImpl(this._self, this._then);

  final _OrgProfile _self;
  final $Res Function(_OrgProfile) _then;

/// Create a copy of OrgProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverUrl = null,Object? userId = null,Object? authToken = null,}) {
  return _then(_OrgProfile(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,authToken: null == authToken ? _self.authToken : authToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
