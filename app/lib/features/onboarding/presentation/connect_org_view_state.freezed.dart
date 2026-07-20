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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConnectOrgViewEventNone value)?  none,TResult Function( ConnectOrgViewEventMissingFields value)?  missingFields,TResult Function( ConnectOrgViewEventLookupFailed value)?  lookupFailed,TResult Function( ConnectOrgViewEventPasskeyFailed value)?  passkeyFailed,TResult Function( ConnectOrgViewEventDeviceRegisterFailed value)?  deviceRegisterFailed,TResult Function( ConnectOrgViewEventNavigateToOrgs value)?  navigateToOrgs,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConnectOrgViewEventNone() when none != null:
return none(_that);case ConnectOrgViewEventMissingFields() when missingFields != null:
return missingFields(_that);case ConnectOrgViewEventLookupFailed() when lookupFailed != null:
return lookupFailed(_that);case ConnectOrgViewEventPasskeyFailed() when passkeyFailed != null:
return passkeyFailed(_that);case ConnectOrgViewEventDeviceRegisterFailed() when deviceRegisterFailed != null:
return deviceRegisterFailed(_that);case ConnectOrgViewEventNavigateToOrgs() when navigateToOrgs != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConnectOrgViewEventNone value)  none,required TResult Function( ConnectOrgViewEventMissingFields value)  missingFields,required TResult Function( ConnectOrgViewEventLookupFailed value)  lookupFailed,required TResult Function( ConnectOrgViewEventPasskeyFailed value)  passkeyFailed,required TResult Function( ConnectOrgViewEventDeviceRegisterFailed value)  deviceRegisterFailed,required TResult Function( ConnectOrgViewEventNavigateToOrgs value)  navigateToOrgs,}){
final _that = this;
switch (_that) {
case ConnectOrgViewEventNone():
return none(_that);case ConnectOrgViewEventMissingFields():
return missingFields(_that);case ConnectOrgViewEventLookupFailed():
return lookupFailed(_that);case ConnectOrgViewEventPasskeyFailed():
return passkeyFailed(_that);case ConnectOrgViewEventDeviceRegisterFailed():
return deviceRegisterFailed(_that);case ConnectOrgViewEventNavigateToOrgs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConnectOrgViewEventNone value)?  none,TResult? Function( ConnectOrgViewEventMissingFields value)?  missingFields,TResult? Function( ConnectOrgViewEventLookupFailed value)?  lookupFailed,TResult? Function( ConnectOrgViewEventPasskeyFailed value)?  passkeyFailed,TResult? Function( ConnectOrgViewEventDeviceRegisterFailed value)?  deviceRegisterFailed,TResult? Function( ConnectOrgViewEventNavigateToOrgs value)?  navigateToOrgs,}){
final _that = this;
switch (_that) {
case ConnectOrgViewEventNone() when none != null:
return none(_that);case ConnectOrgViewEventMissingFields() when missingFields != null:
return missingFields(_that);case ConnectOrgViewEventLookupFailed() when lookupFailed != null:
return lookupFailed(_that);case ConnectOrgViewEventPasskeyFailed() when passkeyFailed != null:
return passkeyFailed(_that);case ConnectOrgViewEventDeviceRegisterFailed() when deviceRegisterFailed != null:
return deviceRegisterFailed(_that);case ConnectOrgViewEventNavigateToOrgs() when navigateToOrgs != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  none,TResult Function()?  missingFields,TResult Function( Object error)?  lookupFailed,TResult Function( Object error)?  passkeyFailed,TResult Function( Object error)?  deviceRegisterFailed,TResult Function()?  navigateToOrgs,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConnectOrgViewEventNone() when none != null:
return none();case ConnectOrgViewEventMissingFields() when missingFields != null:
return missingFields();case ConnectOrgViewEventLookupFailed() when lookupFailed != null:
return lookupFailed(_that.error);case ConnectOrgViewEventPasskeyFailed() when passkeyFailed != null:
return passkeyFailed(_that.error);case ConnectOrgViewEventDeviceRegisterFailed() when deviceRegisterFailed != null:
return deviceRegisterFailed(_that.error);case ConnectOrgViewEventNavigateToOrgs() when navigateToOrgs != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  none,required TResult Function()  missingFields,required TResult Function( Object error)  lookupFailed,required TResult Function( Object error)  passkeyFailed,required TResult Function( Object error)  deviceRegisterFailed,required TResult Function()  navigateToOrgs,}) {final _that = this;
switch (_that) {
case ConnectOrgViewEventNone():
return none();case ConnectOrgViewEventMissingFields():
return missingFields();case ConnectOrgViewEventLookupFailed():
return lookupFailed(_that.error);case ConnectOrgViewEventPasskeyFailed():
return passkeyFailed(_that.error);case ConnectOrgViewEventDeviceRegisterFailed():
return deviceRegisterFailed(_that.error);case ConnectOrgViewEventNavigateToOrgs():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  none,TResult? Function()?  missingFields,TResult? Function( Object error)?  lookupFailed,TResult? Function( Object error)?  passkeyFailed,TResult? Function( Object error)?  deviceRegisterFailed,TResult? Function()?  navigateToOrgs,}) {final _that = this;
switch (_that) {
case ConnectOrgViewEventNone() when none != null:
return none();case ConnectOrgViewEventMissingFields() when missingFields != null:
return missingFields();case ConnectOrgViewEventLookupFailed() when lookupFailed != null:
return lookupFailed(_that.error);case ConnectOrgViewEventPasskeyFailed() when passkeyFailed != null:
return passkeyFailed(_that.error);case ConnectOrgViewEventDeviceRegisterFailed() when deviceRegisterFailed != null:
return deviceRegisterFailed(_that.error);case ConnectOrgViewEventNavigateToOrgs() when navigateToOrgs != null:
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


class ConnectOrgViewEventMissingFields implements ConnectOrgViewEvent {
  const ConnectOrgViewEventMissingFields();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewEventMissingFields);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectOrgViewEvent.missingFields()';
}


}




