// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_alert_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveAlertViewEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveAlertViewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveAlertViewEvent()';
}


}

/// @nodoc
class $ActiveAlertViewEventCopyWith<$Res>  {
$ActiveAlertViewEventCopyWith(ActiveAlertViewEvent _, $Res Function(ActiveAlertViewEvent) __);
}


/// Adds pattern-matching-related methods to [ActiveAlertViewEvent].
extension ActiveAlertViewEventPatterns on ActiveAlertViewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ActiveAlertViewEventNone value)?  none,TResult Function( ActiveAlertViewEventShowSnackBar value)?  showSnackBar,TResult Function( ActiveAlertViewEventDismiss value)?  dismiss,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ActiveAlertViewEventNone() when none != null:
return none(_that);case ActiveAlertViewEventShowSnackBar() when showSnackBar != null:
return showSnackBar(_that);case ActiveAlertViewEventDismiss() when dismiss != null:
return dismiss(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ActiveAlertViewEventNone value)  none,required TResult Function( ActiveAlertViewEventShowSnackBar value)  showSnackBar,required TResult Function( ActiveAlertViewEventDismiss value)  dismiss,}){
final _that = this;
switch (_that) {
case ActiveAlertViewEventNone():
return none(_that);case ActiveAlertViewEventShowSnackBar():
return showSnackBar(_that);case ActiveAlertViewEventDismiss():
return dismiss(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ActiveAlertViewEventNone value)?  none,TResult? Function( ActiveAlertViewEventShowSnackBar value)?  showSnackBar,TResult? Function( ActiveAlertViewEventDismiss value)?  dismiss,}){
final _that = this;
switch (_that) {
case ActiveAlertViewEventNone() when none != null:
return none(_that);case ActiveAlertViewEventShowSnackBar() when showSnackBar != null:
return showSnackBar(_that);case ActiveAlertViewEventDismiss() when dismiss != null:
return dismiss(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( String message)?  showSnackBar,TResult Function()?  dismiss,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ActiveAlertViewEventNone() when none != null:
return none();case ActiveAlertViewEventShowSnackBar() when showSnackBar != null:
return showSnackBar(_that.message);case ActiveAlertViewEventDismiss() when dismiss != null:
return dismiss();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( String message)  showSnackBar,required TResult Function()  dismiss,}) {final _that = this;
switch (_that) {
case ActiveAlertViewEventNone():
return none();case ActiveAlertViewEventShowSnackBar():
return showSnackBar(_that.message);case ActiveAlertViewEventDismiss():
return dismiss();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( String message)?  showSnackBar,TResult? Function()?  dismiss,}) {final _that = this;
switch (_that) {
case ActiveAlertViewEventNone() when none != null:
return none();case ActiveAlertViewEventShowSnackBar() when showSnackBar != null:
return showSnackBar(_that.message);case ActiveAlertViewEventDismiss() when dismiss != null:
return dismiss();case _:
  return null;

}
}

}

/// @nodoc


class ActiveAlertViewEventNone implements ActiveAlertViewEvent {
  const ActiveAlertViewEventNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveAlertViewEventNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveAlertViewEvent.none()';
}


}




/// @nodoc


class ActiveAlertViewEventShowSnackBar implements ActiveAlertViewEvent {
  const ActiveAlertViewEventShowSnackBar(this.message);
  

 final  String message;

/// Create a copy of ActiveAlertViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveAlertViewEventShowSnackBarCopyWith<ActiveAlertViewEventShowSnackBar> get copyWith => _$ActiveAlertViewEventShowSnackBarCopyWithImpl<ActiveAlertViewEventShowSnackBar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveAlertViewEventShowSnackBar&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ActiveAlertViewEvent.showSnackBar(message: $message)';
}


}

