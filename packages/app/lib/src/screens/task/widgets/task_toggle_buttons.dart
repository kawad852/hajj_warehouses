import 'package:app/src/screens/task/widgets/timer_builder.dart';
import 'package:app/src/screens/task/widgets/toggle_button_child.dart';
import 'package:shared/shared.dart';

class TaskToggleButtons extends StatelessWidget {
  final List<String> images;
  final String mainTaskId;
  final String? subTaskId;
  final String imagesField;
  final String status;
  final DateTime? startedAt;

  const TaskToggleButtons({
    super.key,
    required this.images,
    required this.mainTaskId,
    required this.subTaskId,
    required this.imagesField,
    required this.status,
    this.startedAt,
  });

  DocumentReference<TaskModel> get _mainTaskDocRef => kFirebaseInstant.tasks.doc(mainTaskId);
  DocumentReference<TaskModel> get _subTaskDocRef =>
      kFirebaseInstant.subTasks(mainTaskId).doc(subTaskId);

  bool get _isNotStarted => status == TaskStatusEnum.notStarted.value;
  bool get _isCompleted => status == TaskStatusEnum.completed.value;
  bool get _isInProgress => status == TaskStatusEnum.inProgress.value;

  void _onStartingTask() {
    final json = {
      MyFields.status: TaskStatusEnum.inProgress.value,
      MyFields.startedAt: FieldValue.serverTimestamp(),
    };
    if (subTaskId != null) {
      _subTaskDocRef.update(json);
    } else {
      _mainTaskDocRef.update(json);
    }
  }

  void _onEndingTask(BuildContext context) {
    final json = {
      MyFields.status: TaskStatusEnum.completed.value,
      MyFields.endedAt: FieldValue.serverTimestamp(),
    };
    if (subTaskId != null) {
      _subTaskDocRef.update(json);
    } else {
      ApiService.fetch(
        context,
        callBack: () async {
          final subTasksQuerySnapshot = await _mainTaskDocRef.collection(MyFields.subTasks).get();
          final isEverySubTaskCompleted = subTasksQuerySnapshot.docs.every(
            (e) => e.data()[MyFields.status] == TaskStatusEnum.completed.value,
          );
          if (isEverySubTaskCompleted) {
            await _mainTaskDocRef.update(json);
          } else if (context.mounted) {
            context.showSnackBar("لانهاء المهمة الرئيسية، يجب انهاء جميع المهمات الفرعية");
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
        const ToggleButtonChild(icon: MyIcons.camera, title: "ارفاق صور"),
        const ToggleButtonChild(icon: MyIcons.checkWhite, title: "بدء التنفذ"),
      ];
    } else if (_isInProgress) {
      return [
        const ToggleButtonChild(icon: MyIcons.camera, title: "ارفاق صور"),
        TimerBuilder(
          startDateTime: startedAt,
          countUp: true,
          child: (time) {
            return ToggleButtonChild(title: time);
          },
        ),
        const ToggleButtonChild(icon: MyIcons.checkWhite, title: "إنهاء المهمة"),
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
                    Fluttertoast.showToast(msg: "يجب ارفاق صور");
                    return;
                  }
                  if (_isNotStarted) {
                    _onStartingTask();
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
