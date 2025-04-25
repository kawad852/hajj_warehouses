import 'package:shared/shared.dart';

extension FireQueryExtension<T> on Query<T> {
  Query<T> get whereMyBranch => where(MyFields.userId, isEqualTo: kSelectedBranchId);
  Query<T> get whereMyBranchNested => where(MyFields.idUser, isEqualTo: kSelectedBranchId);
  Query<T> get orderByDesc => orderBy(MyFields.createdAt, descending: true);
}
