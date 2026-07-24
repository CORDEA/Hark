// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'show_settings_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShowSettingsViewEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowSettingsViewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShowSettingsViewEvent()';
}


}

/// @nodoc
class $ShowSettingsViewEventCopyWith<$Res>  {
$ShowSettingsViewEventCopyWith(ShowSettingsViewEvent _, $Res Function(ShowSettingsViewEvent) __);
}


/// Adds pattern-matching-related methods to [ShowSettingsViewEvent].
extension ShowSettingsViewEventPatterns on ShowSettingsViewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowSettingsViewEventNone value)?  none,TResult Function( ShowSettingsViewEventLeaveFailed value)?  leaveFailed,TResult Function( ShowSettingsViewEventNavigateToOrgs value)?  navigateToOrgs,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowSettingsViewEventNone() when none != null:
return none(_that);case ShowSettingsViewEventLeaveFailed() when leaveFailed != null:
return leaveFailed(_that);case ShowSettingsViewEventNavigateToOrgs() when navigateToOrgs != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowSettingsViewEventNone value)  none,required TResult Function( ShowSettingsViewEventLeaveFailed value)  leaveFailed,required TResult Function( ShowSettingsViewEventNavigateToOrgs value)  navigateToOrgs,}){
final _that = this;
switch (_that) {
case ShowSettingsViewEventNone():
return none(_that);case ShowSettingsViewEventLeaveFailed():
return leaveFailed(_that);case ShowSettingsViewEventNavigateToOrgs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowSettingsViewEventNone value)?  none,TResult? Function( ShowSettingsViewEventLeaveFailed value)?  leaveFailed,TResult? Function( ShowSettingsViewEventNavigateToOrgs value)?  navigateToOrgs,}){
final _that = this;
switch (_that) {
case ShowSettingsViewEventNone() when none != null:
return none(_that);case ShowSettingsViewEventLeaveFailed() when leaveFailed != null:
return leaveFailed(_that);case ShowSettingsViewEventNavigateToOrgs() when navigateToOrgs != null:
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
case ShowSettingsViewEventNone() when none != null:
return none();case ShowSettingsViewEventLeaveFailed() when leaveFailed != null:
return leaveFailed(_that.error);case ShowSettingsViewEventNavigateToOrgs() when navigateToOrgs != null:
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
case ShowSettingsViewEventNone():
return none();case ShowSettingsViewEventLeaveFailed():
return leaveFailed(_that.error);case ShowSettingsViewEventNavigateToOrgs():
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
case ShowSettingsViewEventNone() when none != null:
return none();case ShowSettingsViewEventLeaveFailed() when leaveFailed != null:
return leaveFailed(_that.error);case ShowSettingsViewEventNavigateToOrgs() when navigateToOrgs != null:
return navigateToOrgs();case _:
  return null;

}
}

}

/// @nodoc


class ShowSettingsViewEventNone implements ShowSettingsViewEvent {
  const ShowSettingsViewEventNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowSettingsViewEventNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShowSettingsViewEvent.none()';
}


}




/// @nodoc


class ShowSettingsViewEventLeaveFailed implements ShowSettingsViewEvent {
  const ShowSettingsViewEventLeaveFailed(this.error);
  

 final  Object error;

/// Create a copy of ShowSettingsViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowSettingsViewEventLeaveFailedCopyWith<ShowSettingsViewEventLeaveFailed> get copyWith => _$ShowSettingsViewEventLeaveFailedCopyWithImpl<ShowSettingsViewEventLeaveFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowSettingsViewEventLeaveFailed&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ShowSettingsViewEvent.leaveFailed(error: $error)';
}


}

/// @nodoc
abstract mixin class $ShowSettingsViewEventLeaveFailedCopyWith<$Res> implements $ShowSettingsViewEventCopyWith<$Res> {
  factory $ShowSettingsViewEventLeaveFailedCopyWith(ShowSettingsViewEventLeaveFailed value, $Res Function(ShowSettingsViewEventLeaveFailed) _then) = _$ShowSettingsViewEventLeaveFailedCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$ShowSettingsViewEventLeaveFailedCopyWithImpl<$Res>
    implements $ShowSettingsViewEventLeaveFailedCopyWith<$Res> {
  _$ShowSettingsViewEventLeaveFailedCopyWithImpl(this._self, this._then);

  final ShowSettingsViewEventLeaveFailed _self;
  final $Res Function(ShowSettingsViewEventLeaveFailed) _then;

/// Create a copy of ShowSettingsViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ShowSettingsViewEventLeaveFailed(
null == error ? _self.error : error ,
  ));
}


}

/// @nodoc


class ShowSettingsViewEventNavigateToOrgs implements ShowSettingsViewEvent {
  const ShowSettingsViewEventNavigateToOrgs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowSettingsViewEventNavigateToOrgs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShowSettingsViewEvent.navigateToOrgs()';
}


}




