import 'package:flutter/painting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/get_alert_types_use_case.dart';
import 'alert_type_view_state.dart';

part 'alert_types_view_model.g.dart';

/// Per-org catalog of alert types, keyed by id. Cached across screens so
/// history / detail / active-alert pages all share the same fetch.
@Riverpod(keepAlive: true)
class AlertTypesViewModel extends _$AlertTypesViewModel {
  @override
  Future<Map<String, AlertTypeViewState>> build({
    required String serverUrl,
  }) async {
    final list = await ref
        .watch(getAlertTypesUseCaseProvider)
        .execute(serverUrl: serverUrl);
    return {
      for (final t in list)
        t.id: AlertTypeViewState(
          id: t.id,
          name: t.name,
          description: t.description,
          color: _parseHexColor(t.color),
        ),
    };
  }

  Future<void> onRefresh() async {
    ref.invalidateSelf();
    await future;
  }
}

Color _parseHexColor(String hex) {
  final s = hex.startsWith('#') ? hex.substring(1) : hex;
  if (s.length != 6) return const Color(0xFF808080);
  final v = int.tryParse(s, radix: 16);
  if (v == null) return const Color(0xFF808080);
  return Color(0xFF000000 | v);
}
