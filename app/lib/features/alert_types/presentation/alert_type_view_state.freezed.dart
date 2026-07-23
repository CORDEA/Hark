// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_type_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlertTypeViewState {

 String get id; String get name; String get description; Color get color;
/// Create a copy of AlertTypeViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertTypeViewStateCopyWith<AlertTypeViewState> get copyWith => _$AlertTypeViewStateCopyWithImpl<AlertTypeViewState>(this as AlertTypeViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertTypeViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,color);

@override
String toString() {
  return 'AlertTypeViewState(id: $id, name: $name, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class $AlertTypeViewStateCopyWith<$Res>  {
  factory $AlertTypeViewStateCopyWith(AlertTypeViewState value, $Res Function(AlertTypeViewState) _then) = _$AlertTypeViewStateCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, Color color
});




}
/// @nodoc
class _$AlertTypeViewStateCopyWithImpl<$Res>
    implements $AlertTypeViewStateCopyWith<$Res> {
  _$AlertTypeViewStateCopyWithImpl(this._self, this._then);

  final AlertTypeViewState _self;
  final $Res Function(AlertTypeViewState) _then;

/// Create a copy of AlertTypeViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? color = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertTypeViewState].
extension AlertTypeViewStatePatterns on AlertTypeViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertTypeViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertTypeViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertTypeViewState value)  $default,){
final _that = this;
switch (_that) {
case _AlertTypeViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertTypeViewState value)?  $default,){
final _that = this;
switch (_that) {
case _AlertTypeViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertTypeViewState() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  Color color)  $default,) {final _that = this;
switch (_that) {
case _AlertTypeViewState():
return $default(_that.id,_that.name,_that.description,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  Color color)?  $default,) {final _that = this;
switch (_that) {
case _AlertTypeViewState() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _AlertTypeViewState implements AlertTypeViewState {
  const _AlertTypeViewState({required this.id, required this.name, required this.description, required this.color});
  

@override final  String id;
@override final  String name;
@override final  String description;
@override final  Color color;

/// Create a copy of AlertTypeViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertTypeViewStateCopyWith<_AlertTypeViewState> get copyWith => __$AlertTypeViewStateCopyWithImpl<_AlertTypeViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertTypeViewState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,color);

@override
String toString() {
  return 'AlertTypeViewState(id: $id, name: $name, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class _$AlertTypeViewStateCopyWith<$Res> implements $AlertTypeViewStateCopyWith<$Res> {
  factory _$AlertTypeViewStateCopyWith(_AlertTypeViewState value, $Res Function(_AlertTypeViewState) _then) = __$AlertTypeViewStateCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, Color color
});




}
/// @nodoc
class __$AlertTypeViewStateCopyWithImpl<$Res>
    implements _$AlertTypeViewStateCopyWith<$Res> {
  __$AlertTypeViewStateCopyWithImpl(this._self, this._then);

  final _AlertTypeViewState _self;
  final $Res Function(_AlertTypeViewState) _then;

/// Create a copy of AlertTypeViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? color = null,}) {
  return _then(_AlertTypeViewState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