/// @nodoc
abstract mixin class $ActiveAlertViewEventShowSnackBarCopyWith<$Res> implements $ActiveAlertViewEventCopyWith<$Res> {
  factory $ActiveAlertViewEventShowSnackBarCopyWith(ActiveAlertViewEventShowSnackBar value, $Res Function(ActiveAlertViewEventShowSnackBar) _then) = _$ActiveAlertViewEventShowSnackBarCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ActiveAlertViewEventShowSnackBarCopyWithImpl<$Res>
    implements $ActiveAlertViewEventShowSnackBarCopyWith<$Res> {
  _$ActiveAlertViewEventShowSnackBarCopyWithImpl(this._self, this._then);

  final ActiveAlertViewEventShowSnackBar _self;
  final $Res Function(ActiveAlertViewEventShowSnackBar) _then;

/// Create a copy of ActiveAlertViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ActiveAlertViewEventShowSnackBar(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ActiveAlertViewEventDismiss implements ActiveAlertViewEvent {
  const ActiveAlertViewEventDismiss();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveAlertViewEventDismiss);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveAlertViewEvent.dismiss()';
}


}




/// @nodoc
mixin _$ActiveAlertViewState {

 String get alertId; String get orgId; String get type; DateTime get triggeredAt; bool get isSending; ActiveAlertOutcome? get outcome; String? get resolvedByName; ActiveAlertViewEvent get event;
/// Create a copy of ActiveAlertViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveAlertViewStateCopyWith<ActiveAlertViewState> get copyWith => _$ActiveAlertViewStateCopyWithImpl<ActiveAlertViewState>(this as ActiveAlertViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveAlertViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.type, type) || other.type == type)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.resolvedByName, resolvedByName) || other.resolvedByName == resolvedByName)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,orgId,type,triggeredAt,isSending,outcome,resolvedByName,event);

@override
String toString() {
  return 'ActiveAlertViewState(alertId: $alertId, orgId: $orgId, type: $type, triggeredAt: $triggeredAt, isSending: $isSending, outcome: $outcome, resolvedByName: $resolvedByName, event: $event)';
}


}

/// @nodoc
abstract mixin class $ActiveAlertViewStateCopyWith<$Res>  {
  factory $ActiveAlertViewStateCopyWith(ActiveAlertViewState value, $Res Function(ActiveAlertViewState) _then) = _$ActiveAlertViewStateCopyWithImpl;
@useResult
$Res call({
 String alertId, String orgId, String type, DateTime triggeredAt, bool isSending, ActiveAlertOutcome? outcome, String? resolvedByName, ActiveAlertViewEvent event
});


$ActiveAlertViewEventCopyWith<$Res> get event;

}
/// @nodoc
class _$ActiveAlertViewStateCopyWithImpl<$Res>
    implements $ActiveAlertViewStateCopyWith<$Res> {
  _$ActiveAlertViewStateCopyWithImpl(this._self, this._then);

  final ActiveAlertViewState _self;
  final $Res Function(ActiveAlertViewState) _then;

/// Create a copy of ActiveAlertViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alertId = null,Object? orgId = null,Object? type = null,Object? triggeredAt = null,Object? isSending = null,Object? outcome = freezed,Object? resolvedByName = freezed,Object? event = null,}) {
  return _then(_self.copyWith(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActiveAlertOutcome?,resolvedByName: freezed == resolvedByName ? _self.resolvedByName : resolvedByName // ignore: cast_nullable_to_non_nullable
as String?,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ActiveAlertViewEvent,
  ));
}
/// Create a copy of ActiveAlertViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActiveAlertViewEventCopyWith<$Res> get event {
  
  return $ActiveAlertViewEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActiveAlertViewState].
