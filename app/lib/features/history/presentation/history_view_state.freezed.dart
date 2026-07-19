// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryRowViewState {

 String get alertId; String get type; DateTime get triggeredAt; HistoryRowBadge get badge; DateTime? get badgeAt;
/// Create a copy of HistoryRowViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryRowViewStateCopyWith<HistoryRowViewState> get copyWith => _$HistoryRowViewStateCopyWithImpl<HistoryRowViewState>(this as HistoryRowViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryRowViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.type, type) || other.type == type)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.badgeAt, badgeAt) || other.badgeAt == badgeAt));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,type,triggeredAt,badge,badgeAt);

@override
String toString() {
  return 'HistoryRowViewState(alertId: $alertId, type: $type, triggeredAt: $triggeredAt, badge: $badge, badgeAt: $badgeAt)';
}


}

/// @nodoc
abstract mixin class $HistoryRowViewStateCopyWith<$Res>  {
  factory $HistoryRowViewStateCopyWith(HistoryRowViewState value, $Res Function(HistoryRowViewState) _then) = _$HistoryRowViewStateCopyWithImpl;
@useResult
$Res call({
 String alertId, String type, DateTime triggeredAt, HistoryRowBadge badge, DateTime? badgeAt
});




}
/// @nodoc
class _$HistoryRowViewStateCopyWithImpl<$Res>
    implements $HistoryRowViewStateCopyWith<$Res> {
  _$HistoryRowViewStateCopyWithImpl(this._self, this._then);

  final HistoryRowViewState _self;
  final $Res Function(HistoryRowViewState) _then;

/// Create a copy of HistoryRowViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alertId = null,Object? type = null,Object? triggeredAt = null,Object? badge = null,Object? badgeAt = freezed,}) {
  return _then(_self.copyWith(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as HistoryRowBadge,badgeAt: freezed == badgeAt ? _self.badgeAt : badgeAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryRowViewState].
extension HistoryRowViewStatePatterns on HistoryRowViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryRowViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryRowViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryRowViewState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryRowViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryRowViewState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryRowViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String alertId,  String type,  DateTime triggeredAt,  HistoryRowBadge badge,  DateTime? badgeAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryRowViewState() when $default != null:
return $default(_that.alertId,_that.type,_that.triggeredAt,_that.badge,_that.badgeAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String alertId,  String type,  DateTime triggeredAt,  HistoryRowBadge badge,  DateTime? badgeAt)  $default,) {final _that = this;
switch (_that) {
case _HistoryRowViewState():
return $default(_that.alertId,_that.type,_that.triggeredAt,_that.badge,_that.badgeAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String alertId,  String type,  DateTime triggeredAt,  HistoryRowBadge badge,  DateTime? badgeAt)?  $default,) {final _that = this;
switch (_that) {
case _HistoryRowViewState() when $default != null:
return $default(_that.alertId,_that.type,_that.triggeredAt,_that.badge,_that.badgeAt);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryRowViewState implements HistoryRowViewState {
  const _HistoryRowViewState({required this.alertId, required this.type, required this.triggeredAt, required this.badge, this.badgeAt});
  

@override final  String alertId;
@override final  String type;
@override final  DateTime triggeredAt;
@override final  HistoryRowBadge badge;
@override final  DateTime? badgeAt;

/// Create a copy of HistoryRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryRowViewStateCopyWith<_HistoryRowViewState> get copyWith => __$HistoryRowViewStateCopyWithImpl<_HistoryRowViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryRowViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.type, type) || other.type == type)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.badgeAt, badgeAt) || other.badgeAt == badgeAt));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,type,triggeredAt,badge,badgeAt);

@override
String toString() {
  return 'HistoryRowViewState(alertId: $alertId, type: $type, triggeredAt: $triggeredAt, badge: $badge, badgeAt: $badgeAt)';
}


}

/// @nodoc
abstract mixin class _$HistoryRowViewStateCopyWith<$Res> implements $HistoryRowViewStateCopyWith<$Res> {
  factory _$HistoryRowViewStateCopyWith(_HistoryRowViewState value, $Res Function(_HistoryRowViewState) _then) = __$HistoryRowViewStateCopyWithImpl;
@override @useResult
$Res call({
 String alertId, String type, DateTime triggeredAt, HistoryRowBadge badge, DateTime? badgeAt
});




}
/// @nodoc
class __$HistoryRowViewStateCopyWithImpl<$Res>
    implements _$HistoryRowViewStateCopyWith<$Res> {
  __$HistoryRowViewStateCopyWithImpl(this._self, this._then);

  final _HistoryRowViewState _self;
  final $Res Function(_HistoryRowViewState) _then;

/// Create a copy of HistoryRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alertId = null,Object? type = null,Object? triggeredAt = null,Object? badge = null,Object? badgeAt = freezed,}) {
  return _then(_HistoryRowViewState(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as HistoryRowBadge,badgeAt: freezed == badgeAt ? _self.badgeAt : badgeAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$HistoryViewEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryViewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryViewEvent()';
}


}

/// @nodoc
class $HistoryViewEventCopyWith<$Res>  {
$HistoryViewEventCopyWith(HistoryViewEvent _, $Res Function(HistoryViewEvent) __);
}


/// Adds pattern-matching-related methods to [HistoryViewEvent].
extension HistoryViewEventPatterns on HistoryViewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HistoryViewEventNone value)?  none,TResult Function( HistoryViewEventLeaveFailed value)?  leaveFailed,TResult Function( HistoryViewEventNavigateToOrgs value)?  navigateToOrgs,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HistoryViewEventNone() when none != null:
return none(_that);case HistoryViewEventLeaveFailed() when leaveFailed != null:
return leaveFailed(_that);case HistoryViewEventNavigateToOrgs() when navigateToOrgs != null:
return navigateToOrgs(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HistoryViewEventNone value)  none,required TResult Function( HistoryViewEventLeaveFailed value)  leaveFailed,required TResult Function( HistoryViewEventNavigateToOrgs value)  navigateToOrgs,}){
final _that = this;
switch (_that) {
case HistoryViewEventNone():
return none(_that);case HistoryViewEventLeaveFailed():
return leaveFailed(_that);case HistoryViewEventNavigateToOrgs():
return navigateToOrgs(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HistoryViewEventNone value)?  none,TResult? Function( HistoryViewEventLeaveFailed value)?  leaveFailed,TResult? Function( HistoryViewEventNavigateToOrgs value)?  navigateToOrgs,}){
final _that = this;
switch (_that) {
case HistoryViewEventNone() when none != null:
return none(_that);case HistoryViewEventLeaveFailed() when leaveFailed != null:
return leaveFailed(_that);case HistoryViewEventNavigateToOrgs() when navigateToOrgs != null:
return navigateToOrgs(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( Object error)?  leaveFailed,TResult Function()?  navigateToOrgs,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HistoryViewEventNone() when none != null:
return none();case HistoryViewEventLeaveFailed() when leaveFailed != null:
return leaveFailed(_that.error);case HistoryViewEventNavigateToOrgs() when navigateToOrgs != null:
return navigateToOrgs();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( Object error)  leaveFailed,required TResult Function()  navigateToOrgs,}) {final _that = this;
switch (_that) {
case HistoryViewEventNone():
return none();case HistoryViewEventLeaveFailed():
return leaveFailed(_that.error);case HistoryViewEventNavigateToOrgs():
return navigateToOrgs();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( Object error)?  leaveFailed,TResult? Function()?  navigateToOrgs,}) {final _that = this;
switch (_that) {
case HistoryViewEventNone() when none != null:
return none();case HistoryViewEventLeaveFailed() when leaveFailed != null:
return leaveFailed(_that.error);case HistoryViewEventNavigateToOrgs() when navigateToOrgs != null:
return navigateToOrgs();case _:
  return null;

}
}

}

/// @nodoc


class HistoryViewEventNone implements HistoryViewEvent {
  const HistoryViewEventNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryViewEventNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryViewEvent.none()';
}


}




/// @nodoc


class HistoryViewEventLeaveFailed implements HistoryViewEvent {
  const HistoryViewEventLeaveFailed(this.error);
  

 final  Object error;

/// Create a copy of HistoryViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryViewEventLeaveFailedCopyWith<HistoryViewEventLeaveFailed> get copyWith => _$HistoryViewEventLeaveFailedCopyWithImpl<HistoryViewEventLeaveFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryViewEventLeaveFailed&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'HistoryViewEvent.leaveFailed(error: $error)';
}


}

