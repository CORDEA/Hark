import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../alerts/data/alert_dto.dart';
import '../domain/get_alert_detail_use_case.dart';
import 'alert_detail_view_state.dart';

part 'alert_detail_view_model.g.dart';

@riverpod
class AlertDetailViewModel extends _$AlertDetailViewModel {
  @override
  Future<AlertDetailViewState> build({
    required String serverUrl,
    required String alertId,
  }) async {
    final detail = await ref
        .watch(getAlertDetailUseCaseProvider)
        .execute(serverUrl: serverUrl, alertId: alertId);
    return _map(detail, _hostOf(serverUrl));
  }

  Future<void> onRetryTapped() async {
    ref.invalidateSelf();
  }

  AlertDetailViewState _map(AlertDetailDto d, String orgName) {
    List<AlertDetailRecipientViewState> filter(String status) => d.recipients
        .where((r) => r.responseStatus == status)
        .map(
          (r) => AlertDetailRecipientViewState(
            name: r.name,
            responseStatus: r.responseStatus,
            respondedAt: r.respondedAt,
          ),
        )
        .toList();

    return AlertDetailViewState(
      alertId: d.id,
      type: d.type,
      status: d.status,
      orgName: orgName,
      triggeredAt: d.triggeredAt,
      resolvedAt: d.resolvedAt,
      responderName: d.responderName,
      targetNames: d.targetNames,
      isBroadcast: d.isBroadcast,
      acknowledged: filter(RecipientResponse.acknowledged),
      declined: filter(RecipientResponse.declined),
      pending: filter(RecipientResponse.pending),
    );
  }

  String _hostOf(String url) {
    final u = Uri.tryParse(url);
    if (u == null || u.host.isEmpty) return url;
    return u.host;
  }
}