extension ActiveAlertViewStatePatterns on ActiveAlertViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveAlertViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveAlertViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveAlertViewState value)  $default,){
final _that = this;
switch (_that) {
case _ActiveAlertViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveAlertViewState value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveAlertViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String alertId,  String orgId,  String type,  DateTime triggeredAt,  bool isSending,  ActiveAlertOutcome? outcome,  String? resolvedByName,  ActiveAlertViewEvent event)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveAlertViewState() when $default != null:
return $default(_that.alertId,_that.orgId,_that.type,_that.triggeredAt,_that.isSending,_that.outcome,_that.resolvedByName,_that.event);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String alertId,  String orgId,  String type,  DateTime triggeredAt,  bool isSending,  ActiveAlertOutcome? outcome,  String? resolvedByName,  ActiveAlertViewEvent event)  $default,) {final _that = this;
switch (_that) {
case _ActiveAlertViewState():
return $default(_that.alertId,_that.orgId,_that.type,_that.triggeredAt,_that.isSending,_that.outcome,_that.resolvedByName,_that.event);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String alertId,  String orgId,  String type,  DateTime triggeredAt,  bool isSending,  ActiveAlertOutcome? outcome,  String? resolvedByName,  ActiveAlertViewEvent event)?  $default,) {final _that = this;
switch (_that) {
case _ActiveAlertViewState() when $default != null:
return $default(_that.alertId,_that.orgId,_that.type,_that.triggeredAt,_that.isSending,_that.outcome,_that.resolvedByName,_that.event);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveAlertViewState extends ActiveAlertViewState {
  const _ActiveAlertViewState({required this.alertId, required this.orgId, required this.type, required this.triggeredAt, this.isSending = false, this.outcome, this.resolvedByName, this.event = const ActiveAlertViewEvent.none()}): super._();
  

@override final  String alertId;
@override final  String orgId;
@override final  String type;
@override final  DateTime triggeredAt;
@override@JsonKey() final  bool isSending;
@override final  ActiveAlertOutcome? outcome;
@override final  String? resolvedByName;
@override@JsonKey() final  ActiveAlertViewEvent event;

/// Create a copy of ActiveAlertViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveAlertViewStateCopyWith<_ActiveAlertViewState> get copyWith => __$ActiveAlertViewStateCopyWithImpl<_ActiveAlertViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveAlertViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.type, type) || other.type == type)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.resolvedByName, resolvedByName) || other.resolvedByName == resolvedByName)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,orgId,type,triggeredAt,isSending,outcome,resolvedByName,event);

@override
String toString() {
  return 'ActiveAlertViewState(alertId: $alertId, orgId: $orgId, type: $type, triggeredAt: $triggeredAt, isSending: $isSending, outcome: $outcome, resolvedByName: $resolvedByName, event: $event)';
}


}

/// @nodoc
abstract mixin class _$ActiveAlertViewStateCopyWith<$Res> implements $ActiveAlertViewStateCopyWith<$Res> {
  factory _$ActiveAlertViewStateCopyWith(_ActiveAlertViewState value, $Res Function(_ActiveAlertViewState) _then) = __$ActiveAlertViewStateCopyWithImpl;
@override @useResult
$Res call({
 String alertId, String orgId, String type, DateTime triggeredAt, bool isSending, ActiveAlertOutcome? outcome, String? resolvedByName, ActiveAlertViewEvent event
});


@override $ActiveAlertViewEventCopyWith<$Res> get event;

}
/// @nodoc
class __$ActiveAlertViewStateCopyWithImpl<$Res>
    implements _$ActiveAlertViewStateCopyWith<$Res> {
  __$ActiveAlertViewStateCopyWithImpl(this._self, this._then);

  final _ActiveAlertViewState _self;
  final $Res Function(_ActiveAlertViewState) _then;

/// Create a copy of ActiveAlertViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alertId = null,Object? orgId = null,Object? type = null,Object? triggeredAt = null,Object? isSending = null,Object? outcome = freezed,Object? resolvedByName = freezed,Object? event = null,}) {
  return _then(_ActiveAlertViewState(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActiveAlertOutcome?,resolvedByName: freezed == resolvedByName ? _self.resolvedByName : resolvedByName // ignore: cast_nullable_to_non_nullable
as String?,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ActiveAlertViewEvent,
  ));
}

/// Create a copy of ActiveAlertViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActiveAlertViewEventCopyWith<$Res> get event {
  
  return $ActiveAlertViewEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

// dart format on
