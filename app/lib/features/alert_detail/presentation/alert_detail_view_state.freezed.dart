// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_detail_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlertDetailRecipientViewState {

 String get name; String get responseStatus; DateTime? get respondedAt;
/// Create a copy of AlertDetailRecipientViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertDetailRecipientViewStateCopyWith<AlertDetailRecipientViewState> get copyWith => _$AlertDetailRecipientViewStateCopyWithImpl<AlertDetailRecipientViewState>(this as AlertDetailRecipientViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertDetailRecipientViewState&&(identical(other.name, name) || other.name == name)&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}


@override
int get hashCode => Object.hash(runtimeType,name,responseStatus,respondedAt);

@override
String toString() {
  return 'AlertDetailRecipientViewState(name: $name, responseStatus: $responseStatus, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class $AlertDetailRecipientViewStateCopyWith<$Res>  {
  factory $AlertDetailRecipientViewStateCopyWith(AlertDetailRecipientViewState value, $Res Function(AlertDetailRecipientViewState) _then) = _$AlertDetailRecipientViewStateCopyWithImpl;
@useResult
$Res call({
 String name, String responseStatus, DateTime? respondedAt
});




}
/// @nodoc
class _$AlertDetailRecipientViewStateCopyWithImpl<$Res>
    implements $AlertDetailRecipientViewStateCopyWith<$Res> {
  _$AlertDetailRecipientViewStateCopyWithImpl(this._self, this._then);

  final AlertDetailRecipientViewState _self;
  final $Res Function(AlertDetailRecipientViewState) _then;

/// Create a copy of AlertDetailRecipientViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? responseStatus = null,Object? respondedAt = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as String,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertDetailRecipientViewState].
extension AlertDetailRecipientViewStatePatterns on AlertDetailRecipientViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertDetailRecipientViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertDetailRecipientViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertDetailRecipientViewState value)  $default,){
final _that = this;
switch (_that) {
case _AlertDetailRecipientViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertDetailRecipientViewState value)?  $default,){
final _that = this;
switch (_that) {
case _AlertDetailRecipientViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String responseStatus,  DateTime? respondedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertDetailRecipientViewState() when $default != null:
return $default(_that.name,_that.responseStatus,_that.respondedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String responseStatus,  DateTime? respondedAt)  $default,) {final _that = this;
switch (_that) {
case _AlertDetailRecipientViewState():
return $default(_that.name,_that.responseStatus,_that.respondedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String responseStatus,  DateTime? respondedAt)?  $default,) {final _that = this;
switch (_that) {
case _AlertDetailRecipientViewState() when $default != null:
return $default(_that.name,_that.responseStatus,_that.respondedAt);case _:
  return null;

}
}

}

/// @nodoc


class _AlertDetailRecipientViewState implements AlertDetailRecipientViewState {
  const _AlertDetailRecipientViewState({required this.name, required this.responseStatus, this.respondedAt});
  

@override final  String name;
@override final  String responseStatus;
@override final  DateTime? respondedAt;

/// Create a copy of AlertDetailRecipientViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertDetailRecipientViewStateCopyWith<_AlertDetailRecipientViewState> get copyWith => __$AlertDetailRecipientViewStateCopyWithImpl<_AlertDetailRecipientViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertDetailRecipientViewState&&(identical(other.name, name) || other.name == name)&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}


@override
int get hashCode => Object.hash(runtimeType,name,responseStatus,respondedAt);

@override
String toString() {
  return 'AlertDetailRecipientViewState(name: $name, responseStatus: $responseStatus, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class _$AlertDetailRecipientViewStateCopyWith<$Res> implements $AlertDetailRecipientViewStateCopyWith<$Res> {
  factory _$AlertDetailRecipientViewStateCopyWith(_AlertDetailRecipientViewState value, $Res Function(_AlertDetailRecipientViewState) _then) = __$AlertDetailRecipientViewStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String responseStatus, DateTime? respondedAt
});




}
/// @nodoc
class __$AlertDetailRecipientViewStateCopyWithImpl<$Res>
    implements _$AlertDetailRecipientViewStateCopyWith<$Res> {
  __$AlertDetailRecipientViewStateCopyWithImpl(this._self, this._then);

  final _AlertDetailRecipientViewState _self;
  final $Res Function(_AlertDetailRecipientViewState) _then;

/// Create a copy of AlertDetailRecipientViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? responseStatus = null,Object? respondedAt = freezed,}) {
  return _then(_AlertDetailRecipientViewState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as String,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$AlertDetailViewState {

 String get alertId; String get type; String get status; String get orgName; DateTime get triggeredAt; DateTime? get resolvedAt; String? get responderName; List<String> get targetNames; bool get isBroadcast; List<AlertDetailRecipientViewState> get acknowledged; List<AlertDetailRecipientViewState> get declined; List<AlertDetailRecipientViewState> get pending;
/// Create a copy of AlertDetailViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertDetailViewStateCopyWith<AlertDetailViewState> get copyWith => _$AlertDetailViewStateCopyWithImpl<AlertDetailViewState>(this as AlertDetailViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertDetailViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.responderName, responderName) || other.responderName == responderName)&&const DeepCollectionEquality().equals(other.targetNames, targetNames)&&(identical(other.isBroadcast, isBroadcast) || other.isBroadcast == isBroadcast)&&const DeepCollectionEquality().equals(other.acknowledged, acknowledged)&&const DeepCollectionEquality().equals(other.declined, declined)&&const DeepCollectionEquality().equals(other.pending, pending));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,type,status,orgName,triggeredAt,resolvedAt,responderName,const DeepCollectionEquality().hash(targetNames),isBroadcast,const DeepCollectionEquality().hash(acknowledged),const DeepCollectionEquality().hash(declined),const DeepCollectionEquality().hash(pending));

@override
String toString() {
  return 'AlertDetailViewState(alertId: $alertId, type: $type, status: $status, orgName: $orgName, triggeredAt: $triggeredAt, resolvedAt: $resolvedAt, responderName: $responderName, targetNames: $targetNames, isBroadcast: $isBroadcast, acknowledged: $acknowledged, declined: $declined, pending: $pending)';
}


}

/// @nodoc
abstract mixin class $AlertDetailViewStateCopyWith<$Res>  {
  factory $AlertDetailViewStateCopyWith(AlertDetailViewState value, $Res Function(AlertDetailViewState) _then) = _$AlertDetailViewStateCopyWithImpl;
@useResult
$Res call({
 String alertId, String type, String status, String orgName, DateTime triggeredAt, DateTime? resolvedAt, String? responderName, List<String> targetNames, bool isBroadcast, List<AlertDetailRecipientViewState> acknowledged, List<AlertDetailRecipientViewState> declined, List<AlertDetailRecipientViewState> pending
});




}
/// @nodoc
class _$AlertDetailViewStateCopyWithImpl<$Res>
    implements $AlertDetailViewStateCopyWith<$Res> {
  _$AlertDetailViewStateCopyWithImpl(this._self, this._then);

  final AlertDetailViewState _self;
  final $Res Function(AlertDetailViewState) _then;

/// Create a copy of AlertDetailViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alertId = null,Object? type = null,Object? status = null,Object? orgName = null,Object? triggeredAt = null,Object? resolvedAt = freezed,Object? responderName = freezed,Object? targetNames = null,Object? isBroadcast = null,Object? acknowledged = null,Object? declined = null,Object? pending = null,}) {
  return _then(_self.copyWith(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,responderName: freezed == responderName ? _self.responderName : responderName // ignore: cast_nullable_to_non_nullable
as String?,targetNames: null == targetNames ? _self.targetNames : targetNames // ignore: cast_nullable_to_non_nullable
as List<String>,isBroadcast: null == isBroadcast ? _self.isBroadcast : isBroadcast // ignore: cast_nullable_to_non_nullable
as bool,acknowledged: null == acknowledged ? _self.acknowledged : acknowledged // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,declined: null == declined ? _self.declined : declined // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertDetailViewState].
extension AlertDetailViewStatePatterns on AlertDetailViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertDetailViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertDetailViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertDetailViewState value)  $default,){
final _that = this;
switch (_that) {
case _AlertDetailViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertDetailViewState value)?  $default,){
final _that = this;
switch (_that) {
case _AlertDetailViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String alertId,  String type,  String status,  String orgName,  DateTime triggeredAt,  DateTime? resolvedAt,  String? responderName,  List<String> targetNames,  bool isBroadcast,  List<AlertDetailRecipientViewState> acknowledged,  List<AlertDetailRecipientViewState> declined,  List<AlertDetailRecipientViewState> pending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertDetailViewState() when $default != null:
return $default(_that.alertId,_that.type,_that.status,_that.orgName,_that.triggeredAt,_that.resolvedAt,_that.responderName,_that.targetNames,_that.isBroadcast,_that.acknowledged,_that.declined,_that.pending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String alertId,  String type,  String status,  String orgName,  DateTime triggeredAt,  DateTime? resolvedAt,  String? responderName,  List<String> targetNames,  bool isBroadcast,  List<AlertDetailRecipientViewState> acknowledged,  List<AlertDetailRecipientViewState> declined,  List<AlertDetailRecipientViewState> pending)  $default,) {final _that = this;
switch (_that) {
case _AlertDetailViewState():
return $default(_that.alertId,_that.type,_that.status,_that.orgName,_that.triggeredAt,_that.resolvedAt,_that.responderName,_that.targetNames,_that.isBroadcast,_that.acknowledged,_that.declined,_that.pending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String alertId,  String type,  String status,  String orgName,  DateTime triggeredAt,  DateTime? resolvedAt,  String? responderName,  List<String> targetNames,  bool isBroadcast,  List<AlertDetailRecipientViewState> acknowledged,  List<AlertDetailRecipientViewState> declined,  List<AlertDetailRecipientViewState> pending)?  $default,) {final _that = this;
switch (_that) {
case _AlertDetailViewState() when $default != null:
return $default(_that.alertId,_that.type,_that.status,_that.orgName,_that.triggeredAt,_that.resolvedAt,_that.responderName,_that.targetNames,_that.isBroadcast,_that.acknowledged,_that.declined,_that.pending);case _:
  return null;

}
}

}

/// @nodoc


class _AlertDetailViewState extends AlertDetailViewState {
  const _AlertDetailViewState({required this.alertId, required this.type, required this.status, required this.orgName, required this.triggeredAt, this.resolvedAt, this.responderName, final  List<String> targetNames = const <String>[], required this.isBroadcast, final  List<AlertDetailRecipientViewState> acknowledged = const <AlertDetailRecipientViewState>[], final  List<AlertDetailRecipientViewState> declined = const <AlertDetailRecipientViewState>[], final  List<AlertDetailRecipientViewState> pending = const <AlertDetailRecipientViewState>[]}): _targetNames = targetNames,_acknowledged = acknowledged,_declined = declined,_pending = pending,super._();
  

@override final  String alertId;
@override final  String type;
@override final  String status;
@override final  String orgName;
@override final  DateTime triggeredAt;
@override final  DateTime? resolvedAt;
@override final  String? responderName;
 final  List<String> _targetNames;
@override@JsonKey() List<String> get targetNames {
  if (_targetNames is EqualUnmodifiableListView) return _targetNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetNames);
}

@override final  bool isBroadcast;
 final  List<AlertDetailRecipientViewState> _acknowledged;
@override@JsonKey() List<AlertDetailRecipientViewState> get acknowledged {
  if (_acknowledged is EqualUnmodifiableListView) return _acknowledged;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_acknowledged);
}

 final  List<AlertDetailRecipientViewState> _declined;
@override@JsonKey() List<AlertDetailRecipientViewState> get declined {
  if (_declined is EqualUnmodifiableListView) return _declined;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_declined);
}

 final  List<AlertDetailRecipientViewState> _pending;
@override@JsonKey() List<AlertDetailRecipientViewState> get pending {
  if (_pending is EqualUnmodifiableListView) return _pending;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pending);
}


/// Create a copy of AlertDetailViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertDetailViewStateCopyWith<_AlertDetailViewState> get copyWith => __$AlertDetailViewStateCopyWithImpl<_AlertDetailViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertDetailViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.responderName, responderName) || other.responderName == responderName)&&const DeepCollectionEquality().equals(other._targetNames, _targetNames)&&(identical(other.isBroadcast, isBroadcast) || other.isBroadcast == isBroadcast)&&const DeepCollectionEquality().equals(other._acknowledged, _acknowledged)&&const DeepCollectionEquality().equals(other._declined, _declined)&&const DeepCollectionEquality().equals(other._pending, _pending));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,type,status,orgName,triggeredAt,resolvedAt,responderName,const DeepCollectionEquality().hash(_targetNames),isBroadcast,const DeepCollectionEquality().hash(_acknowledged),const DeepCollectionEquality().hash(_declined),const DeepCollectionEquality().hash(_pending));

@override
String toString() {
  return 'AlertDetailViewState(alertId: $alertId, type: $type, status: $status, orgName: $orgName, triggeredAt: $triggeredAt, resolvedAt: $resolvedAt, responderName: $responderName, targetNames: $targetNames, isBroadcast: $isBroadcast, acknowledged: $acknowledged, declined: $declined, pending: $pending)';
}


}

