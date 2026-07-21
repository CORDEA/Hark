// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertSummaryDto {

 String get id; String get type; String get status;@JsonKey(name: 'is_broadcast') bool get isBroadcast;@JsonKey(name: 'triggered_at') DateTime get triggeredAt;@JsonKey(name: 'resolved_at') DateTime? get resolvedAt;@JsonKey(name: 'responder_id') String? get responderId;@JsonKey(name: 'responder_name') String? get responderName;@JsonKey(name: 'target_names') List<String> get targetNames;@JsonKey(name: 'ack_count') int get ackCount;@JsonKey(name: 'pending_count') int get pendingCount;@JsonKey(name: 'decline_count') int get declineCount;
/// Create a copy of AlertSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertSummaryDtoCopyWith<AlertSummaryDto> get copyWith => _$AlertSummaryDtoCopyWithImpl<AlertSummaryDto>(this as AlertSummaryDto, _$identity);

  /// Serializes this AlertSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.isBroadcast, isBroadcast) || other.isBroadcast == isBroadcast)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.responderId, responderId) || other.responderId == responderId)&&(identical(other.responderName, responderName) || other.responderName == responderName)&&const DeepCollectionEquality().equals(other.targetNames, targetNames)&&(identical(other.ackCount, ackCount) || other.ackCount == ackCount)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.declineCount, declineCount) || other.declineCount == declineCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,isBroadcast,triggeredAt,resolvedAt,responderId,responderName,const DeepCollectionEquality().hash(targetNames),ackCount,pendingCount,declineCount);

@override
String toString() {
  return 'AlertSummaryDto(id: $id, type: $type, status: $status, isBroadcast: $isBroadcast, triggeredAt: $triggeredAt, resolvedAt: $resolvedAt, responderId: $responderId, responderName: $responderName, targetNames: $targetNames, ackCount: $ackCount, pendingCount: $pendingCount, declineCount: $declineCount)';
}


}

