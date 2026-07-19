// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hark_fcm_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HarkFcmMessage {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HarkFcmMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HarkFcmMessage()';
}


}

/// @nodoc
class $HarkFcmMessageCopyWith<$Res>  {
$HarkFcmMessageCopyWith(HarkFcmMessage _, $Res Function(HarkFcmMessage) __);
}


/// Adds pattern-matching-related methods to [HarkFcmMessage].
extension HarkFcmMessagePatterns on HarkFcmMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HarkAlert value)?  alert,TResult Function( HarkResolve value)?  resolve,TResult Function( HarkTest value)?  test,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HarkAlert() when alert != null:
return alert(_that);case HarkResolve() when resolve != null:
return resolve(_that);case HarkTest() when test != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HarkAlert value)  alert,required TResult Function( HarkResolve value)  resolve,required TResult Function( HarkTest value)  test,}){
final _that = this;
switch (_that) {
case HarkAlert():
return alert(_that);case HarkResolve():
return resolve(_that);case HarkTest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HarkAlert value)?  alert,TResult? Function( HarkResolve value)?  resolve,TResult? Function( HarkTest value)?  test,}){
final _that = this;
switch (_that) {
case HarkAlert() when alert != null:
return alert(_that);case HarkResolve() when resolve != null:
return resolve(_that);case HarkTest() when test != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String alertId,  String orgId,  String type)?  alert,TResult Function( String alertId)?  resolve,TResult Function()?  test,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HarkAlert() when alert != null:
return alert(_that.alertId,_that.orgId,_that.type);case HarkResolve() when resolve != null:
return resolve(_that.alertId);case HarkTest() when test != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String alertId,  String orgId,  String type)  alert,required TResult Function( String alertId)  resolve,required TResult Function()  test,}) {final _that = this;
switch (_that) {
case HarkAlert():
return alert(_that.alertId,_that.orgId,_that.type);case HarkResolve():
return resolve(_that.alertId);case HarkTest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String alertId,  String orgId,  String type)?  alert,TResult? Function( String alertId)?  resolve,TResult? Function()?  test,}) {final _that = this;
switch (_that) {
case HarkAlert() when alert != null:
return alert(_that.alertId,_that.orgId,_that.type);case HarkResolve() when resolve != null:
return resolve(_that.alertId);case HarkTest() when test != null:
return test();case _:
  return null;

}
}

}

/// @nodoc


class HarkAlert implements HarkFcmMessage {
  const HarkAlert({required this.alertId, required this.orgId, required this.type});
  

 final  String alertId;
 final  String orgId;
 final  String type;

/// Create a copy of HarkFcmMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HarkAlertCopyWith<HarkAlert> get copyWith => _$HarkAlertCopyWithImpl<HarkAlert>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HarkAlert&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,orgId,type);

@override
String toString() {
  return 'HarkFcmMessage.alert(alertId: $alertId, orgId: $orgId, type: $type)';
}


}

/// @nodoc
abstract mixin class $HarkAlertCopyWith<$Res> implements $HarkFcmMessageCopyWith<$Res> {
  factory $HarkAlertCopyWith(HarkAlert value, $Res Function(HarkAlert) _then) = _$HarkAlertCopyWithImpl;
@useResult
$Res call({
 String alertId, String orgId, String type
});




}
/// @nodoc
class _$HarkAlertCopyWithImpl<$Res>
    implements $HarkAlertCopyWith<$Res> {
  _$HarkAlertCopyWithImpl(this._self, this._then);

  final HarkAlert _self;
  final $Res Function(HarkAlert) _then;

/// Create a copy of HarkFcmMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alertId = null,Object? orgId = null,Object? type = null,}) {
  return _then(HarkAlert(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HarkResolve implements HarkFcmMessage {
  const HarkResolve({required this.alertId});
  

 final  String alertId;

/// Create a copy of HarkFcmMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HarkResolveCopyWith<HarkResolve> get copyWith => _$HarkResolveCopyWithImpl<HarkResolve>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HarkResolve&&(identical(other.alertId, alertId) || other.alertId == alertId));
}


@override
int get hashCode => Object.hash(runtimeType,alertId);

@override
String toString() {
  return 'HarkFcmMessage.resolve(alertId: $alertId)';
}


}

/// @nodoc
abstract mixin class $HarkResolveCopyWith<$Res> implements $HarkFcmMessageCopyWith<$Res> {
  factory $HarkResolveCopyWith(HarkResolve value, $Res Function(HarkResolve) _then) = _$HarkResolveCopyWithImpl;
@useResult
$Res call({
 String alertId
});




}
/// @nodoc
class _$HarkResolveCopyWithImpl<$Res>
    implements $HarkResolveCopyWith<$Res> {
  _$HarkResolveCopyWithImpl(this._self, this._then);

  final HarkResolve _self;
  final $Res Function(HarkResolve) _then;

/// Create a copy of HarkFcmMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alertId = null,}) {
  return _then(HarkResolve(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HarkTest implements HarkFcmMessage {
  const HarkTest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HarkTest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HarkFcmMessage.test()';
}


}




// dart format on
