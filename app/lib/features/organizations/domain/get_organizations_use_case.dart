import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/org_profile.dart';
import '../data/org_repository.dart';

part 'get_organizations_use_case.g.dart';

@riverpod
GetOrganizationsUseCase getOrganizationsUseCase(Ref ref) =>
    GetOrganizationsUseCase(ref.watch(orgRepositoryProvider));

class GetOrganizationsUseCase {
  const GetOrganizationsUseCase(this._repository);
  final OrgRepository _repository;

  Future<List<OrgProfile>> execute() => _repository.findAll();
}