/// @nodoc
abstract mixin class $AlertSummaryDtoCopyWith<$Res>  {
  factory $AlertSummaryDtoCopyWith(AlertSummaryDto value, $Res Function(AlertSummaryDto) _then) = _$AlertSummaryDtoCopyWithImpl;
@useResult
$Res call({
 String id, String type, String status,@JsonKey(name: 'is_broadcast') bool isBroadcast,@JsonKey(name: 'triggered_at') DateTime triggeredAt,@JsonKey(name: 'resolved_at') DateTime? resolvedAt,@JsonKey(name: 'responder_id') String? responderId,@JsonKey(name: 'responder_name') String? responderName,@JsonKey(name: 'target_names') List<String> targetNames,@JsonKey(name: 'ack_count') int ackCount,@JsonKey(name: 'pending_count') int pendingCount,@JsonKey(name: 'decline_count') int declineCount
});




}
/// @nodoc
class _$AlertSummaryDtoCopyWithImpl<$Res>
    implements $AlertSummaryDtoCopyWith<$Res> {
  _$AlertSummaryDtoCopyWithImpl(this._self, this._then);

  final AlertSummaryDto _self;
  final $Res Function(AlertSummaryDto) _then;

/// Create a copy of AlertSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? status = null,Object? isBroadcast = null,Object? triggeredAt = null,Object? resolvedAt = freezed,Object? responderId = freezed,Object? responderName = freezed,Object? targetNames = null,Object? ackCount = null,Object? pendingCount = null,Object? declineCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isBroadcast: null == isBroadcast ? _self.isBroadcast : isBroadcast // ignore: cast_nullable_to_non_nullable
as bool,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,responderId: freezed == responderId ? _self.responderId : responderId // ignore: cast_nullable_to_non_nullable
as String?,responderName: freezed == responderName ? _self.responderName : responderName // ignore: cast_nullable_to_non_nullable
as String?,targetNames: null == targetNames ? _self.targetNames : targetNames // ignore: cast_nullable_to_non_nullable
as List<String>,ackCount: null == ackCount ? _self.ackCount : ackCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,declineCount: null == declineCount ? _self.declineCount : declineCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertSummaryDto].
extension AlertSummaryDtoPatterns on AlertSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _AlertSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _AlertSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String status, @JsonKey(name: 'is_broadcast')  bool isBroadcast, @JsonKey(name: 'triggered_at')  DateTime triggeredAt, @JsonKey(name: 'resolved_at')  DateTime? resolvedAt, @JsonKey(name: 'responder_id')  String? responderId, @JsonKey(name: 'responder_name')  String? responderName, @JsonKey(name: 'target_names')  List<String> targetNames, @JsonKey(name: 'ack_count')  int ackCount, @JsonKey(name: 'pending_count')  int pendingCount, @JsonKey(name: 'decline_count')  int declineCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertSummaryDto() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.isBroadcast,_that.triggeredAt,_that.resolvedAt,_that.responderId,_that.responderName,_that.targetNames,_that.ackCount,_that.pendingCount,_that.declineCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String status, @JsonKey(name: 'is_broadcast')  bool isBroadcast, @JsonKey(name: 'triggered_at')  DateTime triggeredAt, @JsonKey(name: 'resolved_at')  DateTime? resolvedAt, @JsonKey(name: 'responder_id')  String? responderId, @JsonKey(name: 'responder_name')  String? responderName, @JsonKey(name: 'target_names')  List<String> targetNames, @JsonKey(name: 'ack_count')  int ackCount, @JsonKey(name: 'pending_count')  int pendingCount, @JsonKey(name: 'decline_count')  int declineCount)  $default,) {final _that = this;
switch (_that) {
case _AlertSummaryDto():
return $default(_that.id,_that.type,_that.status,_that.isBroadcast,_that.triggeredAt,_that.resolvedAt,_that.responderId,_that.responderName,_that.targetNames,_that.ackCount,_that.pendingCount,_that.declineCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String status, @JsonKey(name: 'is_broadcast')  bool isBroadcast, @JsonKey(name: 'triggered_at')  DateTime triggeredAt, @JsonKey(name: 'resolved_at')  DateTime? resolvedAt, @JsonKey(name: 'responder_id')  String? responderId, @JsonKey(name: 'responder_name')  String? responderName, @JsonKey(name: 'target_names')  List<String> targetNames, @JsonKey(name: 'ack_count')  int ackCount, @JsonKey(name: 'pending_count')  int pendingCount, @JsonKey(name: 'decline_count')  int declineCount)?  $default,) {final _that = this;
switch (_that) {
case _AlertSummaryDto() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.isBroadcast,_that.triggeredAt,_that.resolvedAt,_that.responderId,_that.responderName,_that.targetNames,_that.ackCount,_that.pendingCount,_that.declineCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertSummaryDto implements AlertSummaryDto {
  const _AlertSummaryDto({required this.id, required this.type, required this.status, @JsonKey(name: 'is_broadcast') required this.isBroadcast, @JsonKey(name: 'triggered_at') required this.triggeredAt, @JsonKey(name: 'resolved_at') this.resolvedAt, @JsonKey(name: 'responder_id') this.responderId, @JsonKey(name: 'responder_name') this.responderName, @JsonKey(name: 'target_names') final  List<String> targetNames = const <String>[], @JsonKey(name: 'ack_count') this.ackCount = 0, @JsonKey(name: 'pending_count') this.pendingCount = 0, @JsonKey(name: 'decline_count') this.declineCount = 0}): _targetNames = targetNames;
  factory _AlertSummaryDto.fromJson(Map<String, dynamic> json) => _$AlertSummaryDtoFromJson(json);

@override final  String id;
@override final  String type;
@override final  String status;
@override@JsonKey(name: 'is_broadcast') final  bool isBroadcast;
@override@JsonKey(name: 'triggered_at') final  DateTime triggeredAt;
@override@JsonKey(name: 'resolved_at') final  DateTime? resolvedAt;
@override@JsonKey(name: 'responder_id') final  String? responderId;
@override@JsonKey(name: 'responder_name') final  String? responderName;
 final  List<String> _targetNames;
@override@JsonKey(name: 'target_names') List<String> get targetNames {
  if (_targetNames is EqualUnmodifiableListView) return _targetNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetNames);
}

@override@JsonKey(name: 'ack_count') final  int ackCount;
@override@JsonKey(name: 'pending_count') final  int pendingCount;
@override@JsonKey(name: 'decline_count') final  int declineCount;

/// Create a copy of AlertSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertSummaryDtoCopyWith<_AlertSummaryDto> get copyWith => __$AlertSummaryDtoCopyWithImpl<_AlertSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.isBroadcast, isBroadcast) || other.isBroadcast == isBroadcast)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.responderId, responderId) || other.responderId == responderId)&&(identical(other.responderName, responderName) || other.responderName == responderName)&&const DeepCollectionEquality().equals(other._targetNames, _targetNames)&&(identical(other.ackCount, ackCount) || other.ackCount == ackCount)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.declineCount, declineCount) || other.declineCount == declineCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,isBroadcast,triggeredAt,resolvedAt,responderId,responderName,const DeepCollectionEquality().hash(_targetNames),ackCount,pendingCount,declineCount);

@override
String toString() {
  return 'AlertSummaryDto(id: $id, type: $type, status: $status, isBroadcast: $isBroadcast, triggeredAt: $triggeredAt, resolvedAt: $resolvedAt, responderId: $responderId, responderName: $responderName, targetNames: $targetNames, ackCount: $ackCount, pendingCount: $pendingCount, declineCount: $declineCount)';
}


}

/// @nodoc
abstract mixin class _$AlertSummaryDtoCopyWith<$Res> implements $AlertSummaryDtoCopyWith<$Res> {
  factory _$AlertSummaryDtoCopyWith(_AlertSummaryDto value, $Res Function(_AlertSummaryDto) _then) = __$AlertSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String status,@JsonKey(name: 'is_broadcast') bool isBroadcast,@JsonKey(name: 'triggered_at') DateTime triggeredAt,@JsonKey(name: 'resolved_at') DateTime? resolvedAt,@JsonKey(name: 'responder_id') String? responderId,@JsonKey(name: 'responder_name') String? responderName,@JsonKey(name: 'target_names') List<String> targetNames,@JsonKey(name: 'ack_count') int ackCount,@JsonKey(name: 'pending_count') int pendingCount,@JsonKey(name: 'decline_count') int declineCount
});




}
/// @nodoc
class __$AlertSummaryDtoCopyWithImpl<$Res>
    implements _$AlertSummaryDtoCopyWith<$Res> {
  __$AlertSummaryDtoCopyWithImpl(this._self, this._then);

  final _AlertSummaryDto _self;
  final $Res Function(_AlertSummaryDto) _then;

/// Create a copy of AlertSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? status = null,Object? isBroadcast = null,Object? triggeredAt = null,Object? resolvedAt = freezed,Object? responderId = freezed,Object? responderName = freezed,Object? targetNames = null,Object? ackCount = null,Object? pendingCount = null,Object? declineCount = null,}) {
  return _then(_AlertSummaryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isBroadcast: null == isBroadcast ? _self.isBroadcast : isBroadcast // ignore: cast_nullable_to_non_nullable
as bool,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,responderId: freezed == responderId ? _self.responderId : responderId // ignore: cast_nullable_to_non_nullable
as String?,responderName: freezed == responderName ? _self.responderName : responderName // ignore: cast_nullable_to_non_nullable
as String?,targetNames: null == targetNames ? _self._targetNames : targetNames // ignore: cast_nullable_to_non_nullable
as List<String>,ackCount: null == ackCount ? _self.ackCount : ackCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,declineCount: null == declineCount ? _self.declineCount : declineCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AlertRecipientDto {

@JsonKey(name: 'user_id') String get userId; String get name;@JsonKey(name: 'response_status') String get responseStatus;@JsonKey(name: 'responded_at') DateTime? get respondedAt;
/// Create a copy of AlertRecipientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertRecipientDtoCopyWith<AlertRecipientDto> get copyWith => _$AlertRecipientDtoCopyWithImpl<AlertRecipientDto>(this as AlertRecipientDto, _$identity);

  /// Serializes this AlertRecipientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertRecipientDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,responseStatus,respondedAt);

@override
String toString() {
  return 'AlertRecipientDto(userId: $userId, name: $name, responseStatus: $responseStatus, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class $AlertRecipientDtoCopyWith<$Res>  {
  factory $AlertRecipientDtoCopyWith(AlertRecipientDto value, $Res Function(AlertRecipientDto) _then) = _$AlertRecipientDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String name,@JsonKey(name: 'response_status') String responseStatus,@JsonKey(name: 'responded_at') DateTime? respondedAt
});




}
/// @nodoc
class _$AlertRecipientDtoCopyWithImpl<$Res>
    implements $AlertRecipientDtoCopyWith<$Res> {
  _$AlertRecipientDtoCopyWithImpl(this._self, this._then);

  final AlertRecipientDto _self;
  final $Res Function(AlertRecipientDto) _then;

/// Create a copy of AlertRecipientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? responseStatus = null,Object? respondedAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as String,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertRecipientDto].
extension AlertRecipientDtoPatterns on AlertRecipientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertRecipientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertRecipientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertRecipientDto value)  $default,){
final _that = this;
switch (_that) {
case _AlertRecipientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertRecipientDto value)?  $default,){
final _that = this;
switch (_that) {
case _AlertRecipientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String name, @JsonKey(name: 'response_status')  String responseStatus, @JsonKey(name: 'responded_at')  DateTime? respondedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertRecipientDto() when $default != null:
return $default(_that.userId,_that.name,_that.responseStatus,_that.respondedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String name, @JsonKey(name: 'response_status')  String responseStatus, @JsonKey(name: 'responded_at')  DateTime? respondedAt)  $default,) {final _that = this;
switch (_that) {
case _AlertRecipientDto():
return $default(_that.userId,_that.name,_that.responseStatus,_that.respondedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId,  String name, @JsonKey(name: 'response_status')  String responseStatus, @JsonKey(name: 'responded_at')  DateTime? respondedAt)?  $default,) {final _that = this;
switch (_that) {
case _AlertRecipientDto() when $default != null:
return $default(_that.userId,_that.name,_that.responseStatus,_that.respondedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertRecipientDto implements AlertRecipientDto {
  const _AlertRecipientDto({@JsonKey(name: 'user_id') required this.userId, required this.name, @JsonKey(name: 'response_status') required this.responseStatus, @JsonKey(name: 'responded_at') this.respondedAt});
  factory _AlertRecipientDto.fromJson(Map<String, dynamic> json) => _$AlertRecipientDtoFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override final  String name;
@override@JsonKey(name: 'response_status') final  String responseStatus;
@override@JsonKey(name: 'responded_at') final  DateTime? respondedAt;

/// Create a copy of AlertRecipientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertRecipientDtoCopyWith<_AlertRecipientDto> get copyWith => __$AlertRecipientDtoCopyWithImpl<_AlertRecipientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertRecipientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertRecipientDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.responseStatus, responseStatus) || other.responseStatus == responseStatus)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,responseStatus,respondedAt);

@override
String toString() {
  return 'AlertRecipientDto(userId: $userId, name: $name, responseStatus: $responseStatus, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class _$AlertRecipientDtoCopyWith<$Res> implements $AlertRecipientDtoCopyWith<$Res> {
  factory _$AlertRecipientDtoCopyWith(_AlertRecipientDto value, $Res Function(_AlertRecipientDto) _then) = __$AlertRecipientDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String name,@JsonKey(name: 'response_status') String responseStatus,@JsonKey(name: 'responded_at') DateTime? respondedAt
});




}
/// @nodoc
class __$AlertRecipientDtoCopyWithImpl<$Res>
    implements _$AlertRecipientDtoCopyWith<$Res> {
  __$AlertRecipientDtoCopyWithImpl(this._self, this._then);

  final _AlertRecipientDto _self;
  final $Res Function(_AlertRecipientDto) _then;

/// Create a copy of AlertRecipientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? responseStatus = null,Object? respondedAt = freezed,}) {
  return _then(_AlertRecipientDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,responseStatus: null == responseStatus ? _self.responseStatus : responseStatus // ignore: cast_nullable_to_non_nullable
as String,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$AlertDetailDto {

 String get id; String get type; String get status;@JsonKey(name: 'is_broadcast') bool get isBroadcast;@JsonKey(name: 'triggered_at') DateTime get triggeredAt;@JsonKey(name: 'resolved_at') DateTime? get resolvedAt;@JsonKey(name: 'responder_id') String? get responderId;@JsonKey(name: 'responder_name') String? get responderName;@JsonKey(name: 'target_names') List<String> get targetNames;@JsonKey(name: 'ack_count') int get ackCount;@JsonKey(name: 'pending_count') int get pendingCount;@JsonKey(name: 'decline_count') int get declineCount; List<AlertRecipientDto> get recipients;
/// Create a copy of AlertDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertDetailDtoCopyWith<AlertDetailDto> get copyWith => _$AlertDetailDtoCopyWithImpl<AlertDetailDto>(this as AlertDetailDto, _$identity);

  /// Serializes this AlertDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.isBroadcast, isBroadcast) || other.isBroadcast == isBroadcast)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.responderId, responderId) || other.responderId == responderId)&&(identical(other.responderName, responderName) || other.responderName == responderName)&&const DeepCollectionEquality().equals(other.targetNames, targetNames)&&(identical(other.ackCount, ackCount) || other.ackCount == ackCount)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.declineCount, declineCount) || other.declineCount == declineCount)&&const DeepCollectionEquality().equals(other.recipients, recipients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,isBroadcast,triggeredAt,resolvedAt,responderId,responderName,const DeepCollectionEquality().hash(targetNames),ackCount,pendingCount,declineCount,const DeepCollectionEquality().hash(recipients));

@override
String toString() {
  return 'AlertDetailDto(id: $id, type: $type, status: $status, isBroadcast: $isBroadcast, triggeredAt: $triggeredAt, resolvedAt: $resolvedAt, responderId: $responderId, responderName: $responderName, targetNames: $targetNames, ackCount: $ackCount, pendingCount: $pendingCount, declineCount: $declineCount, recipients: $recipients)';
}


}

/// @nodoc
abstract mixin class $AlertDetailDtoCopyWith<$Res>  {
  factory $AlertDetailDtoCopyWith(AlertDetailDto value, $Res Function(AlertDetailDto) _then) = _$AlertDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String type, String status,@JsonKey(name: 'is_broadcast') bool isBroadcast,@JsonKey(name: 'triggered_at') DateTime triggeredAt,@JsonKey(name: 'resolved_at') DateTime? resolvedAt,@JsonKey(name: 'responder_id') String? responderId,@JsonKey(name: 'responder_name') String? responderName,@JsonKey(name: 'target_names') List<String> targetNames,@JsonKey(name: 'ack_count') int ackCount,@JsonKey(name: 'pending_count') int pendingCount,@JsonKey(name: 'decline_count') int declineCount, List<AlertRecipientDto> recipients
});




}
/// @nodoc
class _$AlertDetailDtoCopyWithImpl<$Res>
    implements $AlertDetailDtoCopyWith<$Res> {
  _$AlertDetailDtoCopyWithImpl(this._self, this._then);

  final AlertDetailDto _self;
  final $Res Function(AlertDetailDto) _then;

/// Create a copy of AlertDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? status = null,Object? isBroadcast = null,Object? triggeredAt = null,Object? resolvedAt = freezed,Object? responderId = freezed,Object? responderName = freezed,Object? targetNames = null,Object? ackCount = null,Object? pendingCount = null,Object? declineCount = null,Object? recipients = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isBroadcast: null == isBroadcast ? _self.isBroadcast : isBroadcast // ignore: cast_nullable_to_non_nullable
as bool,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,responderId: freezed == responderId ? _self.responderId : responderId // ignore: cast_nullable_to_non_nullable
as String?,responderName: freezed == responderName ? _self.responderName : responderName // ignore: cast_nullable_to_non_nullable
as String?,targetNames: null == targetNames ? _self.targetNames : targetNames // ignore: cast_nullable_to_non_nullable
as List<String>,ackCount: null == ackCount ? _self.ackCount : ackCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,declineCount: null == declineCount ? _self.declineCount : declineCount // ignore: cast_nullable_to_non_nullable
as int,recipients: null == recipients ? _self.recipients : recipients // ignore: cast_nullable_to_non_nullable
as List<AlertRecipientDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertDetailDto].
extension AlertDetailDtoPatterns on AlertDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _AlertDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _AlertDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String status, @JsonKey(name: 'is_broadcast')  bool isBroadcast, @JsonKey(name: 'triggered_at')  DateTime triggeredAt, @JsonKey(name: 'resolved_at')  DateTime? resolvedAt, @JsonKey(name: 'responder_id')  String? responderId, @JsonKey(name: 'responder_name')  String? responderName, @JsonKey(name: 'target_names')  List<String> targetNames, @JsonKey(name: 'ack_count')  int ackCount, @JsonKey(name: 'pending_count')  int pendingCount, @JsonKey(name: 'decline_count')  int declineCount,  List<AlertRecipientDto> recipients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertDetailDto() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.isBroadcast,_that.triggeredAt,_that.resolvedAt,_that.responderId,_that.responderName,_that.targetNames,_that.ackCount,_that.pendingCount,_that.declineCount,_that.recipients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String status, @JsonKey(name: 'is_broadcast')  bool isBroadcast, @JsonKey(name: 'triggered_at')  DateTime triggeredAt, @JsonKey(name: 'resolved_at')  DateTime? resolvedAt, @JsonKey(name: 'responder_id')  String? responderId, @JsonKey(name: 'responder_name')  String? responderName, @JsonKey(name: 'target_names')  List<String> targetNames, @JsonKey(name: 'ack_count')  int ackCount, @JsonKey(name: 'pending_count')  int pendingCount, @JsonKey(name: 'decline_count')  int declineCount,  List<AlertRecipientDto> recipients)  $default,) {final _that = this;
switch (_that) {
case _AlertDetailDto():
return $default(_that.id,_that.type,_that.status,_that.isBroadcast,_that.triggeredAt,_that.resolvedAt,_that.responderId,_that.responderName,_that.targetNames,_that.ackCount,_that.pendingCount,_that.declineCount,_that.recipients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String status, @JsonKey(name: 'is_broadcast')  bool isBroadcast, @JsonKey(name: 'triggered_at')  DateTime triggeredAt, @JsonKey(name: 'resolved_at')  DateTime? resolvedAt, @JsonKey(name: 'responder_id')  String? responderId, @JsonKey(name: 'responder_name')  String? responderName, @JsonKey(name: 'target_names')  List<String> targetNames, @JsonKey(name: 'ack_count')  int ackCount, @JsonKey(name: 'pending_count')  int pendingCount, @JsonKey(name: 'decline_count')  int declineCount,  List<AlertRecipientDto> recipients)?  $default,) {final _that = this;
switch (_that) {
case _AlertDetailDto() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.isBroadcast,_that.triggeredAt,_that.resolvedAt,_that.responderId,_that.responderName,_that.targetNames,_that.ackCount,_that.pendingCount,_that.declineCount,_that.recipients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertDetailDto implements AlertDetailDto {
  const _AlertDetailDto({required this.id, required this.type, required this.status, @JsonKey(name: 'is_broadcast') required this.isBroadcast, @JsonKey(name: 'triggered_at') required this.triggeredAt, @JsonKey(name: 'resolved_at') this.resolvedAt, @JsonKey(name: 'responder_id') this.responderId, @JsonKey(name: 'responder_name') this.responderName, @JsonKey(name: 'target_names') final  List<String> targetNames = const <String>[], @JsonKey(name: 'ack_count') this.ackCount = 0, @JsonKey(name: 'pending_count') this.pendingCount = 0, @JsonKey(name: 'decline_count') this.declineCount = 0, final  List<AlertRecipientDto> recipients = const <AlertRecipientDto>[]}): _targetNames = targetNames,_recipients = recipients;
  factory _AlertDetailDto.fromJson(Map<String, dynamic> json) => _$AlertDetailDtoFromJson(json);

@override final  String id;
@override final  String type;
@override final  String status;
@override@JsonKey(name: 'is_broadcast') final  bool isBroadcast;
@override@JsonKey(name: 'triggered_at') final  DateTime triggeredAt;
@override@JsonKey(name: 'resolved_at') final  DateTime? resolvedAt;
@override@JsonKey(name: 'responder_id') final  String? responderId;
@override@JsonKey(name: 'responder_name') final  String? responderName;
 final  List<String> _targetNames;
@override@JsonKey(name: 'target_names') List<String> get targetNames {
  if (_targetNames is EqualUnmodifiableListView) return _targetNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetNames);
}

@override@JsonKey(name: 'ack_count') final  int ackCount;
@override@JsonKey(name: 'pending_count') final  int pendingCount;
@override@JsonKey(name: 'decline_count') final  int declineCount;
 final  List<AlertRecipientDto> _recipients;
@override@JsonKey() List<AlertRecipientDto> get recipients {
  if (_recipients is EqualUnmodifiableListView) return _recipients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipients);
}


/// Create a copy of AlertDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertDetailDtoCopyWith<_AlertDetailDto> get copyWith => __$AlertDetailDtoCopyWithImpl<_AlertDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.isBroadcast, isBroadcast) || other.isBroadcast == isBroadcast)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.responderId, responderId) || other.responderId == responderId)&&(identical(other.responderName, responderName) || other.responderName == responderName)&&const DeepCollectionEquality().equals(other._targetNames, _targetNames)&&(identical(other.ackCount, ackCount) || other.ackCount == ackCount)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.declineCount, declineCount) || other.declineCount == declineCount)&&const DeepCollectionEquality().equals(other._recipients, _recipients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,isBroadcast,triggeredAt,resolvedAt,responderId,responderName,const DeepCollectionEquality().hash(_targetNames),ackCount,pendingCount,declineCount,const DeepCollectionEquality().hash(_recipients));

@override
String toString() {
  return 'AlertDetailDto(id: $id, type: $type, status: $status, isBroadcast: $isBroadcast, triggeredAt: $triggeredAt, resolvedAt: $resolvedAt, responderId: $responderId, responderName: $responderName, targetNames: $targetNames, ackCount: $ackCount, pendingCount: $pendingCount, declineCount: $declineCount, recipients: $recipients)';
}


}

/// @nodoc
abstract mixin class _$AlertDetailDtoCopyWith<$Res> implements $AlertDetailDtoCopyWith<$Res> {
  factory _$AlertDetailDtoCopyWith(_AlertDetailDto value, $Res Function(_AlertDetailDto) _then) = __$AlertDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String status,@JsonKey(name: 'is_broadcast') bool isBroadcast,@JsonKey(name: 'triggered_at') DateTime triggeredAt,@JsonKey(name: 'resolved_at') DateTime? resolvedAt,@JsonKey(name: 'responder_id') String? responderId,@JsonKey(name: 'responder_name') String? responderName,@JsonKey(name: 'target_names') List<String> targetNames,@JsonKey(name: 'ack_count') int ackCount,@JsonKey(name: 'pending_count') int pendingCount,@JsonKey(name: 'decline_count') int declineCount, List<AlertRecipientDto> recipients
});




}
/// @nodoc
class __$AlertDetailDtoCopyWithImpl<$Res>
    implements _$AlertDetailDtoCopyWith<$Res> {
  __$AlertDetailDtoCopyWithImpl(this._self, this._then);

  final _AlertDetailDto _self;
  final $Res Function(_AlertDetailDto) _then;

/// Create a copy of AlertDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? status = null,Object? isBroadcast = null,Object? triggeredAt = null,Object? resolvedAt = freezed,Object? responderId = freezed,Object? responderName = freezed,Object? targetNames = null,Object? ackCount = null,Object? pendingCount = null,Object? declineCount = null,Object? recipients = null,}) {
  return _then(_AlertDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isBroadcast: null == isBroadcast ? _self.isBroadcast : isBroadcast // ignore: cast_nullable_to_non_nullable
as bool,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,responderId: freezed == responderId ? _self.responderId : responderId // ignore: cast_nullable_to_non_nullable
as String?,responderName: freezed == responderName ? _self.responderName : responderName // ignore: cast_nullable_to_non_nullable
as String?,targetNames: null == targetNames ? _self._targetNames : targetNames // ignore: cast_nullable_to_non_nullable
as List<String>,ackCount: null == ackCount ? _self.ackCount : ackCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,declineCount: null == declineCount ? _self.declineCount : declineCount // ignore: cast_nullable_to_non_nullable
as int,recipients: null == recipients ? _self._recipients : recipients // ignore: cast_nullable_to_non_nullable
as List<AlertRecipientDto>,
  ));
}


}


