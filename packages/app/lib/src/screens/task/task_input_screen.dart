import 'package:shared/shared.dart';

class TaskInputScreen extends StatefulWidget {
  final String? mainTaskId;

  const TaskInputScreen({super.key, this.mainTaskId});

  @override
  State<TaskInputScreen> createState() => _TaskInputScreenState();
}

class _TaskInputScreenState extends State<TaskInputScreen> {
  late TaskModel _task;
  final _formKey = GlobalKey<FormState>();
  late Future<List<UserModel>> _employeesFuture;

  bool get _isSubTask => widget.mainTaskId != null;

  void _initialize() {
    _employeesFuture = kFirebaseInstant.users
        .where(MyFields.idBranch, isEqualTo: kSelectedBranchId)
        .get()
        .then((value) {
          return value.docs.map((e) => e.data()).toList();
        });
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          final docRef = kFirebaseInstant.tasks.doc();
          _task.id = docRef.id;
          _task.createdAt = kNowDate;
          await docRef.set(_task);
          if (context.mounted) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: context.appLocalization.taskAddedSuccessfully);
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _task = TaskModel(createdBy: kCurrentLightUser);
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BigFutureBuilder(
      future: _employeesFuture,
      onComplete: (context, snapshot) {
        final employees = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: AppBarText(_isSubTask ? context.appLocalization.addSubtask : context.appLocalization.addMainTask)),
          bottomNavigationBar: BottomButton(
            text: context.appLocalization.add,
            onPressed: () {
              _submit(context);
            },
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_isSubTask)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${context.appLocalization.addSubtaskFromTask} :",
                          style: TextStyle(
                            color: context.colorPalette.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "وجبة الإفطار",
                          style: TextStyle(
                            color: context.colorPalette.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  TitledTextField(
                    title: context.appLocalization.taskTitle,
                    child: TextEditor(onChanged: (value) => _task.title = value!),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TitledTextField(
                      title: context.appLocalization.explanatoryDescription,
                      child: TextEditor(
                        onChanged: (value) => _task.description = value!,
                        maxLines: 4,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // Expanded(
                      //   child: TitledTextField(
                      //     title: context.appLocalization.date,
                      //     child: TextEditor(onChanged: (value) {}, textAlign: TextAlign.center),
                      //   ),
                      // ),
                      // const SizedBox(width: 10),
                      Expanded(
                        child: TitledTextField(
                          title: context.appLocalization.responsibleEmployee,
                          child: DropDownEditor(
                            value: _task.employee?.id,
                            items:
                                employees.map((e) {
                                  return DropdownMenuItem(value: e.id, child: Text(e.displayName));
                                }).toList(),
                            onChanged: (value) {
                              final user = employees.firstWhere((e) => e.id == value);
                              _task.employee = LightUserModel(
                                id: user.id,
                                displayName: user.displayName,
                              );
                            },
                            title: context.appLocalization.chooseEmployee,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TitledTextField(
                          title: context.appLocalization.executionStartTime,
                          child: DatePickerEditor(
                            includeTime: true,
                            style: context.textTheme.labelMedium,
                            value: _task.startTime,
                            onChanged: (value) {
                              _task.startTime = value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TitledTextField(
                          title: context.appLocalization.taskEndTime,
                          child: DatePickerEditor(
                            includeTime: true,
                            style: context.textTheme.labelMedium,
                            value: _task.endTime,
                            onChanged: (value) {
                              _task.endTime = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