/// @nodoc
abstract mixin class $HistoryViewEventLeaveFailedCopyWith<$Res> implements $HistoryViewEventCopyWith<$Res> {
  factory $HistoryViewEventLeaveFailedCopyWith(HistoryViewEventLeaveFailed value, $Res Function(HistoryViewEventLeaveFailed) _then) = _$HistoryViewEventLeaveFailedCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$HistoryViewEventLeaveFailedCopyWithImpl<$Res>
    implements $HistoryViewEventLeaveFailedCopyWith<$Res> {
  _$HistoryViewEventLeaveFailedCopyWithImpl(this._self, this._then);

  final HistoryViewEventLeaveFailed _self;
  final $Res Function(HistoryViewEventLeaveFailed) _then;

/// Create a copy of HistoryViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(HistoryViewEventLeaveFailed(
null == error ? _self.error : error ,
  ));
}


}

/// @nodoc


class HistoryViewEventNavigateToOrgs implements HistoryViewEvent {
  const HistoryViewEventNavigateToOrgs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryViewEventNavigateToOrgs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryViewEvent.navigateToOrgs()';
}


}




/// @nodoc
mixin _$HistoryViewState {

 String get orgName; List<HistoryRowViewState> get rows; bool get isLeaving; HistoryViewEvent get event;
/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryViewStateCopyWith<HistoryViewState> get copyWith => _$HistoryViewStateCopyWithImpl<HistoryViewState>(this as HistoryViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryViewState&&(identical(other.orgName, orgName) || other.orgName == orgName)&&const DeepCollectionEquality().equals(other.rows, rows)&&(identical(other.isLeaving, isLeaving) || other.isLeaving == isLeaving)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,orgName,const DeepCollectionEquality().hash(rows),isLeaving,event);

@override
String toString() {
  return 'HistoryViewState(orgName: $orgName, rows: $rows, isLeaving: $isLeaving, event: $event)';
}


}

