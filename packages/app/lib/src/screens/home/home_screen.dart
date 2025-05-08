import 'package:app/shared.dart';
import 'package:app/src/screens/item/inventory_screen.dart';
import 'package:shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream<QuerySnapshot<TaskModel>> _tasksStream;

  void _initialize() {
    _tasksStream = kFirebaseInstant.tasks.orderByDesc.limit(5).snapshots();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ImpededStreamBuilder(
      stream: _tasksStream,
      onComplete: (context, snapshot) {
        final tasks = snapshot.data!.docs;
        final currentTasks = tasks.take(2).toList();
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [
            if (tasks.isNotEmpty)
              Row(
                spacing: 10,
                children: List.generate(currentTasks.length, (index) {
                  final task = currentTasks[index];
                  return Expanded(
                    child: HomeBubble(
                      onTap: () {},
                      title: index == 0 ? context.appLocalization.currentTask : context.appLocalization.nextTask,
                      task: task.data().title,
                      value: "02 : 31 : 56",
                      valueIcon: MyIcons.timer,
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
                            context.push((context) => const TransactionsScreen());
                          },
                          title: context.appLocalization.imprestBalance,
                          task: "${branch.balance.toStringAsFixed(2)} ${context.appLocalization.riyal}",
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
                            context.push((context) {
                              return const InventoryScreen();
                            });
                          },
                          title: context.appLocalization.stock,
                          task: items.isNotEmpty ? context.appLocalization.youHaveItemsNeedRestocking : "-",
                          prefixIcon: MyIcons.box,
                          taskColor: context.colorPalette.redC10,
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
                      context.push((context) => const UsersScreen());
                    },
                    title: context.appLocalization.humanResources,
                    prefixIcon: MyIcons.people,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: HomeBubble(
                onTap: () {},
                title: context.appLocalization.administrativeMessages,
                expandedTask: true,
                task:
                    "يرجى الإلتزام بمواعيد تقديم الوجبات وحسن التعامل مع حجاج بيت الله ، شاكرين لكم تعاونكم وجزاكم الله خير الجزاء.",
              ),
            ),
            if (tasks.isNotEmpty)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.colorPalette.greyF2F,
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
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
                            onTap: () {},
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
