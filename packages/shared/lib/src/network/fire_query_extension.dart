import 'package:shared/shared.dart';

extension FireQueryExtension<T> on CollectionReference<T> {
  Query<T> get whereMyBranch => where(MyFields.userId, isEqualTo: kSelectedUserId);
  Query<T> get orderByDesc => orderBy(MyFields.createdAt, descending: true);
}
