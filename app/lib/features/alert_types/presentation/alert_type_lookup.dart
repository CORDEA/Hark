import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'alert_type_view_state.dart';
import 'alert_types_view_model.dart';

/// The fallback badge color used when the fetched catalog does not include a
/// row for the alert's type id (stale cache, in-flight load, network error).
const Color kUnknownAlertTypeColor = Color(0xFF808080);

/// Watches the per-org type catalog and returns the entry for [typeId], or
/// null while the catalog is still loading / failed to load.
AlertTypeViewState? watchAlertType(
  WidgetRef ref, {
  required String serverUrl,
  required String typeId,
}) {
  final map = ref.watch(
    alertTypesViewModelProvider(serverUrl: serverUrl).select((s) => s.value),
  );
  return map?[typeId];
}
