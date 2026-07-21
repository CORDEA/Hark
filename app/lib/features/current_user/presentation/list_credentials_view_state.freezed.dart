// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_credentials_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CredentialRowViewState {

 int get id; String get nickname; DateTime get createdAt; DateTime? get lastUsedAt;
/// Create a copy of CredentialRowViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CredentialRowViewStateCopyWith<CredentialRowViewState> get copyWith => _$CredentialRowViewStateCopyWithImpl<CredentialRowViewState>(this as CredentialRowViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CredentialRowViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,nickname,createdAt,lastUsedAt);

@override
String toString() {
  return 'CredentialRowViewState(id: $id, nickname: $nickname, createdAt: $createdAt, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class $CredentialRowViewStateCopyWith<$Res>  {
  factory $CredentialRowViewStateCopyWith(CredentialRowViewState value, $Res Function(CredentialRowViewState) _then) = _$CredentialRowViewStateCopyWithImpl;
@useResult
$Res call({
 int id, String nickname, DateTime createdAt, DateTime? lastUsedAt
});




}
/// @nodoc
class _$CredentialRowViewStateCopyWithImpl<$Res>
    implements $CredentialRowViewStateCopyWith<$Res> {
  _$CredentialRowViewStateCopyWithImpl(this._self, this._then);

  final CredentialRowViewState _self;
  final $Res Function(CredentialRowViewState) _then;

/// Create a copy of CredentialRowViewState
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


/// Adds pattern-matching-related methods to [CredentialRowViewState].
extension CredentialRowViewStatePatterns on CredentialRowViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CredentialRowViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CredentialRowViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CredentialRowViewState value)  $default,){
final _that = this;
switch (_that) {
case _CredentialRowViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CredentialRowViewState value)?  $default,){
final _that = this;
switch (_that) {
case _CredentialRowViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nickname,  DateTime createdAt,  DateTime? lastUsedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CredentialRowViewState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nickname,  DateTime createdAt,  DateTime? lastUsedAt)  $default,) {final _that = this;
switch (_that) {
case _CredentialRowViewState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nickname,  DateTime createdAt,  DateTime? lastUsedAt)?  $default,) {final _that = this;
switch (_that) {
case _CredentialRowViewState() when $default != null:
return $default(_that.id,_that.nickname,_that.createdAt,_that.lastUsedAt);case _:
  return null;

}
}

}

/// @nodoc


class _CredentialRowViewState implements CredentialRowViewState {
  const _CredentialRowViewState({required this.id, required this.nickname, required this.createdAt, this.lastUsedAt});
  

@override final  int id;
@override final  String nickname;
@override final  DateTime createdAt;
@override final  DateTime? lastUsedAt;

/// Create a copy of CredentialRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CredentialRowViewStateCopyWith<_CredentialRowViewState> get copyWith => __$CredentialRowViewStateCopyWithImpl<_CredentialRowViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CredentialRowViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,nickname,createdAt,lastUsedAt);

@override
String toString() {
  return 'CredentialRowViewState(id: $id, nickname: $nickname, createdAt: $createdAt, lastUsedAt: $lastUsedAt)';
}


}

