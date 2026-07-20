// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'observe_deep_link_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PendingDeepLink implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PendingDeepLink'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingDeepLink);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PendingDeepLink()';
}


}

/// @nodoc
class $PendingDeepLinkCopyWith<$Res>  {
$PendingDeepLinkCopyWith(PendingDeepLink _, $Res Function(PendingDeepLink) __);
}


/// Adds pattern-matching-related methods to [PendingDeepLink].
extension PendingDeepLinkPatterns on PendingDeepLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PendingDeepLinkWaiting value)?  waiting,TResult Function( PendingDeepLinkConsumed value)?  consumed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PendingDeepLinkWaiting() when waiting != null:
return waiting(_that);case PendingDeepLinkConsumed() when consumed != null:
return consumed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PendingDeepLinkWaiting value)  waiting,required TResult Function( PendingDeepLinkConsumed value)  consumed,}){
final _that = this;
switch (_that) {
case PendingDeepLinkWaiting():
return waiting(_that);case PendingDeepLinkConsumed():
return consumed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PendingDeepLinkWaiting value)?  waiting,TResult? Function( PendingDeepLinkConsumed value)?  consumed,}){
final _that = this;
switch (_that) {
case PendingDeepLinkWaiting() when waiting != null:
return waiting(_that);case PendingDeepLinkConsumed() when consumed != null:
return consumed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String route)?  waiting,TResult Function()?  consumed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PendingDeepLinkWaiting() when waiting != null:
return waiting(_that.route);case PendingDeepLinkConsumed() when consumed != null:
return consumed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String route)  waiting,required TResult Function()  consumed,}) {final _that = this;
switch (_that) {
case PendingDeepLinkWaiting():
return waiting(_that.route);case PendingDeepLinkConsumed():
return consumed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String route)?  waiting,TResult? Function()?  consumed,}) {final _that = this;
switch (_that) {
case PendingDeepLinkWaiting() when waiting != null:
return waiting(_that.route);case PendingDeepLinkConsumed() when consumed != null:
return consumed();case _:
  return null;

}
}

}

/// @nodoc


class PendingDeepLinkWaiting extends PendingDeepLink with DiagnosticableTreeMixin {
  const PendingDeepLinkWaiting(this.route): super._();
  

 final  String route;

/// Create a copy of PendingDeepLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingDeepLinkWaitingCopyWith<PendingDeepLinkWaiting> get copyWith => _$PendingDeepLinkWaitingCopyWithImpl<PendingDeepLinkWaiting>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PendingDeepLink.waiting'))
    ..add(DiagnosticsProperty('route', route));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingDeepLinkWaiting&&(identical(other.route, route) || other.route == route));
}


@override
int get hashCode => Object.hash(runtimeType,route);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PendingDeepLink.waiting(route: $route)';
}


}

/// @nodoc
abstract mixin class $PendingDeepLinkWaitingCopyWith<$Res> implements $PendingDeepLinkCopyWith<$Res> {
  factory $PendingDeepLinkWaitingCopyWith(PendingDeepLinkWaiting value, $Res Function(PendingDeepLinkWaiting) _then) = _$PendingDeepLinkWaitingCopyWithImpl;
@useResult
$Res call({
 String route
});




}
/// @nodoc
class _$PendingDeepLinkWaitingCopyWithImpl<$Res>
    implements $PendingDeepLinkWaitingCopyWith<$Res> {
  _$PendingDeepLinkWaitingCopyWithImpl(this._self, this._then);

  final PendingDeepLinkWaiting _self;
  final $Res Function(PendingDeepLinkWaiting) _then;

/// Create a copy of PendingDeepLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? route = null,}) {
  return _then(PendingDeepLinkWaiting(
null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PendingDeepLinkConsumed extends PendingDeepLink with DiagnosticableTreeMixin {
  const PendingDeepLinkConsumed(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PendingDeepLink.consumed'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingDeepLinkConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PendingDeepLink.consumed()';
}


}




// dart format on
