import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/org_profile.dart';
import '../data/org_repository.dart';

part 'leave_organization_use_case.g.dart';

@riverpod
LeaveOrganizationUseCase leaveOrganizationUseCase(Ref ref) =>
    LeaveOrganizationUseCase(ref.watch(orgRepositoryProvider));

class LeaveOrganizationUseCase {
  const LeaveOrganizationUseCase(this._repository);
  final OrgRepository _repository;

  Future<LeaveOutcome> execute(OrgProfile profile) =>
      _repository.leave(profile);
}
