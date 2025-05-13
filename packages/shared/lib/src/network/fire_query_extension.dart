import 'package:shared/shared.dart';

extension FireQueryExtension<T> on Query<T> {
  Query<T> get whereMyBranch => where(MyFields.branchId, isEqualTo: kSelectedBranchId);
  Query<T> get whereMyCompany => where(MyFields.companyId, isEqualTo: kCompanyId);
  Query<T> get whereIdBranch => where(MyFields.idBranch, isEqualTo: kSelectedBranchId);
  Query<T> get orderByDesc => orderBy(MyFields.createdAt, descending: true);
}