/// @nodoc
abstract mixin class _$AlertDetailViewStateCopyWith<$Res> implements $AlertDetailViewStateCopyWith<$Res> {
  factory _$AlertDetailViewStateCopyWith(_AlertDetailViewState value, $Res Function(_AlertDetailViewState) _then) = __$AlertDetailViewStateCopyWithImpl;
@override @useResult
$Res call({
 String alertId, String type, String status, String orgName, DateTime triggeredAt, DateTime? resolvedAt, String? responderName, List<String> targetNames, bool isBroadcast, List<AlertDetailRecipientViewState> acknowledged, List<AlertDetailRecipientViewState> declined, List<AlertDetailRecipientViewState> pending
});




}
/// @nodoc
class __$AlertDetailViewStateCopyWithImpl<$Res>
    implements _$AlertDetailViewStateCopyWith<$Res> {
  __$AlertDetailViewStateCopyWithImpl(this._self, this._then);

  final _AlertDetailViewState _self;
  final $Res Function(_AlertDetailViewState) _then;

/// Create a copy of AlertDetailViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alertId = null,Object? type = null,Object? status = null,Object? orgName = null,Object? triggeredAt = null,Object? resolvedAt = freezed,Object? responderName = freezed,Object? targetNames = null,Object? isBroadcast = null,Object? acknowledged = null,Object? declined = null,Object? pending = null,}) {
  return _then(_AlertDetailViewState(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,responderName: freezed == responderName ? _self.responderName : responderName // ignore: cast_nullable_to_non_nullable
as String?,targetNames: null == targetNames ? _self._targetNames : targetNames // ignore: cast_nullable_to_non_nullable
as List<String>,isBroadcast: null == isBroadcast ? _self.isBroadcast : isBroadcast // ignore: cast_nullable_to_non_nullable
as bool,acknowledged: null == acknowledged ? _self._acknowledged : acknowledged // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,declined: null == declined ? _self._declined : declined // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,pending: null == pending ? _self._pending : pending // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,
  ));
}


}

// dart format on
