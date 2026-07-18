// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connect_org_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectOrgViewEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectOrgViewEvent()';
}


}

/// @nodoc
class $ConnectOrgViewEventCopyWith<$Res>  {
$ConnectOrgViewEventCopyWith(ConnectOrgViewEvent _, $Res Function(ConnectOrgViewEvent) __);
}


/// Adds pattern-matching-related methods to [ConnectOrgViewEvent].
extension ConnectOrgViewEventPatterns on ConnectOrgViewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConnectOrgViewEventNone value)?  none,TResult Function( ConnectOrgViewEventShowSnackBar value)?  showSnackBar,TResult Function( ConnectOrgViewEventNavigateToOrgs value)?  navigateToOrgs,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConnectOrgViewEventNone() when none != null:
return none(_that);case ConnectOrgViewEventShowSnackBar() when showSnackBar != null:
return showSnackBar(_that);case ConnectOrgViewEventNavigateToOrgs() when navigateToOrgs != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConnectOrgViewEventNone value)  none,required TResult Function( ConnectOrgViewEventShowSnackBar value)  showSnackBar,required TResult Function( ConnectOrgViewEventNavigateToOrgs value)  navigateToOrgs,}){
final _that = this;
switch (_that) {
case ConnectOrgViewEventNone():
return none(_that);case ConnectOrgViewEventShowSnackBar():
return showSnackBar(_that);case ConnectOrgViewEventNavigateToOrgs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConnectOrgViewEventNone value)?  none,TResult? Function( ConnectOrgViewEventShowSnackBar value)?  showSnackBar,TResult? Function( ConnectOrgViewEventNavigateToOrgs value)?  navigateToOrgs,}){
final _that = this;
switch (_that) {
case ConnectOrgViewEventNone() when none != null:
return none(_that);case ConnectOrgViewEventShowSnackBar() when showSnackBar != null:
return showSnackBar(_that);case ConnectOrgViewEventNavigateToOrgs() when navigateToOrgs != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function( String message)?  showSnackBar,TResult Function()?  navigateToOrgs,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConnectOrgViewEventNone() when none != null:
return none();case ConnectOrgViewEventShowSnackBar() when showSnackBar != null:
return showSnackBar(_that.message);case ConnectOrgViewEventNavigateToOrgs() when navigateToOrgs != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function( String message)  showSnackBar,required TResult Function()  navigateToOrgs,}) {final _that = this;
switch (_that) {
case ConnectOrgViewEventNone():
return none();case ConnectOrgViewEventShowSnackBar():
return showSnackBar(_that.message);case ConnectOrgViewEventNavigateToOrgs():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function( String message)?  showSnackBar,TResult? Function()?  navigateToOrgs,}) {final _that = this;
switch (_that) {
case ConnectOrgViewEventNone() when none != null:
return none();case ConnectOrgViewEventShowSnackBar() when showSnackBar != null:
return showSnackBar(_that.message);case ConnectOrgViewEventNavigateToOrgs() when navigateToOrgs != null:
return navigateToOrgs();case _:
  return null;

}
}

}

/// @nodoc


class ConnectOrgViewEventNone implements ConnectOrgViewEvent {
  const ConnectOrgViewEventNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewEventNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectOrgViewEvent.none()';
}


}




/// @nodoc


class ConnectOrgViewEventShowSnackBar implements ConnectOrgViewEvent {
  const ConnectOrgViewEventShowSnackBar(this.message);
  

 final  String message;

/// Create a copy of ConnectOrgViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectOrgViewEventShowSnackBarCopyWith<ConnectOrgViewEventShowSnackBar> get copyWith => _$ConnectOrgViewEventShowSnackBarCopyWithImpl<ConnectOrgViewEventShowSnackBar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewEventShowSnackBar&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConnectOrgViewEvent.showSnackBar(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConnectOrgViewEventShowSnackBarCopyWith<$Res> implements $ConnectOrgViewEventCopyWith<$Res> {
  factory $ConnectOrgViewEventShowSnackBarCopyWith(ConnectOrgViewEventShowSnackBar value, $Res Function(ConnectOrgViewEventShowSnackBar) _then) = _$ConnectOrgViewEventShowSnackBarCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConnectOrgViewEventShowSnackBarCopyWithImpl<$Res>
    implements $ConnectOrgViewEventShowSnackBarCopyWith<$Res> {
  _$ConnectOrgViewEventShowSnackBarCopyWithImpl(this._self, this._then);

  final ConnectOrgViewEventShowSnackBar _self;
  final $Res Function(ConnectOrgViewEventShowSnackBar) _then;

/// Create a copy of ConnectOrgViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ConnectOrgViewEventShowSnackBar(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConnectOrgViewEventNavigateToOrgs implements ConnectOrgViewEvent {
  const ConnectOrgViewEventNavigateToOrgs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewEventNavigateToOrgs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectOrgViewEvent.navigateToOrgs()';
}


}




/// @nodoc
mixin _$ConnectOrgViewState {

 String get serverUrl; String get invitationCode; String get deviceName; bool get isSubmitting; ConnectOrgViewEvent get event;
/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectOrgViewStateCopyWith<ConnectOrgViewState> get copyWith => _$ConnectOrgViewStateCopyWithImpl<ConnectOrgViewState>(this as ConnectOrgViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewState&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.invitationCode, invitationCode) || other.invitationCode == invitationCode)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,invitationCode,deviceName,isSubmitting,event);

