import 'package:app/shared.dart';
import 'package:app/src/screens/item/inventory_screen.dart';
import 'package:app/src/screens/task/widgets/timer_builder.dart';
import 'package:shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream<List<dynamic>> _streams;

  // late Stream<QuerySnapshot<TaskModel>> _tasksStream;

  void _initialize() {
    final tasksStream =
        kFirebaseInstant.tasks
            .where(
              MyFields.status,
              whereIn: [TaskStatusEnum.notStarted.value, TaskStatusEnum.inProgress.value],
            )
            .orderBy(MyFields.startTime, descending: true)
            .limit(5)
            .snapshots();

    final adminMessages = kFirebaseInstant.adminMessages.orderByDesc.limit(1).snapshots();

    _streams = Rx.combineLatest2<
      QuerySnapshot<TaskModel>,
      QuerySnapshot<AdminMessageModel>,
      List<dynamic>
    >(tasksStream, adminMessages, (s1, s2) {
      return [s1, s2];
    });
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ImpededStreamBuilder(
      stream: _streams,
      onComplete: (context, snapshot) {
        final tasksStream = snapshot.data![0] as QuerySnapshot<TaskModel>;
        final adminMessageStream = snapshot.data![1] as QuerySnapshot<AdminMessageModel>;
        final tasks = tasksStream.docs;
        final currentTasks = tasks.take(2).toList();
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [
            if (tasks.isNotEmpty)
              Row(
                spacing: 10,
                children: List.generate(currentTasks.length, (index) {
                  final taskDocSnapshot = currentTasks[index];
                  final task = taskDocSnapshot.data();
                  final isInProgress = task.status == TaskStatusEnum.inProgress.value;
                  return Expanded(
                    child: TimerBuilder(
                      endDateTime: isInProgress ? task.endTime : null,
                      child: (time) {
                        return HomeBubble(
                          onTap: () {
                            context.navigate((context) {
                              return TaskDetailsScreen(task: task);
                            });
                          },
                          title:
                              currentTasks.length == 1 && index == 0 || index == 0
                                  ? context.appLocalization.currentTask
                                  : context.appLocalization.nextTask,
                          task: taskDocSnapshot.data().title,
                          value: isInProgress ? time : task.startTime!.getTime(context),
                          valueIcon: isInProgress ? MyIcons.timer : MyIcons.clock,
                          valueColor:
                              isInProgress
                                  ? context.colorPalette.primary
                                  : context.colorPalette.black001,
                        );
                      },
                    ),
                  );
                }),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: BranchSelector(
                      builder: (context, branch) {
                        return HomeBubble(
                          onTap: () {
                            context.navigate((context) => const TransactionsScreen());
                          },
                          title: context.appLocalization.imprestBalance,
                          task:
                              "${branch.balance.toStringAsFixed(2)} ${context.appLocalization.riyal}",
                          prefixIcon: MyIcons.wallet,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutOfStockSelector(
                      builder: (context, items) {
                        return HomeBubble(
                          onTap: () {
                            context.navigate((context) {
                              return const InventoryScreen();
                            });
                          },
                          title: context.appLocalization.stock,
                          task:
                              items.isNotEmpty
                                  ? context.appLocalization.youHaveItemsNeedRestocking
                                  : context.appLocalization.goodInventoryStatusLabel,
                          prefixIcon: MyIcons.box,
                          taskColor: items.isNotEmpty ? context.colorPalette.redC10 : null,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: HomeBubble(
                    onTap: () {
                      context.navigate((context) => const UsersScreen());
                    },
                    title: context.appLocalization.humanResources,
                    prefixIcon: MyIcons.people,
                  ),
                ),
              ],
            ),
            if (adminMessageStream.docs.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: HomeBubble(
                  onTap: null,
                  title: context.appLocalization.administrativeMessages,
                  expandedTask: true,
                  task: adminMessageStream.docs.first.data().msg,
                ),
              )
            else
              const SizedBox(height: 10),
            if (tasks.isNotEmpty)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorPalette.greyF2F,
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: context.colorPalette.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(kRadiusSecondary),
                          topRight: Radius.circular(kRadiusSecondary),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              context.appLocalization.myTasks,
                              style: TextStyle(
                                color: context.colorPalette.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.navigate((context) {
                                return const TasksScreen(withAppBar: true);
                              });
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: context.colorPalette.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      separatorBuilder:
                          (context, index) => Divider(color: context.colorPalette.greyC4C),
                      itemCount: tasks.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      itemBuilder: (context, index) {
                        final task = tasks[index].data();
                        return MyTask(task: task);
                      },
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
