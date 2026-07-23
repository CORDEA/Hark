import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../alerts/data/alert_dto.dart';
import '../../alerts/data/alert_repository.dart';
import 'org_alert_severity.dart';

part 'get_org_alert_severity_use_case.g.dart';

@riverpod
GetOrgAlertSeverityUseCase getOrgAlertSeverityUseCase(Ref ref) =>
    GetOrgAlertSeverityUseCase(ref.watch(alertRepositoryProvider));

class GetOrgAlertSeverityUseCase {
  const GetOrgAlertSeverityUseCase(this._repository);
  final AlertRepository _repository;

  Future<OrgAlertSeverity> execute({required String serverUrl}) async {
    final alerts = await _repository.findAll(
      serverUrl: serverUrl,
      status: 'active',
    );
    var sawWarningForMe = false;
    var sawCritical = false;
    for (final a in alerts) {
      if (a.type == AlertType.critical && a.isRecipient) {
        return OrgAlertSeverity.critical;
      }
      if (a.type == AlertType.critical) sawCritical = true;
      if (a.type == AlertType.warning && a.isRecipient) sawWarningForMe = true;
    }
    if (sawWarningForMe || sawCritical) return OrgAlertSeverity.warning;
    return OrgAlertSeverity.none;
  }
}
