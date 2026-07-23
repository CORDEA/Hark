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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ActiveAlertViewEventNone value)?  none,TResult Function( ActiveAlertViewEventRespondFailed value)?  respondFailed,TResult Function( ActiveAlertViewEventDismiss value)?  dismiss,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ActiveAlertViewEventNone() when none != null:
return none(_that);case ActiveAlertViewEventRespondFailed() when respondFailed != null:
return respondFailed(_that);case ActiveAlertViewEventDismiss() when dismiss != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ActiveAlertViewEventNone value)  none,required TResult Function( ActiveAlertViewEventRespondFailed value)  respondFailed,required TResult Function( ActiveAlertViewEventDismiss value)  dismiss,}){
final _that = this;
switch (_that) {
case ActiveAlertViewEventNone():
return none(_that);case ActiveAlertViewEventRespondFailed():
return respondFailed(_that);case ActiveAlertViewEventDismiss():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ActiveAlertViewEventNone value)?  none,TResult? Function( ActiveAlertViewEventRespondFailed value)?  respondFailed,TResult? Function( ActiveAlertViewEventDismiss value)?  dismiss,}){
final _that = this;
switch (_that) {
case ActiveAlertViewEventNone() when none != null:
return none(_that);case ActiveAlertViewEventRespondFailed() when respondFailed != null:
return respondFailed(_that);case ActiveAlertViewEventDismiss() when dismiss != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( Object error)?  respondFailed,TResult Function()?  dismiss,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ActiveAlertViewEventNone() when none != null:
return none();case ActiveAlertViewEventRespondFailed() when respondFailed != null:
return respondFailed(_that.error);case ActiveAlertViewEventDismiss() when dismiss != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( Object error)  respondFailed,required TResult Function()  dismiss,}) {final _that = this;
switch (_that) {
case ActiveAlertViewEventNone():
return none();case ActiveAlertViewEventRespondFailed():
return respondFailed(_that.error);case ActiveAlertViewEventDismiss():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( Object error)?  respondFailed,TResult? Function()?  dismiss,}) {final _that = this;
switch (_that) {
case ActiveAlertViewEventNone() when none != null:
return none();case ActiveAlertViewEventRespondFailed() when respondFailed != null:
return respondFailed(_that.error);case ActiveAlertViewEventDismiss() when dismiss != null:
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


class ActiveAlertViewEventRespondFailed implements ActiveAlertViewEvent {
  const ActiveAlertViewEventRespondFailed(this.error);
  

 final  Object error;

/// Create a copy of ActiveAlertViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveAlertViewEventRespondFailedCopyWith<ActiveAlertViewEventRespondFailed> get copyWith => _$ActiveAlertViewEventRespondFailedCopyWithImpl<ActiveAlertViewEventRespondFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveAlertViewEventRespondFailed&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ActiveAlertViewEvent.respondFailed(error: $error)';
}


}

/// @nodoc
abstract mixin class $ActiveAlertViewEventRespondFailedCopyWith<$Res> implements $ActiveAlertViewEventCopyWith<$Res> {
  factory $ActiveAlertViewEventRespondFailedCopyWith(ActiveAlertViewEventRespondFailed value, $Res Function(ActiveAlertViewEventRespondFailed) _then) = _$ActiveAlertViewEventRespondFailedCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$ActiveAlertViewEventRespondFailedCopyWithImpl<$Res>
    implements $ActiveAlertViewEventRespondFailedCopyWith<$Res> {
  _$ActiveAlertViewEventRespondFailedCopyWithImpl(this._self, this._then);

  final ActiveAlertViewEventRespondFailed _self;
  final $Res Function(ActiveAlertViewEventRespondFailed) _then;

/// Create a copy of ActiveAlertViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ActiveAlertViewEventRespondFailed(
null == error ? _self.error : error ,
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

 String get alertId; String get serverUrl; String get type; DateTime get triggeredAt; bool get isSending; ActiveAlertOutcome? get outcome; String? get resolvedByName; List<AlertDetailRecipientViewState> get acknowledged; List<AlertDetailRecipientViewState> get declined; List<AlertDetailRecipientViewState> get pending; ActiveAlertViewEvent get event;
/// Create a copy of ActiveAlertViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveAlertViewStateCopyWith<ActiveAlertViewState> get copyWith => _$ActiveAlertViewStateCopyWithImpl<ActiveAlertViewState>(this as ActiveAlertViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveAlertViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.resolvedByName, resolvedByName) || other.resolvedByName == resolvedByName)&&const DeepCollectionEquality().equals(other.acknowledged, acknowledged)&&const DeepCollectionEquality().equals(other.declined, declined)&&const DeepCollectionEquality().equals(other.pending, pending)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,serverUrl,type,triggeredAt,isSending,outcome,resolvedByName,const DeepCollectionEquality().hash(acknowledged),const DeepCollectionEquality().hash(declined),const DeepCollectionEquality().hash(pending),event);

@override
String toString() {
  return 'ActiveAlertViewState(alertId: $alertId, serverUrl: $serverUrl, type: $type, triggeredAt: $triggeredAt, isSending: $isSending, outcome: $outcome, resolvedByName: $resolvedByName, acknowledged: $acknowledged, declined: $declined, pending: $pending, event: $event)';
}


}

/// @nodoc
abstract mixin class $ActiveAlertViewStateCopyWith<$Res>  {
  factory $ActiveAlertViewStateCopyWith(ActiveAlertViewState value, $Res Function(ActiveAlertViewState) _then) = _$ActiveAlertViewStateCopyWithImpl;
@useResult
$Res call({
 String alertId, String serverUrl, String type, DateTime triggeredAt, bool isSending, ActiveAlertOutcome? outcome, String? resolvedByName, List<AlertDetailRecipientViewState> acknowledged, List<AlertDetailRecipientViewState> declined, List<AlertDetailRecipientViewState> pending, ActiveAlertViewEvent event
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
@pragma('vm:prefer-inline') @override $Res call({Object? alertId = null,Object? serverUrl = null,Object? type = null,Object? triggeredAt = null,Object? isSending = null,Object? outcome = freezed,Object? resolvedByName = freezed,Object? acknowledged = null,Object? declined = null,Object? pending = null,Object? event = null,}) {
  return _then(_self.copyWith(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActiveAlertOutcome?,resolvedByName: freezed == resolvedByName ? _self.resolvedByName : resolvedByName // ignore: cast_nullable_to_non_nullable
as String?,acknowledged: null == acknowledged ? _self.acknowledged : acknowledged // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,declined: null == declined ? _self.declined : declined // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String alertId,  String serverUrl,  String type,  DateTime triggeredAt,  bool isSending,  ActiveAlertOutcome? outcome,  String? resolvedByName,  List<AlertDetailRecipientViewState> acknowledged,  List<AlertDetailRecipientViewState> declined,  List<AlertDetailRecipientViewState> pending,  ActiveAlertViewEvent event)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveAlertViewState() when $default != null:
return $default(_that.alertId,_that.serverUrl,_that.type,_that.triggeredAt,_that.isSending,_that.outcome,_that.resolvedByName,_that.acknowledged,_that.declined,_that.pending,_that.event);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String alertId,  String serverUrl,  String type,  DateTime triggeredAt,  bool isSending,  ActiveAlertOutcome? outcome,  String? resolvedByName,  List<AlertDetailRecipientViewState> acknowledged,  List<AlertDetailRecipientViewState> declined,  List<AlertDetailRecipientViewState> pending,  ActiveAlertViewEvent event)  $default,) {final _that = this;
switch (_that) {
case _ActiveAlertViewState():
return $default(_that.alertId,_that.serverUrl,_that.type,_that.triggeredAt,_that.isSending,_that.outcome,_that.resolvedByName,_that.acknowledged,_that.declined,_that.pending,_that.event);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String alertId,  String serverUrl,  String type,  DateTime triggeredAt,  bool isSending,  ActiveAlertOutcome? outcome,  String? resolvedByName,  List<AlertDetailRecipientViewState> acknowledged,  List<AlertDetailRecipientViewState> declined,  List<AlertDetailRecipientViewState> pending,  ActiveAlertViewEvent event)?  $default,) {final _that = this;
switch (_that) {
case _ActiveAlertViewState() when $default != null:
return $default(_that.alertId,_that.serverUrl,_that.type,_that.triggeredAt,_that.isSending,_that.outcome,_that.resolvedByName,_that.acknowledged,_that.declined,_that.pending,_that.event);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveAlertViewState extends ActiveAlertViewState {
  const _ActiveAlertViewState({required this.alertId, required this.serverUrl, required this.type, required this.triggeredAt, this.isSending = false, this.outcome, this.resolvedByName, final  List<AlertDetailRecipientViewState> acknowledged = const <AlertDetailRecipientViewState>[], final  List<AlertDetailRecipientViewState> declined = const <AlertDetailRecipientViewState>[], final  List<AlertDetailRecipientViewState> pending = const <AlertDetailRecipientViewState>[], this.event = const ActiveAlertViewEvent.none()}): _acknowledged = acknowledged,_declined = declined,_pending = pending,super._();
  

@override final  String alertId;
@override final  String serverUrl;
@override final  String type;
@override final  DateTime triggeredAt;
@override@JsonKey() final  bool isSending;
@override final  ActiveAlertOutcome? outcome;
@override final  String? resolvedByName;
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

@override@JsonKey() final  ActiveAlertViewEvent event;

/// Create a copy of ActiveAlertViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveAlertViewStateCopyWith<_ActiveAlertViewState> get copyWith => __$ActiveAlertViewStateCopyWithImpl<_ActiveAlertViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveAlertViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.resolvedByName, resolvedByName) || other.resolvedByName == resolvedByName)&&const DeepCollectionEquality().equals(other._acknowledged, _acknowledged)&&const DeepCollectionEquality().equals(other._declined, _declined)&&const DeepCollectionEquality().equals(other._pending, _pending)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,serverUrl,type,triggeredAt,isSending,outcome,resolvedByName,const DeepCollectionEquality().hash(_acknowledged),const DeepCollectionEquality().hash(_declined),const DeepCollectionEquality().hash(_pending),event);

@override
String toString() {
  return 'ActiveAlertViewState(alertId: $alertId, serverUrl: $serverUrl, type: $type, triggeredAt: $triggeredAt, isSending: $isSending, outcome: $outcome, resolvedByName: $resolvedByName, acknowledged: $acknowledged, declined: $declined, pending: $pending, event: $event)';
}


}

/// @nodoc
abstract mixin class _$ActiveAlertViewStateCopyWith<$Res> implements $ActiveAlertViewStateCopyWith<$Res> {
  factory _$ActiveAlertViewStateCopyWith(_ActiveAlertViewState value, $Res Function(_ActiveAlertViewState) _then) = __$ActiveAlertViewStateCopyWithImpl;
@override @useResult
$Res call({
 String alertId, String serverUrl, String type, DateTime triggeredAt, bool isSending, ActiveAlertOutcome? outcome, String? resolvedByName, List<AlertDetailRecipientViewState> acknowledged, List<AlertDetailRecipientViewState> declined, List<AlertDetailRecipientViewState> pending, ActiveAlertViewEvent event
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
@override @pragma('vm:prefer-inline') $Res call({Object? alertId = null,Object? serverUrl = null,Object? type = null,Object? triggeredAt = null,Object? isSending = null,Object? outcome = freezed,Object? resolvedByName = freezed,Object? acknowledged = null,Object? declined = null,Object? pending = null,Object? event = null,}) {
  return _then(_ActiveAlertViewState(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActiveAlertOutcome?,resolvedByName: freezed == resolvedByName ? _self.resolvedByName : resolvedByName // ignore: cast_nullable_to_non_nullable
as String?,acknowledged: null == acknowledged ? _self._acknowledged : acknowledged // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,declined: null == declined ? _self._declined : declined // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,pending: null == pending ? _self._pending : pending // ignore: cast_nullable_to_non_nullable
as List<AlertDetailRecipientViewState>,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
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
