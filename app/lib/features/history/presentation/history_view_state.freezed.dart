// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryRowViewState {

 String get alertId; String get type; DateTime get triggeredAt; HistoryRowBadge get badge; DateTime? get badgeAt;
/// Create a copy of HistoryRowViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryRowViewStateCopyWith<HistoryRowViewState> get copyWith => _$HistoryRowViewStateCopyWithImpl<HistoryRowViewState>(this as HistoryRowViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryRowViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.type, type) || other.type == type)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.badgeAt, badgeAt) || other.badgeAt == badgeAt));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,type,triggeredAt,badge,badgeAt);

@override
String toString() {
  return 'HistoryRowViewState(alertId: $alertId, type: $type, triggeredAt: $triggeredAt, badge: $badge, badgeAt: $badgeAt)';
}


}

/// @nodoc
abstract mixin class $HistoryRowViewStateCopyWith<$Res>  {
  factory $HistoryRowViewStateCopyWith(HistoryRowViewState value, $Res Function(HistoryRowViewState) _then) = _$HistoryRowViewStateCopyWithImpl;
@useResult
$Res call({
 String alertId, String type, DateTime triggeredAt, HistoryRowBadge badge, DateTime? badgeAt
});




}
/// @nodoc
class _$HistoryRowViewStateCopyWithImpl<$Res>
    implements $HistoryRowViewStateCopyWith<$Res> {
  _$HistoryRowViewStateCopyWithImpl(this._self, this._then);

  final HistoryRowViewState _self;
  final $Res Function(HistoryRowViewState) _then;

/// Create a copy of HistoryRowViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alertId = null,Object? type = null,Object? triggeredAt = null,Object? badge = null,Object? badgeAt = freezed,}) {
  return _then(_self.copyWith(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as HistoryRowBadge,badgeAt: freezed == badgeAt ? _self.badgeAt : badgeAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryRowViewState].
extension HistoryRowViewStatePatterns on HistoryRowViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryRowViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryRowViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryRowViewState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryRowViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryRowViewState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryRowViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String alertId,  String type,  DateTime triggeredAt,  HistoryRowBadge badge,  DateTime? badgeAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryRowViewState() when $default != null:
return $default(_that.alertId,_that.type,_that.triggeredAt,_that.badge,_that.badgeAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String alertId,  String type,  DateTime triggeredAt,  HistoryRowBadge badge,  DateTime? badgeAt)  $default,) {final _that = this;
switch (_that) {
case _HistoryRowViewState():
return $default(_that.alertId,_that.type,_that.triggeredAt,_that.badge,_that.badgeAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String alertId,  String type,  DateTime triggeredAt,  HistoryRowBadge badge,  DateTime? badgeAt)?  $default,) {final _that = this;
switch (_that) {
case _HistoryRowViewState() when $default != null:
return $default(_that.alertId,_that.type,_that.triggeredAt,_that.badge,_that.badgeAt);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryRowViewState implements HistoryRowViewState {
  const _HistoryRowViewState({required this.alertId, required this.type, required this.triggeredAt, required this.badge, this.badgeAt});
  

@override final  String alertId;
@override final  String type;
@override final  DateTime triggeredAt;
@override final  HistoryRowBadge badge;
@override final  DateTime? badgeAt;

/// Create a copy of HistoryRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryRowViewStateCopyWith<_HistoryRowViewState> get copyWith => __$HistoryRowViewStateCopyWithImpl<_HistoryRowViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryRowViewState&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.type, type) || other.type == type)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.badgeAt, badgeAt) || other.badgeAt == badgeAt));
}


@override
int get hashCode => Object.hash(runtimeType,alertId,type,triggeredAt,badge,badgeAt);

@override
String toString() {
  return 'HistoryRowViewState(alertId: $alertId, type: $type, triggeredAt: $triggeredAt, badge: $badge, badgeAt: $badgeAt)';
}


}

/// @nodoc
abstract mixin class _$HistoryRowViewStateCopyWith<$Res> implements $HistoryRowViewStateCopyWith<$Res> {
  factory _$HistoryRowViewStateCopyWith(_HistoryRowViewState value, $Res Function(_HistoryRowViewState) _then) = __$HistoryRowViewStateCopyWithImpl;
@override @useResult
$Res call({
 String alertId, String type, DateTime triggeredAt, HistoryRowBadge badge, DateTime? badgeAt
});




}
/// @nodoc
class __$HistoryRowViewStateCopyWithImpl<$Res>
    implements _$HistoryRowViewStateCopyWith<$Res> {
  __$HistoryRowViewStateCopyWithImpl(this._self, this._then);

  final _HistoryRowViewState _self;
  final $Res Function(_HistoryRowViewState) _then;

/// Create a copy of HistoryRowViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alertId = null,Object? type = null,Object? triggeredAt = null,Object? badge = null,Object? badgeAt = freezed,}) {
  return _then(_HistoryRowViewState(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as HistoryRowBadge,badgeAt: freezed == badgeAt ? _self.badgeAt : badgeAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$HistoryViewState {

 String get orgName; List<HistoryRowViewState> get ongoingRows; List<HistoryRowViewState> get historyRows;
/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryViewStateCopyWith<HistoryViewState> get copyWith => _$HistoryViewStateCopyWithImpl<HistoryViewState>(this as HistoryViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryViewState&&(identical(other.orgName, orgName) || other.orgName == orgName)&&const DeepCollectionEquality().equals(other.ongoingRows, ongoingRows)&&const DeepCollectionEquality().equals(other.historyRows, historyRows));
}


@override
int get hashCode => Object.hash(runtimeType,orgName,const DeepCollectionEquality().hash(ongoingRows),const DeepCollectionEquality().hash(historyRows));

@override
String toString() {
  return 'HistoryViewState(orgName: $orgName, ongoingRows: $ongoingRows, historyRows: $historyRows)';
}


}

/// @nodoc
abstract mixin class $HistoryViewStateCopyWith<$Res>  {
  factory $HistoryViewStateCopyWith(HistoryViewState value, $Res Function(HistoryViewState) _then) = _$HistoryViewStateCopyWithImpl;
@useResult
$Res call({
 String orgName, List<HistoryRowViewState> ongoingRows, List<HistoryRowViewState> historyRows
});




}
/// @nodoc
class _$HistoryViewStateCopyWithImpl<$Res>
    implements $HistoryViewStateCopyWith<$Res> {
  _$HistoryViewStateCopyWithImpl(this._self, this._then);

  final HistoryViewState _self;
  final $Res Function(HistoryViewState) _then;

/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgName = null,Object? ongoingRows = null,Object? historyRows = null,}) {
  return _then(_self.copyWith(
orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,ongoingRows: null == ongoingRows ? _self.ongoingRows : ongoingRows // ignore: cast_nullable_to_non_nullable
as List<HistoryRowViewState>,historyRows: null == historyRows ? _self.historyRows : historyRows // ignore: cast_nullable_to_non_nullable
as List<HistoryRowViewState>,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryViewState].
extension HistoryViewStatePatterns on HistoryViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryViewState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryViewState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orgName,  List<HistoryRowViewState> ongoingRows,  List<HistoryRowViewState> historyRows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryViewState() when $default != null:
return $default(_that.orgName,_that.ongoingRows,_that.historyRows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orgName,  List<HistoryRowViewState> ongoingRows,  List<HistoryRowViewState> historyRows)  $default,) {final _that = this;
switch (_that) {
case _HistoryViewState():
return $default(_that.orgName,_that.ongoingRows,_that.historyRows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orgName,  List<HistoryRowViewState> ongoingRows,  List<HistoryRowViewState> historyRows)?  $default,) {final _that = this;
switch (_that) {
case _HistoryViewState() when $default != null:
return $default(_that.orgName,_that.ongoingRows,_that.historyRows);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryViewState implements HistoryViewState {
  const _HistoryViewState({required this.orgName, required final  List<HistoryRowViewState> ongoingRows, required final  List<HistoryRowViewState> historyRows}): _ongoingRows = ongoingRows,_historyRows = historyRows;
  

@override final  String orgName;
 final  List<HistoryRowViewState> _ongoingRows;
@override List<HistoryRowViewState> get ongoingRows {
  if (_ongoingRows is EqualUnmodifiableListView) return _ongoingRows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ongoingRows);
}

 final  List<HistoryRowViewState> _historyRows;
@override List<HistoryRowViewState> get historyRows {
  if (_historyRows is EqualUnmodifiableListView) return _historyRows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_historyRows);
}


/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryViewStateCopyWith<_HistoryViewState> get copyWith => __$HistoryViewStateCopyWithImpl<_HistoryViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryViewState&&(identical(other.orgName, orgName) || other.orgName == orgName)&&const DeepCollectionEquality().equals(other._ongoingRows, _ongoingRows)&&const DeepCollectionEquality().equals(other._historyRows, _historyRows));
}


@override
int get hashCode => Object.hash(runtimeType,orgName,const DeepCollectionEquality().hash(_ongoingRows),const DeepCollectionEquality().hash(_historyRows));

@override
String toString() {
  return 'HistoryViewState(orgName: $orgName, ongoingRows: $ongoingRows, historyRows: $historyRows)';
}


}

/// @nodoc
abstract mixin class _$HistoryViewStateCopyWith<$Res> implements $HistoryViewStateCopyWith<$Res> {
  factory _$HistoryViewStateCopyWith(_HistoryViewState value, $Res Function(_HistoryViewState) _then) = __$HistoryViewStateCopyWithImpl;
@override @useResult
$Res call({
 String orgName, List<HistoryRowViewState> ongoingRows, List<HistoryRowViewState> historyRows
});




}
/// @nodoc
class __$HistoryViewStateCopyWithImpl<$Res>
    implements _$HistoryViewStateCopyWith<$Res> {
  __$HistoryViewStateCopyWithImpl(this._self, this._then);

  final _HistoryViewState _self;
  final $Res Function(_HistoryViewState) _then;

/// Create a copy of HistoryViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgName = null,Object? ongoingRows = null,Object? historyRows = null,}) {
  return _then(_HistoryViewState(
orgName: null == orgName ? _self.orgName : orgName // ignore: cast_nullable_to_non_nullable
as String,ongoingRows: null == ongoingRows ? _self._ongoingRows : ongoingRows // ignore: cast_nullable_to_non_nullable
as List<HistoryRowViewState>,historyRows: null == historyRows ? _self._historyRows : historyRows // ignore: cast_nullable_to_non_nullable
as List<HistoryRowViewState>,
  ));
}


}

// dart format on