/// @nodoc


class ConnectOrgViewEventLookupFailed implements ConnectOrgViewEvent {
  const ConnectOrgViewEventLookupFailed(this.error);
  

 final  Object error;

/// Create a copy of ConnectOrgViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectOrgViewEventLookupFailedCopyWith<ConnectOrgViewEventLookupFailed> get copyWith => _$ConnectOrgViewEventLookupFailedCopyWithImpl<ConnectOrgViewEventLookupFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewEventLookupFailed&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ConnectOrgViewEvent.lookupFailed(error: $error)';
}


}

/// @nodoc
abstract mixin class $ConnectOrgViewEventLookupFailedCopyWith<$Res> implements $ConnectOrgViewEventCopyWith<$Res> {
  factory $ConnectOrgViewEventLookupFailedCopyWith(ConnectOrgViewEventLookupFailed value, $Res Function(ConnectOrgViewEventLookupFailed) _then) = _$ConnectOrgViewEventLookupFailedCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$ConnectOrgViewEventLookupFailedCopyWithImpl<$Res>
    implements $ConnectOrgViewEventLookupFailedCopyWith<$Res> {
  _$ConnectOrgViewEventLookupFailedCopyWithImpl(this._self, this._then);

  final ConnectOrgViewEventLookupFailed _self;
  final $Res Function(ConnectOrgViewEventLookupFailed) _then;

/// Create a copy of ConnectOrgViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ConnectOrgViewEventLookupFailed(
null == error ? _self.error : error ,
  ));
}


}

/// @nodoc


class ConnectOrgViewEventPasskeyFailed implements ConnectOrgViewEvent {
  const ConnectOrgViewEventPasskeyFailed(this.error);
  

 final  Object error;

/// Create a copy of ConnectOrgViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectOrgViewEventPasskeyFailedCopyWith<ConnectOrgViewEventPasskeyFailed> get copyWith => _$ConnectOrgViewEventPasskeyFailedCopyWithImpl<ConnectOrgViewEventPasskeyFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewEventPasskeyFailed&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ConnectOrgViewEvent.passkeyFailed(error: $error)';
}


}

/// @nodoc
abstract mixin class $ConnectOrgViewEventPasskeyFailedCopyWith<$Res> implements $ConnectOrgViewEventCopyWith<$Res> {
  factory $ConnectOrgViewEventPasskeyFailedCopyWith(ConnectOrgViewEventPasskeyFailed value, $Res Function(ConnectOrgViewEventPasskeyFailed) _then) = _$ConnectOrgViewEventPasskeyFailedCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$ConnectOrgViewEventPasskeyFailedCopyWithImpl<$Res>
    implements $ConnectOrgViewEventPasskeyFailedCopyWith<$Res> {
  _$ConnectOrgViewEventPasskeyFailedCopyWithImpl(this._self, this._then);

  final ConnectOrgViewEventPasskeyFailed _self;
  final $Res Function(ConnectOrgViewEventPasskeyFailed) _then;

/// Create a copy of ConnectOrgViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ConnectOrgViewEventPasskeyFailed(
null == error ? _self.error : error ,
  ));
}


}