/// @nodoc
mixin _$RespondAlertRequestDto {

 String get action;
/// Create a copy of RespondAlertRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RespondAlertRequestDtoCopyWith<RespondAlertRequestDto> get copyWith => _$RespondAlertRequestDtoCopyWithImpl<RespondAlertRequestDto>(this as RespondAlertRequestDto, _$identity);

  /// Serializes this RespondAlertRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RespondAlertRequestDto&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'RespondAlertRequestDto(action: $action)';
}


}

/// @nodoc
abstract mixin class $RespondAlertRequestDtoCopyWith<$Res>  {
  factory $RespondAlertRequestDtoCopyWith(RespondAlertRequestDto value, $Res Function(RespondAlertRequestDto) _then) = _$RespondAlertRequestDtoCopyWithImpl;
@useResult
$Res call({
 String action
});




}
/// @nodoc
class _$RespondAlertRequestDtoCopyWithImpl<$Res>
    implements $RespondAlertRequestDtoCopyWith<$Res> {
  _$RespondAlertRequestDtoCopyWithImpl(this._self, this._then);

  final RespondAlertRequestDto _self;
  final $Res Function(RespondAlertRequestDto) _then;

/// Create a copy of RespondAlertRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = null,}) {
  return _then(_self.copyWith(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RespondAlertRequestDto].
extension RespondAlertRequestDtoPatterns on RespondAlertRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RespondAlertRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RespondAlertRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RespondAlertRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _RespondAlertRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RespondAlertRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _RespondAlertRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RespondAlertRequestDto() when $default != null:
return $default(_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String action)  $default,) {final _that = this;
switch (_that) {
case _RespondAlertRequestDto():
return $default(_that.action);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String action)?  $default,) {final _that = this;
switch (_that) {
case _RespondAlertRequestDto() when $default != null:
return $default(_that.action);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RespondAlertRequestDto implements RespondAlertRequestDto {
  const _RespondAlertRequestDto({required this.action});
  factory _RespondAlertRequestDto.fromJson(Map<String, dynamic> json) => _$RespondAlertRequestDtoFromJson(json);

@override final  String action;

/// Create a copy of RespondAlertRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RespondAlertRequestDtoCopyWith<_RespondAlertRequestDto> get copyWith => __$RespondAlertRequestDtoCopyWithImpl<_RespondAlertRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RespondAlertRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RespondAlertRequestDto&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'RespondAlertRequestDto(action: $action)';
}


}

/// @nodoc
abstract mixin class _$RespondAlertRequestDtoCopyWith<$Res> implements $RespondAlertRequestDtoCopyWith<$Res> {
  factory _$RespondAlertRequestDtoCopyWith(_RespondAlertRequestDto value, $Res Function(_RespondAlertRequestDto) _then) = __$RespondAlertRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String action
});




}
/// @nodoc
class __$RespondAlertRequestDtoCopyWithImpl<$Res>
    implements _$RespondAlertRequestDtoCopyWith<$Res> {
  __$RespondAlertRequestDtoCopyWithImpl(this._self, this._then);

  final _RespondAlertRequestDto _self;
  final $Res Function(_RespondAlertRequestDto) _then;

/// Create a copy of RespondAlertRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(_RespondAlertRequestDto(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RespondAlertResponseDto {

@JsonKey(name: 'alert_id') String get alertId; String get status;@JsonKey(name: 'first_response') bool get firstResponse;@JsonKey(name: 'responder_id') String? get responderId;
/// Create a copy of RespondAlertResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RespondAlertResponseDtoCopyWith<RespondAlertResponseDto> get copyWith => _$RespondAlertResponseDtoCopyWithImpl<RespondAlertResponseDto>(this as RespondAlertResponseDto, _$identity);

  /// Serializes this RespondAlertResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RespondAlertResponseDto&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.status, status) || other.status == status)&&(identical(other.firstResponse, firstResponse) || other.firstResponse == firstResponse)&&(identical(other.responderId, responderId) || other.responderId == responderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alertId,status,firstResponse,responderId);

@override
String toString() {
  return 'RespondAlertResponseDto(alertId: $alertId, status: $status, firstResponse: $firstResponse, responderId: $responderId)';
}


}

