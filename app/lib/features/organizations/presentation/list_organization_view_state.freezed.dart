// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_organization_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrgRowStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgRowStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrgRowStatus()';
}


}

/// @nodoc
class $OrgRowStatusCopyWith<$Res>  {
$OrgRowStatusCopyWith(OrgRowStatus _, $Res Function(OrgRowStatus) __);
}


/// Adds pattern-matching-related methods to [OrgRowStatus].
extension OrgRowStatusPatterns on OrgRowStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrgRowStatusLoading value)?  loading,TResult Function( OrgRowStatusOk value)?  ok,TResult Function( OrgRowStatusReconnect value)?  reconnect,TResult Function( OrgRowStatusOffline value)?  offline,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrgRowStatusLoading() when loading != null:
return loading(_that);case OrgRowStatusOk() when ok != null:
return ok(_that);case OrgRowStatusReconnect() when reconnect != null:
return reconnect(_that);case OrgRowStatusOffline() when offline != null:
return offline(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrgRowStatusLoading value)  loading,required TResult Function( OrgRowStatusOk value)  ok,required TResult Function( OrgRowStatusReconnect value)  reconnect,required TResult Function( OrgRowStatusOffline value)  offline,}){
final _that = this;
switch (_that) {
case OrgRowStatusLoading():
return loading(_that);case OrgRowStatusOk():
return ok(_that);case OrgRowStatusReconnect():
return reconnect(_that);case OrgRowStatusOffline():
return offline(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrgRowStatusLoading value)?  loading,TResult? Function( OrgRowStatusOk value)?  ok,TResult? Function( OrgRowStatusReconnect value)?  reconnect,TResult? Function( OrgRowStatusOffline value)?  offline,}){
final _that = this;
switch (_that) {
case OrgRowStatusLoading() when loading != null:
return loading(_that);case OrgRowStatusOk() when ok != null:
return ok(_that);case OrgRowStatusReconnect() when reconnect != null:
return reconnect(_that);case OrgRowStatusOffline() when offline != null:
return offline(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String orgName,  int devicesCount,  int credentialsCount)?  ok,TResult Function()?  reconnect,TResult Function()?  offline,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrgRowStatusLoading() when loading != null:
return loading();case OrgRowStatusOk() when ok != null:
return ok(_that.orgName,_that.devicesCount,_that.credentialsCount);case OrgRowStatusReconnect() when reconnect != null:
return reconnect();case OrgRowStatusOffline() when offline != null:
return offline();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String orgName,  int devicesCount,  int credentialsCount)  ok,required TResult Function()  reconnect,required TResult Function()  offline,}) {final _that = this;
switch (_that) {
case OrgRowStatusLoading():
return loading();case OrgRowStatusOk():
return ok(_that.orgName,_that.devicesCount,_that.credentialsCount);case OrgRowStatusReconnect():
return reconnect();case OrgRowStatusOffline():
return offline();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String orgName,  int devicesCount,  int credentialsCount)?  ok,TResult? Function()?  reconnect,TResult? Function()?  offline,}) {final _that = this;
switch (_that) {
case OrgRowStatusLoading() when loading != null:
return loading();case OrgRowStatusOk() when ok != null:
return ok(_that.orgName,_that.devicesCount,_that.credentialsCount);case OrgRowStatusReconnect() when reconnect != null:
return reconnect();case OrgRowStatusOffline() when offline != null:
return offline();case _:
  return null;

}
}

}

/// @nodoc


class OrgRowStatusLoading implements OrgRowStatus {
  const OrgRowStatusLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgRowStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrgRowStatus.loading()';
}


}




/// @nodoc


class OrgRowStatusOk implements OrgRowStatus {
  const OrgRowStatusOk({required this.orgName, required this.devicesCount, required this.credentialsCount});
  

 final  String orgName;
 final  int devicesCount;
 final  int credentialsCount;

/// Create a copy of OrgRowStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgRowStatusOkCopyWith<OrgRowStatusOk> get copyWith => _$OrgRowStatusOkCopyWithImpl<OrgRowStatusOk>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgRowStatusOk&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.devicesCount, devicesCount) || other.devicesCount == devicesCount)&&(identical(other.credentialsCount, credentialsCount) || other.credentialsCount == credentialsCount));
}


@override
int get hashCode => Object.hash(runtimeType,orgName,devicesCount,credentialsCount);

@override
String toString() {
  return 'OrgRowStatus.ok(orgName: $orgName, devicesCount: $devicesCount, credentialsCount: $credentialsCount)';
}


}