/// @nodoc
abstract mixin class _$CredentialRowViewStateCopyWith<$Res> implements $CredentialRowViewStateCopyWith<$Res> {
  factory _$CredentialRowViewStateCopyWith(_CredentialRowViewState value, $Res Function(_CredentialRowViewState) _then) = __$CredentialRowViewStateCopyWithImpl;
@override @useResult
$Res call({
 int id, String nickname, DateTime createdAt, DateTime? lastUsedAt
});




}
/// @nodoc
class __$CredentialRowViewStateCopyWithImpl<$Res>
    implements _$CredentialRowViewStateCopyWith<$Res> {
  __$CredentialRowViewStateCopyWithImpl(this._self, this._then);

  final _CredentialRowViewState _self;
  final $Res Function(_CredentialRowViewState) _then;

/// Create a copy of CredentialRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nickname = null,Object? createdAt = null,Object? lastUsedAt = freezed,}) {
  return _then(_CredentialRowViewState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$DeviceRowViewState {

 String get id; String get deviceName; String get locale; DateTime get createdAt;
/// Create a copy of DeviceRowViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceRowViewStateCopyWith<DeviceRowViewState> get copyWith => _$DeviceRowViewStateCopyWithImpl<DeviceRowViewState>(this as DeviceRowViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceRowViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,deviceName,locale,createdAt);

@override
String toString() {
  return 'DeviceRowViewState(id: $id, deviceName: $deviceName, locale: $locale, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DeviceRowViewStateCopyWith<$Res>  {
  factory $DeviceRowViewStateCopyWith(DeviceRowViewState value, $Res Function(DeviceRowViewState) _then) = _$DeviceRowViewStateCopyWithImpl;
@useResult
$Res call({
 String id, String deviceName, String locale, DateTime createdAt
});




}
/// @nodoc
class _$DeviceRowViewStateCopyWithImpl<$Res>
    implements $DeviceRowViewStateCopyWith<$Res> {
  _$DeviceRowViewStateCopyWithImpl(this._self, this._then);

  final DeviceRowViewState _self;
  final $Res Function(DeviceRowViewState) _then;

/// Create a copy of DeviceRowViewState
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


/// Adds pattern-matching-related methods to [DeviceRowViewState].
extension DeviceRowViewStatePatterns on DeviceRowViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceRowViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceRowViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceRowViewState value)  $default,){
final _that = this;
switch (_that) {
case _DeviceRowViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceRowViewState value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceRowViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String deviceName,  String locale,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceRowViewState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String deviceName,  String locale,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _DeviceRowViewState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String deviceName,  String locale,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _DeviceRowViewState() when $default != null:
return $default(_that.id,_that.deviceName,_that.locale,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceRowViewState implements DeviceRowViewState {
  const _DeviceRowViewState({required this.id, required this.deviceName, required this.locale, required this.createdAt});
  

@override final  String id;
@override final  String deviceName;
@override final  String locale;
@override final  DateTime createdAt;

/// Create a copy of DeviceRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceRowViewStateCopyWith<_DeviceRowViewState> get copyWith => __$DeviceRowViewStateCopyWithImpl<_DeviceRowViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceRowViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,deviceName,locale,createdAt);

@override
String toString() {
  return 'DeviceRowViewState(id: $id, deviceName: $deviceName, locale: $locale, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceRowViewStateCopyWith<$Res> implements $DeviceRowViewStateCopyWith<$Res> {
  factory _$DeviceRowViewStateCopyWith(_DeviceRowViewState value, $Res Function(_DeviceRowViewState) _then) = __$DeviceRowViewStateCopyWithImpl;
@override @useResult
$Res call({
 String id, String deviceName, String locale, DateTime createdAt
});




}
/// @nodoc
class __$DeviceRowViewStateCopyWithImpl<$Res>
    implements _$DeviceRowViewStateCopyWith<$Res> {
  __$DeviceRowViewStateCopyWithImpl(this._self, this._then);

  final _DeviceRowViewState _self;
  final $Res Function(_DeviceRowViewState) _then;

/// Create a copy of DeviceRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deviceName = null,Object? locale = null,Object? createdAt = null,}) {
  return _then(_DeviceRowViewState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$ListCredentialsViewState {

 String get orgName; String get displayName; List<CredentialRowViewState> get credentials; List<DeviceRowViewState> get devices;
/// Create a copy of ListCredentialsViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListCredentialsViewStateCopyWith<ListCredentialsViewState> get copyWith => _$ListCredentialsViewStateCopyWithImpl<ListCredentialsViewState>(this as ListCredentialsViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListCredentialsViewState&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&const DeepCollectionEquality().equals(other.credentials, credentials)&&const DeepCollectionEquality().equals(other.devices, devices));
}


@override
int get hashCode => Object.hash(runtimeType,orgName,displayName,const DeepCollectionEquality().hash(credentials),const DeepCollectionEquality().hash(devices));

@override
String toString() {
  return 'ListCredentialsViewState(orgName: $orgName, displayName: $displayName, credentials: $credentials, devices: $devices)';
}


}

/// @nodoc
abstract mixin class $ListCredentialsViewStateCopyWith<$Res>  {
  factory $ListCredentialsViewStateCopyWith(ListCredentialsViewState value, $Res Function(ListCredentialsViewState) _then) = _$ListCredentialsViewStateCopyWithImpl;
@useResult
$Res call({
 String orgName, String displayName, List<CredentialRowViewState> credentials, List<DeviceRowViewState> devices
});




}
/// @nodoc
class _$ListCredentialsViewStateCopyWithImpl<$Res>
    implements $ListCredentialsViewStateCopyWith<$Res> {
  _$ListCredentialsViewStateCopyWithImpl(this._self, this._then);

  final ListCredentialsViewState _self;
  final $Res Function(ListCredentialsViewState) _then;

/// Create a copy of ListCredentialsViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgName = null,Object? displayName = null,Object? credentials = null,Object? devices = null,}) {
  return _then(_self.copyWith(
orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,credentials: null == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as List<CredentialRowViewState>,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceRowViewState>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListCredentialsViewState].
extension ListCredentialsViewStatePatterns on ListCredentialsViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListCredentialsViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListCredentialsViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListCredentialsViewState value)  $default,){
final _that = this;
switch (_that) {
case _ListCredentialsViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListCredentialsViewState value)?  $default,){
final _that = this;
switch (_that) {
case _ListCredentialsViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orgName,  String displayName,  List<CredentialRowViewState> credentials,  List<DeviceRowViewState> devices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListCredentialsViewState() when $default != null:
return $default(_that.orgName,_that.displayName,_that.credentials,_that.devices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orgName,  String displayName,  List<CredentialRowViewState> credentials,  List<DeviceRowViewState> devices)  $default,) {final _that = this;
switch (_that) {
case _ListCredentialsViewState():
return $default(_that.orgName,_that.displayName,_that.credentials,_that.devices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orgName,  String displayName,  List<CredentialRowViewState> credentials,  List<DeviceRowViewState> devices)?  $default,) {final _that = this;
switch (_that) {
case _ListCredentialsViewState() when $default != null:
return $default(_that.orgName,_that.displayName,_that.credentials,_that.devices);case _:
  return null;

}
}

}

/// @nodoc


class _ListCredentialsViewState implements ListCredentialsViewState {
  const _ListCredentialsViewState({required this.orgName, required this.displayName, required final  List<CredentialRowViewState> credentials, required final  List<DeviceRowViewState> devices}): _credentials = credentials,_devices = devices;
  

@override final  String orgName;
@override final  String displayName;
 final  List<CredentialRowViewState> _credentials;
@override List<CredentialRowViewState> get credentials {
  if (_credentials is EqualUnmodifiableListView) return _credentials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_credentials);
}

 final  List<DeviceRowViewState> _devices;
@override List<DeviceRowViewState> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}


/// Create a copy of ListCredentialsViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListCredentialsViewStateCopyWith<_ListCredentialsViewState> get copyWith => __$ListCredentialsViewStateCopyWithImpl<_ListCredentialsViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListCredentialsViewState&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&const DeepCollectionEquality().equals(other._credentials, _credentials)&&const DeepCollectionEquality().equals(other._devices, _devices));
}


@override
int get hashCode => Object.hash(runtimeType,orgName,displayName,const DeepCollectionEquality().hash(_credentials),const DeepCollectionEquality().hash(_devices));

@override
String toString() {
  return 'ListCredentialsViewState(orgName: $orgName, displayName: $displayName, credentials: $credentials, devices: $devices)';
}


}

/// @nodoc
abstract mixin class _$ListCredentialsViewStateCopyWith<$Res> implements $ListCredentialsViewStateCopyWith<$Res> {
  factory _$ListCredentialsViewStateCopyWith(_ListCredentialsViewState value, $Res Function(_ListCredentialsViewState) _then) = __$ListCredentialsViewStateCopyWithImpl;
@override @useResult
$Res call({
 String orgName, String displayName, List<CredentialRowViewState> credentials, List<DeviceRowViewState> devices
});




}
/// @nodoc
class __$ListCredentialsViewStateCopyWithImpl<$Res>
    implements _$ListCredentialsViewStateCopyWith<$Res> {
  __$ListCredentialsViewStateCopyWithImpl(this._self, this._then);

  final _ListCredentialsViewState _self;
  final $Res Function(_ListCredentialsViewState) _then;

/// Create a copy of ListCredentialsViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgName = null,Object? displayName = null,Object? credentials = null,Object? devices = null,}) {
  return _then(_ListCredentialsViewState(
orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,credentials: null == credentials ? _self._credentials : credentials // ignore: cast_nullable_to_non_nullable
as List<CredentialRowViewState>,devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<DeviceRowViewState>,
  ));
}


}

// dart format on