/// @nodoc


class ConnectOrgViewEventDeviceRegisterFailed implements ConnectOrgViewEvent {
  const ConnectOrgViewEventDeviceRegisterFailed(this.error);
  

 final  Object error;

/// Create a copy of ConnectOrgViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectOrgViewEventDeviceRegisterFailedCopyWith<ConnectOrgViewEventDeviceRegisterFailed> get copyWith => _$ConnectOrgViewEventDeviceRegisterFailedCopyWithImpl<ConnectOrgViewEventDeviceRegisterFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewEventDeviceRegisterFailed&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ConnectOrgViewEvent.deviceRegisterFailed(error: $error)';
}


}

/// @nodoc
abstract mixin class $ConnectOrgViewEventDeviceRegisterFailedCopyWith<$Res> implements $ConnectOrgViewEventCopyWith<$Res> {
  factory $ConnectOrgViewEventDeviceRegisterFailedCopyWith(ConnectOrgViewEventDeviceRegisterFailed value, $Res Function(ConnectOrgViewEventDeviceRegisterFailed) _then) = _$ConnectOrgViewEventDeviceRegisterFailedCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$ConnectOrgViewEventDeviceRegisterFailedCopyWithImpl<$Res>
    implements $ConnectOrgViewEventDeviceRegisterFailedCopyWith<$Res> {
  _$ConnectOrgViewEventDeviceRegisterFailedCopyWithImpl(this._self, this._then);

  final ConnectOrgViewEventDeviceRegisterFailed _self;
  final $Res Function(ConnectOrgViewEventDeviceRegisterFailed) _then;

/// Create a copy of ConnectOrgViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ConnectOrgViewEventDeviceRegisterFailed(
null == error ? _self.error : error ,
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

 String get serverUrl; String get invitationCode; ConnectOrgStep get step; InvitationLookupDto? get invitation; bool get isBusy; ConnectOrgViewEvent get event;
/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectOrgViewStateCopyWith<ConnectOrgViewState> get copyWith => _$ConnectOrgViewStateCopyWithImpl<ConnectOrgViewState>(this as ConnectOrgViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectOrgViewState&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.invitationCode, invitationCode) || other.invitationCode == invitationCode)&&(identical(other.step, step) || other.step == step)&&(identical(other.invitation, invitation) || other.invitation == invitation)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,invitationCode,step,invitation,isBusy,event);

@override
String toString() {
  return 'ConnectOrgViewState(serverUrl: $serverUrl, invitationCode: $invitationCode, step: $step, invitation: $invitation, isBusy: $isBusy, event: $event)';
}


}

/// @nodoc
abstract mixin class $ConnectOrgViewStateCopyWith<$Res>  {
  factory $ConnectOrgViewStateCopyWith(ConnectOrgViewState value, $Res Function(ConnectOrgViewState) _then) = _$ConnectOrgViewStateCopyWithImpl;
@useResult
$Res call({
 String serverUrl, String invitationCode, ConnectOrgStep step, InvitationLookupDto? invitation, bool isBusy, ConnectOrgViewEvent event
});


$InvitationLookupDtoCopyWith<$Res>? get invitation;$ConnectOrgViewEventCopyWith<$Res> get event;

}
/// @nodoc
class _$ConnectOrgViewStateCopyWithImpl<$Res>
    implements $ConnectOrgViewStateCopyWith<$Res> {
  _$ConnectOrgViewStateCopyWithImpl(this._self, this._then);

  final ConnectOrgViewState _self;
  final $Res Function(ConnectOrgViewState) _then;

/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverUrl = null,Object? invitationCode = null,Object? step = null,Object? invitation = freezed,Object? isBusy = null,Object? event = null,}) {
  return _then(_self.copyWith(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,invitationCode: null == invitationCode ? _self.invitationCode : invitationCode // ignore: cast_nullable_to_non_nullable
as String,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ConnectOrgStep,invitation: freezed == invitation ? _self.invitation : invitation // ignore: cast_nullable_to_non_nullable
as InvitationLookupDto?,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ConnectOrgViewEvent,
  ));
}
/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvitationLookupDtoCopyWith<$Res>? get invitation {
    if (_self.invitation == null) {
    return null;
  }

  return $InvitationLookupDtoCopyWith<$Res>(_self.invitation!, (value) {
    return _then(_self.copyWith(invitation: value));
  });
}/// Create a copy of ConnectOrgViewState
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverUrl,  String invitationCode,  ConnectOrgStep step,  InvitationLookupDto? invitation,  bool isBusy,  ConnectOrgViewEvent event)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectOrgViewState() when $default != null:
return $default(_that.serverUrl,_that.invitationCode,_that.step,_that.invitation,_that.isBusy,_that.event);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverUrl,  String invitationCode,  ConnectOrgStep step,  InvitationLookupDto? invitation,  bool isBusy,  ConnectOrgViewEvent event)  $default,) {final _that = this;
switch (_that) {
case _ConnectOrgViewState():
return $default(_that.serverUrl,_that.invitationCode,_that.step,_that.invitation,_that.isBusy,_that.event);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverUrl,  String invitationCode,  ConnectOrgStep step,  InvitationLookupDto? invitation,  bool isBusy,  ConnectOrgViewEvent event)?  $default,) {final _that = this;
switch (_that) {
case _ConnectOrgViewState() when $default != null:
return $default(_that.serverUrl,_that.invitationCode,_that.step,_that.invitation,_that.isBusy,_that.event);case _:
  return null;

}
}

}