/// @nodoc
abstract mixin class $OrgRowStatusOkCopyWith<$Res> implements $OrgRowStatusCopyWith<$Res> {
  factory $OrgRowStatusOkCopyWith(OrgRowStatusOk value, $Res Function(OrgRowStatusOk) _then) = _$OrgRowStatusOkCopyWithImpl;
@useResult
$Res call({
 String orgName, int devicesCount, int credentialsCount
});




}
/// @nodoc
class _$OrgRowStatusOkCopyWithImpl<$Res>
    implements $OrgRowStatusOkCopyWith<$Res> {
  _$OrgRowStatusOkCopyWithImpl(this._self, this._then);

  final OrgRowStatusOk _self;
  final $Res Function(OrgRowStatusOk) _then;

/// Create a copy of OrgRowStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orgName = null,Object? devicesCount = null,Object? credentialsCount = null,}) {
  return _then(OrgRowStatusOk(
orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,devicesCount: null == devicesCount ? _self.devicesCount : devicesCount // ignore: cast_nullable_to_non_nullable
as int,credentialsCount: null == credentialsCount ? _self.credentialsCount : credentialsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OrgRowStatusReconnect implements OrgRowStatus {
  const OrgRowStatusReconnect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgRowStatusReconnect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrgRowStatus.reconnect()';
}


}




/// @nodoc


class OrgRowStatusOffline implements OrgRowStatus {
  const OrgRowStatusOffline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgRowStatusOffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrgRowStatus.offline()';
}


}




/// @nodoc
mixin _$OrganizationRowViewState {

 String get serverUrl; String get fallbackName; String get initials; OrgRowStatus get status;
/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationRowViewStateCopyWith<OrganizationRowViewState> get copyWith => _$OrganizationRowViewStateCopyWithImpl<OrganizationRowViewState>(this as OrganizationRowViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationRowViewState&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.fallbackName, fallbackName) || other.fallbackName == fallbackName)&&(identical(other.initials, initials) || other.initials == initials)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,fallbackName,initials,status);

@override
String toString() {
  return 'OrganizationRowViewState(serverUrl: $serverUrl, fallbackName: $fallbackName, initials: $initials, status: $status)';
}


}

/// @nodoc
abstract mixin class $OrganizationRowViewStateCopyWith<$Res>  {
  factory $OrganizationRowViewStateCopyWith(OrganizationRowViewState value, $Res Function(OrganizationRowViewState) _then) = _$OrganizationRowViewStateCopyWithImpl;
@useResult
$Res call({
 String serverUrl, String fallbackName, String initials, OrgRowStatus status
});


$OrgRowStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$OrganizationRowViewStateCopyWithImpl<$Res>
    implements $OrganizationRowViewStateCopyWith<$Res> {
  _$OrganizationRowViewStateCopyWithImpl(this._self, this._then);

  final OrganizationRowViewState _self;
  final $Res Function(OrganizationRowViewState) _then;

/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverUrl = null,Object? fallbackName = null,Object? initials = null,Object? status = null,}) {
  return _then(_self.copyWith(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,fallbackName: null == fallbackName ? _self.fallbackName : fallbackName // ignore: cast_nullable_to_non_nullable
as String,initials: null == initials ? _self.initials : initials // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrgRowStatus,
  ));
}
/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrgRowStatusCopyWith<$Res> get status {
  
  return $OrgRowStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrganizationRowViewState].
extension OrganizationRowViewStatePatterns on OrganizationRowViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganizationRowViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganizationRowViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganizationRowViewState value)  $default,){
final _that = this;
switch (_that) {
case _OrganizationRowViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganizationRowViewState value)?  $default,){
final _that = this;
switch (_that) {
case _OrganizationRowViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverUrl,  String fallbackName,  String initials,  OrgRowStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationRowViewState() when $default != null:
return $default(_that.serverUrl,_that.fallbackName,_that.initials,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverUrl,  String fallbackName,  String initials,  OrgRowStatus status)  $default,) {final _that = this;
switch (_that) {
case _OrganizationRowViewState():
return $default(_that.serverUrl,_that.fallbackName,_that.initials,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverUrl,  String fallbackName,  String initials,  OrgRowStatus status)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationRowViewState() when $default != null:
return $default(_that.serverUrl,_that.fallbackName,_that.initials,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _OrganizationRowViewState implements OrganizationRowViewState {
  const _OrganizationRowViewState({required this.serverUrl, required this.fallbackName, required this.initials, required this.status});
  

@override final  String serverUrl;
@override final  String fallbackName;
@override final  String initials;
@override final  OrgRowStatus status;

/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationRowViewStateCopyWith<_OrganizationRowViewState> get copyWith => __$OrganizationRowViewStateCopyWithImpl<_OrganizationRowViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationRowViewState&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.fallbackName, fallbackName) || other.fallbackName == fallbackName)&&(identical(other.initials, initials) || other.initials == initials)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,fallbackName,initials,status);

@override
String toString() {
  return 'OrganizationRowViewState(serverUrl: $serverUrl, fallbackName: $fallbackName, initials: $initials, status: $status)';
}


}

/// @nodoc
abstract mixin class _$OrganizationRowViewStateCopyWith<$Res> implements $OrganizationRowViewStateCopyWith<$Res> {
  factory _$OrganizationRowViewStateCopyWith(_OrganizationRowViewState value, $Res Function(_OrganizationRowViewState) _then) = __$OrganizationRowViewStateCopyWithImpl;
@override @useResult
$Res call({
 String serverUrl, String fallbackName, String initials, OrgRowStatus status
});


@override $OrgRowStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$OrganizationRowViewStateCopyWithImpl<$Res>
    implements _$OrganizationRowViewStateCopyWith<$Res> {
  __$OrganizationRowViewStateCopyWithImpl(this._self, this._then);

  final _OrganizationRowViewState _self;
  final $Res Function(_OrganizationRowViewState) _then;

/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverUrl = null,Object? fallbackName = null,Object? initials = null,Object? status = null,}) {
  return _then(_OrganizationRowViewState(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,fallbackName: null == fallbackName ? _self.fallbackName : fallbackName // ignore: cast_nullable_to_non_nullable
as String,initials: null == initials ? _self.initials : initials // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrgRowStatus,
  ));
}

/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrgRowStatusCopyWith<$Res> get status {
  
  return $OrgRowStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