/// @nodoc
mixin _$ShowSettingsViewState {

 String get orgName; bool get isLeaving; ShowSettingsViewEvent get event;
/// Create a copy of ShowSettingsViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowSettingsViewStateCopyWith<ShowSettingsViewState> get copyWith => _$ShowSettingsViewStateCopyWithImpl<ShowSettingsViewState>(this as ShowSettingsViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowSettingsViewState&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.isLeaving, isLeaving) || other.isLeaving == isLeaving)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,orgName,isLeaving,event);

@override
String toString() {
  return 'ShowSettingsViewState(orgName: $orgName, isLeaving: $isLeaving, event: $event)';
}


}

/// @nodoc
abstract mixin class $ShowSettingsViewStateCopyWith<$Res>  {
  factory $ShowSettingsViewStateCopyWith(ShowSettingsViewState value, $Res Function(ShowSettingsViewState) _then) = _$ShowSettingsViewStateCopyWithImpl;
@useResult
$Res call({
 String orgName, bool isLeaving, ShowSettingsViewEvent event
});


$ShowSettingsViewEventCopyWith<$Res> get event;

}
/// @nodoc
class _$ShowSettingsViewStateCopyWithImpl<$Res>
    implements $ShowSettingsViewStateCopyWith<$Res> {
  _$ShowSettingsViewStateCopyWithImpl(this._self, this._then);

  final ShowSettingsViewState _self;
  final $Res Function(ShowSettingsViewState) _then;

/// Create a copy of ShowSettingsViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgName = null,Object? isLeaving = null,Object? event = null,}) {
  return _then(_self.copyWith(
orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,isLeaving: null == isLeaving ? _self.isLeaving : isLeaving // ignore: cast_nullable_to_non_nullable
as bool,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ShowSettingsViewEvent,
  ));
}
/// Create a copy of ShowSettingsViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShowSettingsViewEventCopyWith<$Res> get event {
  
  return $ShowSettingsViewEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShowSettingsViewState].
extension ShowSettingsViewStatePatterns on ShowSettingsViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShowSettingsViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShowSettingsViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShowSettingsViewState value)  $default,){
final _that = this;
switch (_that) {
case _ShowSettingsViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShowSettingsViewState value)?  $default,){
final _that = this;
switch (_that) {
case _ShowSettingsViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orgName,  bool isLeaving,  ShowSettingsViewEvent event)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShowSettingsViewState() when $default != null:
return $default(_that.orgName,_that.isLeaving,_that.event);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orgName,  bool isLeaving,  ShowSettingsViewEvent event)  $default,) {final _that = this;
switch (_that) {
case _ShowSettingsViewState():
return $default(_that.orgName,_that.isLeaving,_that.event);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orgName,  bool isLeaving,  ShowSettingsViewEvent event)?  $default,) {final _that = this;
switch (_that) {
case _ShowSettingsViewState() when $default != null:
return $default(_that.orgName,_that.isLeaving,_that.event);case _:
  return null;

}
}

}

/// @nodoc


class _ShowSettingsViewState implements ShowSettingsViewState {
  const _ShowSettingsViewState({required this.orgName, this.isLeaving = false, this.event = const ShowSettingsViewEvent.none()});
  

@override final  String orgName;
@override@JsonKey() final  bool isLeaving;
@override@JsonKey() final  ShowSettingsViewEvent event;

/// Create a copy of ShowSettingsViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowSettingsViewStateCopyWith<_ShowSettingsViewState> get copyWith => __$ShowSettingsViewStateCopyWithImpl<_ShowSettingsViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowSettingsViewState&&(identical(other.orgName, orgName) || other.orgName == orgName)&&(identical(other.isLeaving, isLeaving) || other.isLeaving == isLeaving)&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,orgName,isLeaving,event);

@override
String toString() {
  return 'ShowSettingsViewState(orgName: $orgName, isLeaving: $isLeaving, event: $event)';
}


}

/// @nodoc
abstract mixin class _$ShowSettingsViewStateCopyWith<$Res> implements $ShowSettingsViewStateCopyWith<$Res> {
  factory _$ShowSettingsViewStateCopyWith(_ShowSettingsViewState value, $Res Function(_ShowSettingsViewState) _then) = __$ShowSettingsViewStateCopyWithImpl;
@override @useResult
$Res call({
 String orgName, bool isLeaving, ShowSettingsViewEvent event
});


@override $ShowSettingsViewEventCopyWith<$Res> get event;

}
/// @nodoc
class __$ShowSettingsViewStateCopyWithImpl<$Res>
    implements _$ShowSettingsViewStateCopyWith<$Res> {
  __$ShowSettingsViewStateCopyWithImpl(this._self, this._then);

  final _ShowSettingsViewState _self;
  final $Res Function(_ShowSettingsViewState) _then;

/// Create a copy of ShowSettingsViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgName = null,Object? isLeaving = null,Object? event = null,}) {
  return _then(_ShowSettingsViewState(
orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,isLeaving: null == isLeaving ? _self.isLeaving : isLeaving // ignore: cast_nullable_to_non_nullable
as bool,event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ShowSettingsViewEvent,
  ));
}

/// Create a copy of ShowSettingsViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShowSettingsViewEventCopyWith<$Res> get event {
  
  return $ShowSettingsViewEventCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

// dart format on
