import 'package:app/shared.dart';
import 'package:app/src/screens/task/widgets/timer_builder.dart';
import 'package:shared/shared.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late Stream<TaskModel> _taskStream;
  late Query<TaskModel> _subTasksQuery;

  void _initialize() {
    _taskStream = kFirebaseInstant.tasks.doc(widget.task.id).snapshots().map((e) => e.data()!);
    _subTasksQuery = kFirebaseInstant.subTasks(widget.task.id);
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
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: AddTaskWidget(task: task),
          ),
          appBar: AppBar(
            backgroundColor: context.colorPalette.greyE2E,
            surfaceTintColor: context.colorPalette.greyE2E,
            title: const AppBarText("متابعة المهمة"),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "السجل",
                  style: TextStyle(
                    color: context.colorPalette.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: TaskHeader(task: task),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TaskInfo(
                      title: "بدأت المهمة في",
                      value: "${task.startTime!.getTime(context)} ",
                    ),
                    const SizedBox(width: 10),
                    TaskInfo(title: "وقت الإنتهاء عند", value: task.endTime!.getTime(context)),
                    if (task.endTime!.isAfter(kNowDate)) ...[
                      const SizedBox(width: 10),
                      TimerBuilder(
                        endDateTime: task.endTime!,
                        child: (time) {
                          return TaskInfo(title: "يجب الإنهاء خلال", value: time);
                        },
                      ),
                    ],
                  ],
                ),
                if (task.totalSubTasks > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(
                      "المهام الفرعية",
                      style: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                Expanded(
                  child: CustomFirestoreQueryBuilder(
                    query: _subTasksQuery,
                    onComplete: (context, snapshot) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(height: 30),
                        itemCount: snapshot.docs.length,
                        padding: const EdgeInsets.only(bottom: 20),
                        itemBuilder: (context, index) {
                          if (snapshot.isLoadingMore(index)) {
                            return const FPLoading();
                          }
                          final taskDocSnapshot = snapshot.docs[index];
                          final task = taskDocSnapshot.data();
                          return SubTaskCard(task: task);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
