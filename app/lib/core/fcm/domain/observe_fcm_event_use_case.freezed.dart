// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'observe_fcm_event_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FcmEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FcmEvent()';
}


}

/// @nodoc
class $FcmEventCopyWith<$Res>  {
$FcmEventCopyWith(FcmEvent _, $Res Function(FcmEvent) __);
}


/// Adds pattern-matching-related methods to [FcmEvent].
extension FcmEventPatterns on FcmEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FcmEventNone value)?  none,TResult Function( FcmEventAlertArrived value)?  alertArrived,TResult Function( FcmEventAlertResolved value)?  alertResolved,TResult Function( FcmEventTest value)?  test,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FcmEventNone() when none != null:
return none(_that);case FcmEventAlertArrived() when alertArrived != null:
return alertArrived(_that);case FcmEventAlertResolved() when alertResolved != null:
return alertResolved(_that);case FcmEventTest() when test != null:
return test(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FcmEventNone value)  none,required TResult Function( FcmEventAlertArrived value)  alertArrived,required TResult Function( FcmEventAlertResolved value)  alertResolved,required TResult Function( FcmEventTest value)  test,}){
final _that = this;
switch (_that) {
case FcmEventNone():
return none(_that);case FcmEventAlertArrived():
return alertArrived(_that);case FcmEventAlertResolved():
return alertResolved(_that);case FcmEventTest():
return test(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FcmEventNone value)?  none,TResult? Function( FcmEventAlertArrived value)?  alertArrived,TResult? Function( FcmEventAlertResolved value)?  alertResolved,TResult? Function( FcmEventTest value)?  test,}){
final _that = this;
switch (_that) {
case FcmEventNone() when none != null:
return none(_that);case FcmEventAlertArrived() when alertArrived != null:
return alertArrived(_that);case FcmEventAlertResolved() when alertResolved != null:
return alertResolved(_that);case FcmEventTest() when test != null:
return test(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( String route)?  alertArrived,TResult Function( String alertId)?  alertResolved,TResult Function()?  test,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FcmEventNone() when none != null:
return none();case FcmEventAlertArrived() when alertArrived != null:
return alertArrived(_that.route);case FcmEventAlertResolved() when alertResolved != null:
return alertResolved(_that.alertId);case FcmEventTest() when test != null:
return test();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( String route)  alertArrived,required TResult Function( String alertId)  alertResolved,required TResult Function()  test,}) {final _that = this;
switch (_that) {
case FcmEventNone():
return none();case FcmEventAlertArrived():
return alertArrived(_that.route);case FcmEventAlertResolved():
return alertResolved(_that.alertId);case FcmEventTest():
return test();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( String route)?  alertArrived,TResult? Function( String alertId)?  alertResolved,TResult? Function()?  test,}) {final _that = this;
switch (_that) {
case FcmEventNone() when none != null:
return none();case FcmEventAlertArrived() when alertArrived != null:
return alertArrived(_that.route);case FcmEventAlertResolved() when alertResolved != null:
return alertResolved(_that.alertId);case FcmEventTest() when test != null:
return test();case _:
  return null;

}
}

}

/// @nodoc


class FcmEventNone extends FcmEvent {
  const FcmEventNone(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmEventNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FcmEvent.none()';
}


}




/// @nodoc


class FcmEventAlertArrived extends FcmEvent {
  const FcmEventAlertArrived(this.route): super._();
  

 final  String route;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FcmEventAlertArrivedCopyWith<FcmEventAlertArrived> get copyWith => _$FcmEventAlertArrivedCopyWithImpl<FcmEventAlertArrived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmEventAlertArrived&&(identical(other.route, route) || other.route == route));
}


@override
int get hashCode => Object.hash(runtimeType,route);

@override
String toString() {
  return 'FcmEvent.alertArrived(route: $route)';
}


}

/// @nodoc
abstract mixin class $FcmEventAlertArrivedCopyWith<$Res> implements $FcmEventCopyWith<$Res> {
  factory $FcmEventAlertArrivedCopyWith(FcmEventAlertArrived value, $Res Function(FcmEventAlertArrived) _then) = _$FcmEventAlertArrivedCopyWithImpl;
@useResult
$Res call({
 String route
});




}
/// @nodoc
class _$FcmEventAlertArrivedCopyWithImpl<$Res>
    implements $FcmEventAlertArrivedCopyWith<$Res> {
  _$FcmEventAlertArrivedCopyWithImpl(this._self, this._then);

  final FcmEventAlertArrived _self;
  final $Res Function(FcmEventAlertArrived) _then;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? route = null,}) {
  return _then(FcmEventAlertArrived(
null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FcmEventAlertResolved extends FcmEvent {
  const FcmEventAlertResolved(this.alertId): super._();
  

 final  String alertId;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FcmEventAlertResolvedCopyWith<FcmEventAlertResolved> get copyWith => _$FcmEventAlertResolvedCopyWithImpl<FcmEventAlertResolved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmEventAlertResolved&&(identical(other.alertId, alertId) || other.alertId == alertId));
}


@override
int get hashCode => Object.hash(runtimeType,alertId);

@override
String toString() {
  return 'FcmEvent.alertResolved(alertId: $alertId)';
}


}

/// @nodoc
abstract mixin class $FcmEventAlertResolvedCopyWith<$Res> implements $FcmEventCopyWith<$Res> {
  factory $FcmEventAlertResolvedCopyWith(FcmEventAlertResolved value, $Res Function(FcmEventAlertResolved) _then) = _$FcmEventAlertResolvedCopyWithImpl;
@useResult
$Res call({
 String alertId
});




}
/// @nodoc
class _$FcmEventAlertResolvedCopyWithImpl<$Res>
    implements $FcmEventAlertResolvedCopyWith<$Res> {
  _$FcmEventAlertResolvedCopyWithImpl(this._self, this._then);

  final FcmEventAlertResolved _self;
  final $Res Function(FcmEventAlertResolved) _then;

/// Create a copy of FcmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alertId = null,}) {
  return _then(FcmEventAlertResolved(
null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FcmEventTest extends FcmEvent {
  const FcmEventTest(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmEventTest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FcmEvent.test()';
}


}




// dart format on
