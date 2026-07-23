import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    if (alerts.isEmpty) return OrgAlertSeverity.none;
    for (final a in alerts) {
      if (a.isRecipient) return OrgAlertSeverity.forMe;
    }
    return OrgAlertSeverity.forOther;
  }
}
