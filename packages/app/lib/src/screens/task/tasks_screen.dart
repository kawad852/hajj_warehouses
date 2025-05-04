import 'package:app/shared.dart';
import 'package:app/src/screens/task/widgets/date_widget.dart';
import 'package:shared/shared.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late DateTime _selectedDate;

  List<(DateTime, String)> _dates = [];

  Query<TaskModel> get _tasksQuery {
    final startDate = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
    final endDate = startDate.add(const Duration(days: 1));
    final filter = Filter.and(
      Filter(MyFields.createdAt, isGreaterThanOrEqualTo: Timestamp.fromDate(startDate)),
      Filter(MyFields.createdAt, isLessThan: Timestamp.fromDate(endDate)),
    );
    return kFirebaseInstant.tasks.where(filter);
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime(kNowDate.year, kNowDate.month, kNowDate.day, 0, 0, 0, 0, 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dates = [
      (_selectedDate.subtract(const Duration(days: 1)), "الأمس"),
      (_selectedDate, "اليوم"),
      (_selectedDate.add(const Duration(days: 1)), "غداً"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(color: Colors.transparent, child: AddTaskWidget()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 0,
                  top: 26,
                  left: 0,
                  right: 0,
                  child: Divider(color: context.colorPalette.greyC4C, thickness: 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:
                          _dates.map((e) {
                            return DateWidget(
                              onTap: () {
                                setState(() {
                                  _selectedDate = e.$1;
                                });
                              },
                              title: e.$2,
                              isSelected: _selectedDate == e.$1,
                            );
                          }).toList(),
                    ),
                    InkWell(
                      onTap: () {
                        context.push((context) => const FullCalenderSreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "عرض الكل",
                          style: TextStyle(
                            color: context.colorPalette.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const StatusWidget(),
          Expanded(
            child: CustomFirestoreQueryBuilder(
              key: ValueKey(_selectedDate),
              query: _tasksQuery,
              onComplete: (context, snapshot) {
                final tasks = snapshot.docs;
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 15),
                  itemCount: tasks.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    if (snapshot.isLoadingMore(index)) {
                      return const FPLoading();
                    }
                    final taskDocSnapshot = tasks[index];
                    final taskData = taskDocSnapshot.data();
                    return TaskCard(task: taskData);
                  },
                );
              },
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: 91,
          //   decoration: BoxDecoration(
          //     color: context.colorPalette.greyE2E,
          //     borderRadius: BorderRadius.circular(kRadiusPrimary),
          //   ),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 5,
          //         height: 91,
          //         decoration: BoxDecoration(
          //           color: context.colorPalette.greyC4C,
          //           borderRadius: const BorderRadiusDirectional.only(
          //             topStart: Radius.circular(kRadiusPrimary),
          //             bottomStart: Radius.circular(kRadiusPrimary),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 10),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Row(
          //                 children: [
          //                   const CustomSvg(MyIcons.checkSolid),
          //                   const SizedBox(width: 10),
          //                   Expanded(
          //                     child: Text(
          //                       "التحضير لوجبة الغداء",
          //                       overflow: TextOverflow.ellipsis,
          //                       style: TextStyle(
          //                         color: context.colorPalette.black001,
          //                         fontSize: 14,
          //                         fontWeight: FontWeight.w800,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(height: 6),
          //               Text(
          //                 "البدأ بإعداد وتجهيز الخضار واللحم والأصناف الضرورية واللازمة للوجبة واخراج المواد اللازمة من المخزون",
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(
          //                   color: context.colorPalette.black001,
          //                   fontSize: 14,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Container(
          //         width: 32,
          //         height: 91,
          //         alignment: Alignment.center,
          //         decoration: BoxDecoration(
          //           color: context.colorPalette.grey708,
          //           borderRadius: const BorderRadiusDirectional.only(
          //             topEnd: Radius.circular(kRadiusPrimary),
          //             bottomEnd: Radius.circular(kRadiusPrimary),
          //           ),
          //         ),
          //         child: RotatedBox(
          //           quarterTurns: 3,
          //           child: Text(
          //             "مكتملة",
          //             style: TextStyle(
          //               color: context.colorPalette.white,
          //               fontSize: 14,
          //               fontWeight: FontWeight.w800,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