/// @nodoc


class _ConnectOrgViewState implements ConnectOrgViewState {
  const _ConnectOrgViewState({this.serverUrl = '', this.invitationCode = '', this.step = ConnectOrgStep.input, this.invitation, this.isBusy = false, this.event = const ConnectOrgViewEvent.none()});
  

@override@JsonKey() final  String serverUrl;
@override@JsonKey() final  String invitationCode;
@override@JsonKey() final  ConnectOrgStep step;
@override final  InvitationLookupDto? invitation;
@override@JsonKey() final  bool isBusy;
@override@JsonKey() final  ConnectOrgViewEvent event;

/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectOrgViewStateCopyWith<_ConnectOrgViewState> get copyWith => __$ConnectOrgViewStateCopyWithImpl<_ConnectOrgViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectOrgViewState&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.invitationCode, invitationCode) || other.invitationCode == invitationCode)&&(identical(other.step, step) || other.step == step)&&(identical(other.invitation, invitation) || other.invitation == invitation)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,serverUrl,invitationCode,step,invitation,isBusy,event);

@override
String toString() {
  return 'ConnectOrgViewState(serverUrl: $serverUrl, invitationCode: $invitationCode, step: $step, invitation: $invitation, isBusy: $isBusy, event: $event)';
}


}

/// @nodoc
abstract mixin class _$ConnectOrgViewStateCopyWith<$Res> implements $ConnectOrgViewStateCopyWith<$Res> {
  factory _$ConnectOrgViewStateCopyWith(_ConnectOrgViewState value, $Res Function(_ConnectOrgViewState) _then) = __$ConnectOrgViewStateCopyWithImpl;
@override @useResult
$Res call({
 String serverUrl, String invitationCode, ConnectOrgStep step, InvitationLookupDto? invitation, bool isBusy, ConnectOrgViewEvent event
});


@override $InvitationLookupDtoCopyWith<$Res>? get invitation;@override $ConnectOrgViewEventCopyWith<$Res> get event;

}
/// @nodoc
class __$ConnectOrgViewStateCopyWithImpl<$Res>
    implements _$ConnectOrgViewStateCopyWith<$Res> {
  __$ConnectOrgViewStateCopyWithImpl(this._self, this._then);

  final _ConnectOrgViewState _self;
  final $Res Function(_ConnectOrgViewState) _then;

/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverUrl = null,Object? invitationCode = null,Object? step = null,Object? invitation = freezed,Object? isBusy = null,Object? event = null,}) {
  return _then(_ConnectOrgViewState(
serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,invitationCode: null == invitationCode ? _self.invitationCode : invitationCode // ignore: cast_nullable_to_non_nullable
as String,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ConnectOrgStep,invitation: freezed == invitation ? _self.invitation : invitation // ignore: cast_nullable_to_non_nullable
as InvitationLookupDto?,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ConnectOrgViewEvent,
  ));
}

/// Create a copy of ConnectOrgViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvitationLookupDtoCopyWith<$Res>? get invitation {
    if (_self.invitation == null) {
    return null;
  }

  return $InvitationLookupDtoCopyWith<$Res>(_self.invitation!, (value) {
    return _then(_self.copyWith(invitation: value));
  });
}/// Create a copy of ConnectOrgViewState
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
