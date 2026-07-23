// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_type_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertTypeDto {

 String get id; String get name; String get description; String get color;
/// Create a copy of AlertTypeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertTypeDtoCopyWith<AlertTypeDto> get copyWith => _$AlertTypeDtoCopyWithImpl<AlertTypeDto>(this as AlertTypeDto, _$identity);

  /// Serializes this AlertTypeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertTypeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,color);

@override
String toString() {
  return 'AlertTypeDto(id: $id, name: $name, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class $AlertTypeDtoCopyWith<$Res>  {
  factory $AlertTypeDtoCopyWith(AlertTypeDto value, $Res Function(AlertTypeDto) _then) = _$AlertTypeDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String color
});




}
/// @nodoc
class _$AlertTypeDtoCopyWithImpl<$Res>
    implements $AlertTypeDtoCopyWith<$Res> {
  _$AlertTypeDtoCopyWithImpl(this._self, this._then);

  final AlertTypeDto _self;
  final $Res Function(AlertTypeDto) _then;

/// Create a copy of AlertTypeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? color = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertTypeDto].
extension AlertTypeDtoPatterns on AlertTypeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertTypeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertTypeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertTypeDto value)  $default,){
final _that = this;
switch (_that) {
case _AlertTypeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertTypeDto value)?  $default,){
final _that = this;
switch (_that) {
case _AlertTypeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertTypeDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String color)  $default,) {final _that = this;
switch (_that) {
case _AlertTypeDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String color)?  $default,) {final _that = this;
switch (_that) {
case _AlertTypeDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertTypeDto implements AlertTypeDto {
  const _AlertTypeDto({required this.id, required this.name, this.description = '', required this.color});
  factory _AlertTypeDto.fromJson(Map<String, dynamic> json) => _$AlertTypeDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String description;
@override final  String color;

/// Create a copy of AlertTypeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertTypeDtoCopyWith<_AlertTypeDto> get copyWith => __$AlertTypeDtoCopyWithImpl<_AlertTypeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertTypeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertTypeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,color);

@override
String toString() {
  return 'AlertTypeDto(id: $id, name: $name, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class _$AlertTypeDtoCopyWith<$Res> implements $AlertTypeDtoCopyWith<$Res> {
  factory _$AlertTypeDtoCopyWith(_AlertTypeDto value, $Res Function(_AlertTypeDto) _then) = __$AlertTypeDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String color
});




}
/// @nodoc
class __$AlertTypeDtoCopyWithImpl<$Res>
    implements _$AlertTypeDtoCopyWith<$Res> {
  __$AlertTypeDtoCopyWithImpl(this._self, this._then);

  final _AlertTypeDto _self;
  final $Res Function(_AlertTypeDto) _then;

/// Create a copy of AlertTypeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? color = null,}) {
  return _then(_AlertTypeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