/// @nodoc
abstract mixin class $HistoryViewStateCopyWith<$Res>  {
  factory $HistoryViewStateCopyWith(HistoryViewState value, $Res Function(HistoryViewState) _then) = _$HistoryViewStateCopyWithImpl;
@useResult
$Res call({
 String orgName, List<HistoryRowViewState> rows, bool isLeaving, HistoryViewEvent event
});


$HistoryViewEventCopyWith<$Res> get event;

}
/// @nodoc
class _$HistoryViewStateCopyWithImpl<$Res>
    implements $HistoryViewStateCopyWith<$Res> {
  _$HistoryViewStateCopyWithImpl(this._self, this._then);

  final HistoryViewState _self;
  final $Res Function(HistoryViewState) _then;

/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgName = null,Object? rows = null,Object? isLeaving = null,Object? event = null,}) {
  return _then(_self.copyWith(
orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<HistoryRowViewState>,isLeaving: null == isLeaving ? _self.isLeaving : isLeaving // ignore: cast_nullable_to_non_nullable
as bool,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as HistoryViewEvent,
  ));
}
/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryViewEventCopyWith<$Res> get event {
  
  return $HistoryViewEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryViewState].
extension HistoryViewStatePatterns on HistoryViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryViewState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryViewState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orgName,  List<HistoryRowViewState> rows,  bool isLeaving,  HistoryViewEvent event)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryViewState() when $default != null:
return $default(_that.orgName,_that.rows,_that.isLeaving,_that.event);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orgName,  List<HistoryRowViewState> rows,  bool isLeaving,  HistoryViewEvent event)  $default,) {final _that = this;
switch (_that) {
case _HistoryViewState():
return $default(_that.orgName,_that.rows,_that.isLeaving,_that.event);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orgName,  List<HistoryRowViewState> rows,  bool isLeaving,  HistoryViewEvent event)?  $default,) {final _that = this;
switch (_that) {
case _HistoryViewState() when $default != null:
return $default(_that.orgName,_that.rows,_that.isLeaving,_that.event);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryViewState implements HistoryViewState {
  const _HistoryViewState({required this.orgName, required final  List<HistoryRowViewState> rows, this.isLeaving = false, this.event = const HistoryViewEvent.none()}): _rows = rows;
  

@override final  String orgName;
 final  List<HistoryRowViewState> _rows;
@override List<HistoryRowViewState> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}

@override@JsonKey() final  bool isLeaving;
@override@JsonKey() final  HistoryViewEvent event;

/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryViewStateCopyWith<_HistoryViewState> get copyWith => __$HistoryViewStateCopyWithImpl<_HistoryViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryViewState&&(identical(other.orgName, orgName) || other.orgName == orgName)&&const DeepCollectionEquality().equals(other._rows, _rows)&&(identical(other.isLeaving, isLeaving) || other.isLeaving == isLeaving)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,orgName,const DeepCollectionEquality().hash(_rows),isLeaving,event);

@override
String toString() {
  return 'HistoryViewState(orgName: $orgName, rows: $rows, isLeaving: $isLeaving, event: $event)';
}


}

/// @nodoc
abstract mixin class _$HistoryViewStateCopyWith<$Res> implements $HistoryViewStateCopyWith<$Res> {
  factory _$HistoryViewStateCopyWith(_HistoryViewState value, $Res Function(_HistoryViewState) _then) = __$HistoryViewStateCopyWithImpl;
@override @useResult
$Res call({
 String orgName, List<HistoryRowViewState> rows, bool isLeaving, HistoryViewEvent event
});


@override $HistoryViewEventCopyWith<$Res> get event;

}
/// @nodoc
class __$HistoryViewStateCopyWithImpl<$Res>
    implements _$HistoryViewStateCopyWith<$Res> {
  __$HistoryViewStateCopyWithImpl(this._self, this._then);

  final _HistoryViewState _self;
  final $Res Function(_HistoryViewState) _then;

/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgName = null,Object? rows = null,Object? isLeaving = null,Object? event = null,}) {
  return _then(_HistoryViewState(
orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<HistoryRowViewState>,isLeaving: null == isLeaving ? _self.isLeaving : isLeaving // ignore: cast_nullable_to_non_nullable
as bool,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as HistoryViewEvent,
  ));
}

/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryViewEventCopyWith<$Res> get event {
  
  return $HistoryViewEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

// dart format on
