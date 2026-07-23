import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_type_view_state.freezed.dart';

@freezed
abstract class AlertTypeViewState with _$AlertTypeViewState {
  const factory AlertTypeViewState({
    required String id,
    required String name,
    required String description,
    required Color color,
  }) = _AlertTypeViewState;
}
