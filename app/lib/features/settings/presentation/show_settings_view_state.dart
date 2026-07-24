import 'package:freezed_annotation/freezed_annotation.dart';

part 'show_settings_view_state.freezed.dart';

@freezed
sealed class ShowSettingsViewEvent with _$ShowSettingsViewEvent {
  const factory ShowSettingsViewEvent.none() = ShowSettingsViewEventNone;
  const factory ShowSettingsViewEvent.leaveFailed(Object error) =
      ShowSettingsViewEventLeaveFailed;
  const factory ShowSettingsViewEvent.navigateToOrgs() =
      ShowSettingsViewEventNavigateToOrgs;
}

@freezed
abstract class ShowSettingsViewState with _$ShowSettingsViewState {
  const factory ShowSettingsViewState({
    required String orgName,
    @Default(false) bool isLeaving,
    @Default(ShowSettingsViewEvent.none()) ShowSettingsViewEvent event,
  }) = _ShowSettingsViewState;
}
