import 'package:app/shared.dart';
import 'package:app/src/screens/task/widgets/date_widget.dart';
import 'package:app/src/screens/task/widgets/full_calendar_builder.dart';
import 'package:shared/shared.dart';

class TasksScreen extends StatefulWidget {
  final bool fullCalendar;
  final bool withAppBar;

  const TasksScreen({super.key, this.fullCalendar = false, this.withAppBar = false});

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
    return kFirebaseInstant.tasks.where(filter).orderByDesc;
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
      (_selectedDate.subtract(const Duration(days: 1)), context.appLocalization.yesterday),
      (_selectedDate, context.appLocalization.today),
      (_selectedDate.add(const Duration(days: 1)), context.appLocalization.tomorrow),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          widget.fullCalendar || widget.withAppBar
              ? AppBar(
                title: AppBarText(context.appLocalization.allTasks),
                forceMaterialTransparency: true,
              )
              : null,
      bottomNavigationBar: const BottomAppBar(color: Colors.transparent, child: AddTaskWidget()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.fullCalendar)
            FullCalendarBuilder(
              onChanged: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            )
          else
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
                          context.push((context) => const TasksScreen(fullCalendar: true));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            context.appLocalization.viewAll,
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
                if (tasks.isEmpty) {
                  return EmptyWidget(
                    icon: FontAwesomeIcons.listCheck,
                    title: context.appLocalization.noAddedTasks,
                  );
                }
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
        ],
      ),
    );
  }
}
