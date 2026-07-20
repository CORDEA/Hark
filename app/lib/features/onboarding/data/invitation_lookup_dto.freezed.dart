// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_lookup_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitationLookupDto {

 String get code;@JsonKey(name: 'display_name') String get displayName; String get kind;@JsonKey(name: 'expires_at') DateTime get expiresAt;@JsonKey(name: 'org_name') String get orgName;@JsonKey(name: 'server_url') String get serverUrl;
/// Create a copy of InvitationLookupDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvitationLookupDtoCopyWith<InvitationLookupDto> get copyWith => _$InvitationLookupDtoCopyWithImpl<InvitationLookupDto>(this as InvitationLookupDto, _$identity);

  /// Serializes this InvitationLookupDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvitationLookupDto&&(identical(other.code, code) || other.code == code)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,displayName,kind,expiresAt,orgName,serverUrl);

@override
String toString() {
  return 'InvitationLookupDto(code: $code, displayName: $displayName, kind: $kind, expiresAt: $expiresAt, orgName: $orgName, serverUrl: $serverUrl)';
}


}

/// @nodoc
abstract mixin class $InvitationLookupDtoCopyWith<$Res>  {
  factory $InvitationLookupDtoCopyWith(InvitationLookupDto value, $Res Function(InvitationLookupDto) _then) = _$InvitationLookupDtoCopyWithImpl;
@useResult
$Res call({
 String code,@JsonKey(name: 'display_name') String displayName, String kind,@JsonKey(name: 'expires_at') DateTime expiresAt,@JsonKey(name: 'org_name') String orgName,@JsonKey(name: 'server_url') String serverUrl
});




}
/// @nodoc
class _$InvitationLookupDtoCopyWithImpl<$Res>
    implements $InvitationLookupDtoCopyWith<$Res> {
  _$InvitationLookupDtoCopyWithImpl(this._self, this._then);

  final InvitationLookupDto _self;
  final $Res Function(InvitationLookupDto) _then;

/// Create a copy of InvitationLookupDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? displayName = null,Object? kind = null,Object? expiresAt = null,Object? orgName = null,Object? serverUrl = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InvitationLookupDto].
extension InvitationLookupDtoPatterns on InvitationLookupDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvitationLookupDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvitationLookupDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvitationLookupDto value)  $default,){
final _that = this;
switch (_that) {
case _InvitationLookupDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvitationLookupDto value)?  $default,){
final _that = this;
switch (_that) {
case _InvitationLookupDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code, @JsonKey(name: 'display_name')  String displayName,  String kind, @JsonKey(name: 'expires_at')  DateTime expiresAt, @JsonKey(name: 'org_name')  String orgName, @JsonKey(name: 'server_url')  String serverUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvitationLookupDto() when $default != null:
return $default(_that.code,_that.displayName,_that.kind,_that.expiresAt,_that.orgName,_that.serverUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code, @JsonKey(name: 'display_name')  String displayName,  String kind, @JsonKey(name: 'expires_at')  DateTime expiresAt, @JsonKey(name: 'org_name')  String orgName, @JsonKey(name: 'server_url')  String serverUrl)  $default,) {final _that = this;
switch (_that) {
case _InvitationLookupDto():
return $default(_that.code,_that.displayName,_that.kind,_that.expiresAt,_that.orgName,_that.serverUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code, @JsonKey(name: 'display_name')  String displayName,  String kind, @JsonKey(name: 'expires_at')  DateTime expiresAt, @JsonKey(name: 'org_name')  String orgName, @JsonKey(name: 'server_url')  String serverUrl)?  $default,) {final _that = this;
switch (_that) {
case _InvitationLookupDto() when $default != null:
return $default(_that.code,_that.displayName,_that.kind,_that.expiresAt,_that.orgName,_that.serverUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvitationLookupDto implements InvitationLookupDto {
  const _InvitationLookupDto({required this.code, @JsonKey(name: 'display_name') this.displayName = '', required this.kind, @JsonKey(name: 'expires_at') required this.expiresAt, @JsonKey(name: 'org_name') required this.orgName, @JsonKey(name: 'server_url') required this.serverUrl});
  factory _InvitationLookupDto.fromJson(Map<String, dynamic> json) => _$InvitationLookupDtoFromJson(json);

@override final  String code;
@override@JsonKey(name: 'display_name') final  String displayName;
@override final  String kind;
@override@JsonKey(name: 'expires_at') final  DateTime expiresAt;
@override@JsonKey(name: 'org_name') final  String orgName;
@override@JsonKey(name: 'server_url') final  String serverUrl;

/// Create a copy of InvitationLookupDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvitationLookupDtoCopyWith<_InvitationLookupDto> get copyWith => __$InvitationLookupDtoCopyWithImpl<_InvitationLookupDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvitationLookupDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvitationLookupDto&&(identical(other.code, code) || other.code == code)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,displayName,kind,expiresAt,orgName,serverUrl);

@override
String toString() {
  return 'InvitationLookupDto(code: $code, displayName: $displayName, kind: $kind, expiresAt: $expiresAt, orgName: $orgName, serverUrl: $serverUrl)';
}


}

/// @nodoc
abstract mixin class _$InvitationLookupDtoCopyWith<$Res> implements $InvitationLookupDtoCopyWith<$Res> {
  factory _$InvitationLookupDtoCopyWith(_InvitationLookupDto value, $Res Function(_InvitationLookupDto) _then) = __$InvitationLookupDtoCopyWithImpl;
@override @useResult
$Res call({
 String code,@JsonKey(name: 'display_name') String displayName, String kind,@JsonKey(name: 'expires_at') DateTime expiresAt,@JsonKey(name: 'org_name') String orgName,@JsonKey(name: 'server_url') String serverUrl
});




}
/// @nodoc
class __$InvitationLookupDtoCopyWithImpl<$Res>
    implements _$InvitationLookupDtoCopyWith<$Res> {
  __$InvitationLookupDtoCopyWithImpl(this._self, this._then);

  final _InvitationLookupDto _self;
  final $Res Function(_InvitationLookupDto) _then;

/// Create a copy of InvitationLookupDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? displayName = null,Object? kind = null,Object? expiresAt = null,Object? orgName = null,Object? serverUrl = null,}) {
  return _then(_InvitationLookupDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
