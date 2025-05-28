import 'package:app/src/screens/task/widgets/timer_builder.dart';
import 'package:app/src/screens/task/widgets/toggle_button_child.dart';
import 'package:shared/shared.dart';

class TaskToggleButtons extends StatelessWidget {
  final List<String> images;
  final String mainTaskId;
  final String? subTaskId;
  final TaskModel task;
  final String imagesField;

  const TaskToggleButtons({
    super.key,
    required this.images,
    required this.mainTaskId,
    required this.subTaskId,
    required this.task,
    required this.imagesField,
  });

  DocumentReference<TaskModel> get _mainTaskDocRef => kFirebaseInstant.tasks.doc(mainTaskId);
  DocumentReference<TaskModel> get _subTaskDocRef =>
      kFirebaseInstant.subTasks(mainTaskId).doc(subTaskId);

  bool get _isNotStarted => task.status == TaskStatusEnum.notStarted.value;
  bool get _isCompleted => task.status == TaskStatusEnum.completed.value;
  bool get _isInProgress => task.status == TaskStatusEnum.inProgress.value;

  void _onStartingTask(BuildContext context) async {
    final date = kNowDate;
    final json = {MyFields.status: TaskStatusEnum.inProgress.value, MyFields.startedAt: date};
    if (subTaskId != null) {
      await _subTaskDocRef.update(json);
    } else {
      await _mainTaskDocRef.update(json);
    }

    // ignore: use_build_context_synchronously
    SendNotificationService.sendToUsers(
      // ignore: use_build_context_synchronously
      context,
      id: _subTaskDocRef.id,
      type: "TASK",
      titleEn: "📝 Task Started",
      titleAr: "📝 بدأت المهمة",
      bodyEn: "Task: ${task.title} was started by ${task.createdBy.displayName} on $date.",
      bodyAr: "تم بدء المهمة: ${task.title} بواسطة ${task.createdBy.displayName} في تاريخ $date.",
      toRoles: [RoleEnum.admin.value],
    );
  }

  void _onEndingTask(BuildContext context) {
    final date = kNowDate;
    final json = {MyFields.status: TaskStatusEnum.completed.value, MyFields.endedAt: date};
    if (subTaskId != null) {
      _subTaskDocRef.update(json);
      _mainTaskDocRef.update({...json, MyFields.completedSubTasksCount: FieldValue.increment(1)});
    } else {
      ApiService.fetch(
        context,
        callBack: () async {
          final subTasksQuerySnapshot = await _mainTaskDocRef.collection(MyFields.subTasks).get();
          final isEverySubTaskCompleted = subTasksQuerySnapshot.docs.every(
            (e) => e.data()[MyFields.status] == TaskStatusEnum.completed.value,
          );
          if (isEverySubTaskCompleted) {
            // ignore: use_build_context_synchronously
            SendNotificationService.sendToUsers(
              // ignore: use_build_context_synchronously
              context,
              id: _subTaskDocRef.id,
              type: "TASK",
              titleEn: "📝 Task Ended",
              titleAr: "📝 إنتهت المهمة",
              bodyEn:
                  "Task: ${task.title} was completed by ${task.createdBy.displayName} on $date.",
              bodyAr:
                  "تم إكمال المهمة: ${task.title} بواسطة ${task.createdBy.displayName} في تاريخ $date.",
              toRoles: [RoleEnum.admin.value],
            );
          } else if (context.mounted) {
            context.showSnackBar(context.appLocalization.completeMainTaskCondition);
          }
        },
      );
    }
  }

  Future<void> _pickImage(BuildContext context, String field) async {
    final storageService = StorageService();
    AppOverlayLoader.fakeLoading();
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null && context.mounted) {
      ApiService.fetch(
        context,
        callBack: () async {
          final image = await storageService.uploadFile(collection: "tasksImages", file: file);
          final docRef = subTaskId != null ? _subTaskDocRef : _mainTaskDocRef;
          docRef.update({
            field: FieldValue.arrayUnion([image]),
          });
        },
      );
    }
  }

  List<Widget> _children(BuildContext context) {
    if (_isNotStarted) {
      return [
        ToggleButtonChild(icon: MyIcons.camera, title: context.appLocalization.attachPhotos),
        ToggleButtonChild(icon: MyIcons.checkWhite, title: context.appLocalization.startExecution),
      ];
    } else if (_isInProgress) {
      return [
        ToggleButtonChild(icon: MyIcons.camera, title: context.appLocalization.attachPhotos),
        TimerBuilder(
          startDateTime: task.startedAt,
          countUp: true,
          child: (time) {
            return ToggleButtonChild(title: time);
          },
        ),
        ToggleButtonChild(icon: MyIcons.checkWhite, title: context.appLocalization.endTask),
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: _isCompleted,
      child: SizedBox(
        height: 40,
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorPalette.white,
              borderRadius: BorderRadius.circular(kRadiusSecondary),
              border: Border.all(color: Colors.white),
            ),
            child: ToggleButtons(
              constraints: const BoxConstraints(minWidth: 120, minHeight: 40),
              isSelected: List.generate(_children(context).length, (index) => true),
              fillColor: context.colorPalette.primary,
              selectedColor: context.colorPalette.white,
              color: Colors.white,
              borderColor: Colors.white,
              textStyle: TextStyle(
                color: context.colorPalette.white,
                fontSize: 14,
                fontWeight: FontWeight.w800,
                fontFamily: GoogleFonts.cairo().fontFamily!,
              ),
              borderRadius: BorderRadius.circular(10),
              onPressed: (value) {
                if (value == 0) {
                  _pickImage(context, imagesField);
                }
                if (value == _children(context).length - 1) {
                  if (images.isEmpty) {
                    Fluttertoast.showToast(msg: context.appLocalization.mustAttachPhotos);
                    return;
                  }
                  if (_isNotStarted) {
                    _onStartingTask(context);
                  } else if (_isInProgress) {
                    _onEndingTask(context);
                  }
                }
              },
              children: _children(context),
            ),
          ),
        ),
      ),
    );
  }
}
