import '../../shared.dart';

extension BranchQueries on FirebaseFirestore {
  DocumentReference get branchDocRef => collection(MyCollections.branches).doc(kSelectedBranchId);
  CollectionReference get tasksCollectionRef => branchDocRef.collection(MyCollections.tasks);

  CollectionReference<TaskModel> get tasks => tasksCollectionRef.taskConvertor;

  CollectionReference<TaskModel> subTasks(String id) =>
      tasksCollectionRef.doc(id).collection(MyCollections.subTasks).taskConvertor;
}

extension FireConvertorExtension on CollectionReference {
  get taskConvertor => withConverter<TaskModel>(
    fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
    toFirestore: (snapshot, _) => snapshot.toJson(),
  );
}
