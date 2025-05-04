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
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [
            if (tasks.isNotEmpty)
              Row(
                spacing: 10,
                children:
                    tasks.take(2).map((e) {
                      return Expanded(
                        child: HomeBubble(
                          onTap: () {},
                          title: "المهمة الحالية",
                          task: e.data().title,
                          value: "02 : 31 : 56",
                          valueIcon: MyIcons.timer,
                        ),
                      );
                    }).toList(),
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
                          title: "رصيد العهدة",
                          task: "${branch.balance.toStringAsFixed(2)} ريال",
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
                          title: "المخزون",
                          task: items.isNotEmpty ? "لديك اصناف بحاجة لتزويد" : "-",
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
                    title: "الكادر البشري",
                    prefixIcon: MyIcons.people,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: HomeBubble(
                    onTap: () {
                      context.push((context) => const ReportsScreen());
                    },
                    title: "التقارير",
                    prefixIcon: MyIcons.reports,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: HomeBubble(
                onTap: () {},
                title: "رسائل إدارية",
                expandedTask: true,
                task:
                    "يرجى الإلتزام بمواعيد تقديم الوجبات وحسن التعامل مع حجاج بيت الله ، شاكرين لكم تعاونكم وجزاكم الله خير الجزاء.",
              ),
            ),
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
                      color: context.colorPalette.grey708,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(kRadiusSecondary),
                        topRight: Radius.circular(kRadiusSecondary),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "مهامي",
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