/// @nodoc
abstract mixin class $RespondAlertResponseDtoCopyWith<$Res>  {
  factory $RespondAlertResponseDtoCopyWith(RespondAlertResponseDto value, $Res Function(RespondAlertResponseDto) _then) = _$RespondAlertResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'alert_id') String alertId, String status,@JsonKey(name: 'first_response') bool firstResponse,@JsonKey(name: 'responder_id') String? responderId
});




}
/// @nodoc
class _$RespondAlertResponseDtoCopyWithImpl<$Res>
    implements $RespondAlertResponseDtoCopyWith<$Res> {
  _$RespondAlertResponseDtoCopyWithImpl(this._self, this._then);

  final RespondAlertResponseDto _self;
  final $Res Function(RespondAlertResponseDto) _then;

/// Create a copy of RespondAlertResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alertId = null,Object? status = null,Object? firstResponse = null,Object? responderId = freezed,}) {
  return _then(_self.copyWith(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,firstResponse: null == firstResponse ? _self.firstResponse : firstResponse // ignore: cast_nullable_to_non_nullable
as bool,responderId: freezed == responderId ? _self.responderId : responderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RespondAlertResponseDto].
extension RespondAlertResponseDtoPatterns on RespondAlertResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RespondAlertResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RespondAlertResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RespondAlertResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _RespondAlertResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RespondAlertResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _RespondAlertResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'alert_id')  String alertId,  String status, @JsonKey(name: 'first_response')  bool firstResponse, @JsonKey(name: 'responder_id')  String? responderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RespondAlertResponseDto() when $default != null:
return $default(_that.alertId,_that.status,_that.firstResponse,_that.responderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'alert_id')  String alertId,  String status, @JsonKey(name: 'first_response')  bool firstResponse, @JsonKey(name: 'responder_id')  String? responderId)  $default,) {final _that = this;
switch (_that) {
case _RespondAlertResponseDto():
return $default(_that.alertId,_that.status,_that.firstResponse,_that.responderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'alert_id')  String alertId,  String status, @JsonKey(name: 'first_response')  bool firstResponse, @JsonKey(name: 'responder_id')  String? responderId)?  $default,) {final _that = this;
switch (_that) {
case _RespondAlertResponseDto() when $default != null:
return $default(_that.alertId,_that.status,_that.firstResponse,_that.responderId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RespondAlertResponseDto implements RespondAlertResponseDto {
  const _RespondAlertResponseDto({@JsonKey(name: 'alert_id') required this.alertId, required this.status, @JsonKey(name: 'first_response') required this.firstResponse, @JsonKey(name: 'responder_id') this.responderId});
  factory _RespondAlertResponseDto.fromJson(Map<String, dynamic> json) => _$RespondAlertResponseDtoFromJson(json);

@override@JsonKey(name: 'alert_id') final  String alertId;
@override final  String status;
@override@JsonKey(name: 'first_response') final  bool firstResponse;
@override@JsonKey(name: 'responder_id') final  String? responderId;

/// Create a copy of RespondAlertResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RespondAlertResponseDtoCopyWith<_RespondAlertResponseDto> get copyWith => __$RespondAlertResponseDtoCopyWithImpl<_RespondAlertResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RespondAlertResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RespondAlertResponseDto&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.status, status) || other.status == status)&&(identical(other.firstResponse, firstResponse) || other.firstResponse == firstResponse)&&(identical(other.responderId, responderId) || other.responderId == responderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alertId,status,firstResponse,responderId);

@override
String toString() {
  return 'RespondAlertResponseDto(alertId: $alertId, status: $status, firstResponse: $firstResponse, responderId: $responderId)';
}


}

/// @nodoc
abstract mixin class _$RespondAlertResponseDtoCopyWith<$Res> implements $RespondAlertResponseDtoCopyWith<$Res> {
  factory _$RespondAlertResponseDtoCopyWith(_RespondAlertResponseDto value, $Res Function(_RespondAlertResponseDto) _then) = __$RespondAlertResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'alert_id') String alertId, String status,@JsonKey(name: 'first_response') bool firstResponse,@JsonKey(name: 'responder_id') String? responderId
});




}
/// @nodoc
class __$RespondAlertResponseDtoCopyWithImpl<$Res>
    implements _$RespondAlertResponseDtoCopyWith<$Res> {
  __$RespondAlertResponseDtoCopyWithImpl(this._self, this._then);

  final _RespondAlertResponseDto _self;
  final $Res Function(_RespondAlertResponseDto) _then;

/// Create a copy of RespondAlertResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alertId = null,Object? status = null,Object? firstResponse = null,Object? responderId = freezed,}) {
  return _then(_RespondAlertResponseDto(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,firstResponse: null == firstResponse ? _self.firstResponse : firstResponse // ignore: cast_nullable_to_non_nullable
as bool,responderId: freezed == responderId ? _self.responderId : responderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