@override
String toString() {
  return 'ConnectOrgViewState(serverUrl: $serverUrl, invitationCode: $invitationCode, deviceName: $deviceName, isSubmitting: $isSubmitting, event: $event)';
}


}

/// @nodoc
abstract mixin class $ConnectOrgViewStateCopyWith<$Res>  {
  factory $ConnectOrgViewStateCopyWith(ConnectOrgViewState value, $Res Function(ConnectOrgViewState) _then) = _$ConnectOrgViewStateCopyWithImpl;
@useResult
$Res call({
 String serverUrl, String invitationCode, String deviceName, bool isSubmitting, ConnectOrgViewEvent event
});


$ConnectOrgViewEventCopyWith<$Res> get event;

}
/// @nodoc
class _$ConnectOrgViewStateCopyWithImpl<$Res>
    implements $ConnectOrgViewStateCopyWith<$Res> {
  _$ConnectOrgViewStateCopyWithImpl(this._self, this._then);

  final ConnectOrgViewState _self;
  final $Res Function(ConnectOrgViewState) _then;

/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverUrl = null,Object? invitationCode = null,Object? deviceName = null,Object? isSubmitting = null,Object? event = null,}) {
  return _then(_self.copyWith(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,invitationCode: null == invitationCode ? _self.invitationCode : invitationCode // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ConnectOrgViewEvent,
  ));
}
/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectOrgViewEventCopyWith<$Res> get event {
  
  return $ConnectOrgViewEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectOrgViewState].
extension ConnectOrgViewStatePatterns on ConnectOrgViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectOrgViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectOrgViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectOrgViewState value)  $default,){
final _that = this;
switch (_that) {
case _ConnectOrgViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectOrgViewState value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectOrgViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverUrl,  String invitationCode,  String deviceName,  bool isSubmitting,  ConnectOrgViewEvent event)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectOrgViewState() when $default != null:
return $default(_that.serverUrl,_that.invitationCode,_that.deviceName,_that.isSubmitting,_that.event);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverUrl,  String invitationCode,  String deviceName,  bool isSubmitting,  ConnectOrgViewEvent event)  $default,) {final _that = this;
switch (_that) {
case _ConnectOrgViewState():
return $default(_that.serverUrl,_that.invitationCode,_that.deviceName,_that.isSubmitting,_that.event);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverUrl,  String invitationCode,  String deviceName,  bool isSubmitting,  ConnectOrgViewEvent event)?  $default,) {final _that = this;
switch (_that) {
case _ConnectOrgViewState() when $default != null:
return $default(_that.serverUrl,_that.invitationCode,_that.deviceName,_that.isSubmitting,_that.event);case _:
  return null;

}
}

}

/// @nodoc


class _ConnectOrgViewState implements ConnectOrgViewState {
  const _ConnectOrgViewState({this.serverUrl = '', this.invitationCode = '', this.deviceName = '', this.isSubmitting = false, this.event = const ConnectOrgViewEvent.none()});
  

@override@JsonKey() final  String serverUrl;
@override@JsonKey() final  String invitationCode;
@override@JsonKey() final  String deviceName;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  ConnectOrgViewEvent event;

/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectOrgViewStateCopyWith<_ConnectOrgViewState> get copyWith => __$ConnectOrgViewStateCopyWithImpl<_ConnectOrgViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectOrgViewState&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.invitationCode, invitationCode) || other.invitationCode == invitationCode)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,invitationCode,deviceName,isSubmitting,event);

@override
String toString() {
  return 'ConnectOrgViewState(serverUrl: $serverUrl, invitationCode: $invitationCode, deviceName: $deviceName, isSubmitting: $isSubmitting, event: $event)';
}


}

/// @nodoc
abstract mixin class _$ConnectOrgViewStateCopyWith<$Res> implements $ConnectOrgViewStateCopyWith<$Res> {
  factory _$ConnectOrgViewStateCopyWith(_ConnectOrgViewState value, $Res Function(_ConnectOrgViewState) _then) = __$ConnectOrgViewStateCopyWithImpl;
@override @useResult
$Res call({
 String serverUrl, String invitationCode, String deviceName, bool isSubmitting, ConnectOrgViewEvent event
});


@override $ConnectOrgViewEventCopyWith<$Res> get event;

}
/// @nodoc
class __$ConnectOrgViewStateCopyWithImpl<$Res>
    implements _$ConnectOrgViewStateCopyWith<$Res> {
  __$ConnectOrgViewStateCopyWithImpl(this._self, this._then);

  final _ConnectOrgViewState _self;
  final $Res Function(_ConnectOrgViewState) _then;

/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverUrl = null,Object? invitationCode = null,Object? deviceName = null,Object? isSubmitting = null,Object? event = null,}) {
  return _then(_ConnectOrgViewState(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,invitationCode: null == invitationCode ? _self.invitationCode : invitationCode // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ConnectOrgViewEvent,
  ));
}

/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectOrgViewEventCopyWith<$Res> get event {
  
  return $ConnectOrgViewEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

// dart format on
