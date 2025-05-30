import 'package:app/shared.dart';
import 'package:app/src/screens/task/widgets/timer_builder.dart';
import 'package:shared/shared.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel? task;
  final String? id;

  const TaskDetailsScreen({super.key, this.task, this.id});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late Stream<TaskModel> _taskStream;
  late Query<TaskModel> _subTasksQuery;

  void _initialize() {
    _taskStream = kFirebaseInstant.tasks
        .doc(widget.task?.id ?? widget.id)
        .snapshots()
        .map((e) => e.data()!);
    _subTasksQuery = kFirebaseInstant.subTasks(widget.task?.id ?? widget.id!);
  }

  Future<void> _showDialog(BuildContext context, TaskModel task) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            listTileTheme: const ListTileThemeData(
              minTileHeight: 0,
              dense: true,
              minVerticalPadding: 0,
            ),
          ),
          child: SimpleDialog(
            title: Text(context.appLocalization.log),
            children: <Widget>[
              if (task.startedAt != null)
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(context.appLocalization.taskStartedAt),
                    subtitle: Text(task.startedAt!.getDateTimeFormatEN(context)),
                  ),
                ),
              if (task.endedAt != null)
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(context.appLocalization.taskEnded),
                    subtitle: Text(task.endedAt!.getDateTimeFormatEN(context)),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BigStreamBuilder(
      stream: _taskStream,
      initialData: widget.task,
      onComplete: (context, snapshot) {
        final task = snapshot.data!;
        final status = task.status;
        final inProgress = status == TaskStatusEnum.inProgress.value;
        final inCompleted = status == TaskStatusEnum.completed.value;
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: AddTaskWidget(task: task),
          ),
          appBar: AppBar(
            backgroundColor: context.colorPalette.greyE2E,
            surfaceTintColor: context.colorPalette.greyE2E,
            title: AppBarText(context.appLocalization.followTask),
            actions: [
              if (task.startedAt != null)
                TextButton(
                  onPressed: () {
                    _showDialog(context, task);
                  },
                  child: Text(
                    context.appLocalization.log,
                    style: TextStyle(
                      color: context.colorPalette.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskHeader(task: task),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
                child: ListBody(
                  children: [
                    Row(
                      children: [
                        if ((inProgress || inCompleted) && task.startedAt != null) ...[
                          TaskInfo(
                            title: context.appLocalization.taskStartedAt,
                            value: "${task.startedAt!.getTime(context)} ",
                          ),
                        ],
                        if (inCompleted && task.endedAt != null) ...[
                          const SizedBox(width: 10),
                          TaskInfo(
                            title: context.appLocalization.endTimeAt,
                            value: task.endedAt!.getTime(context),
                          ),
                        ],
                        if (inProgress && (task.endTime?.isAfter(kNowDate) ?? false)) ...[
                          const SizedBox(width: 10),
                          TimerBuilder(
                            endDateTime: task.endTime,
                            child: (time) {
                              return TaskInfo(
                                title: context.appLocalization.mustEndWithin,
                                value: time,
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                    if (task.totalSubTasks > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: Text(
                          context.appLocalization.subTasks,
                          style: TextStyle(
                            color: context.colorPalette.black001,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: CustomFirestoreQueryBuilder(
                  query: _subTasksQuery,
                  onComplete: (context, snapshot) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemCount: snapshot.docs.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
                      itemBuilder: (context, index) {
                        if (snapshot.isLoadingMore(index)) {
                          return const FPLoading();
                        }
                        final taskDocSnapshot = snapshot.docs[index];
                        final subTask = taskDocSnapshot.data();
                        return SubTaskCard(
                          mainTaskId: task.id,
                          task: subTask,
                          mainTaskStarted: task.status != TaskStatusEnum.notStarted.value,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
