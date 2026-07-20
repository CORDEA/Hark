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
mixin _$OrganizationRowViewState {

 String get serverUrl; String get orgName; String get initials;
/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationRowViewStateCopyWith<OrganizationRowViewState> get copyWith => _$OrganizationRowViewStateCopyWithImpl<OrganizationRowViewState>(this as OrganizationRowViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationRowViewState&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.initials, initials) || other.initials == initials));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,orgName,initials);

@override
String toString() {
  return 'OrganizationRowViewState(serverUrl: $serverUrl, orgName: $orgName, initials: $initials)';
}


}

/// @nodoc
abstract mixin class $OrganizationRowViewStateCopyWith<$Res>  {
  factory $OrganizationRowViewStateCopyWith(OrganizationRowViewState value, $Res Function(OrganizationRowViewState) _then) = _$OrganizationRowViewStateCopyWithImpl;
@useResult
$Res call({
 String serverUrl, String orgName, String initials
});




}
/// @nodoc
class _$OrganizationRowViewStateCopyWithImpl<$Res>
    implements $OrganizationRowViewStateCopyWith<$Res> {
  _$OrganizationRowViewStateCopyWithImpl(this._self, this._then);

  final OrganizationRowViewState _self;
  final $Res Function(OrganizationRowViewState) _then;

/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverUrl = null,Object? orgName = null,Object? initials = null,}) {
  return _then(_self.copyWith(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,initials: null == initials ? _self.initials : initials // ignore: cast_nullable_to_non_nullable
as String,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverUrl,  String orgName,  String initials)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationRowViewState() when $default != null:
return $default(_that.serverUrl,_that.orgName,_that.initials);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverUrl,  String orgName,  String initials)  $default,) {final _that = this;
switch (_that) {
case _OrganizationRowViewState():
return $default(_that.serverUrl,_that.orgName,_that.initials);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverUrl,  String orgName,  String initials)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationRowViewState() when $default != null:
return $default(_that.serverUrl,_that.orgName,_that.initials);case _:
  return null;

}
}

}

/// @nodoc


class _OrganizationRowViewState implements OrganizationRowViewState {
  const _OrganizationRowViewState({required this.serverUrl, required this.orgName, required this.initials});
  

@override final  String serverUrl;
@override final  String orgName;
@override final  String initials;

/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationRowViewStateCopyWith<_OrganizationRowViewState> get copyWith => __$OrganizationRowViewStateCopyWithImpl<_OrganizationRowViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationRowViewState&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.initials, initials) || other.initials == initials));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,orgName,initials);

@override
String toString() {
  return 'OrganizationRowViewState(serverUrl: $serverUrl, orgName: $orgName, initials: $initials)';
}


}

/// @nodoc
abstract mixin class _$OrganizationRowViewStateCopyWith<$Res> implements $OrganizationRowViewStateCopyWith<$Res> {
  factory _$OrganizationRowViewStateCopyWith(_OrganizationRowViewState value, $Res Function(_OrganizationRowViewState) _then) = __$OrganizationRowViewStateCopyWithImpl;
@override @useResult
$Res call({
 String serverUrl, String orgName, String initials
});




}
/// @nodoc
class __$OrganizationRowViewStateCopyWithImpl<$Res>
    implements _$OrganizationRowViewStateCopyWith<$Res> {
  __$OrganizationRowViewStateCopyWithImpl(this._self, this._then);

  final _OrganizationRowViewState _self;
  final $Res Function(_OrganizationRowViewState) _then;

/// Create a copy of OrganizationRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverUrl = null,Object? orgName = null,Object? initials = null,}) {
  return _then(_OrganizationRowViewState(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,initials: null == initials ? _self.initials : initials // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
