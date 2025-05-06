import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class TaskFollowScreen extends StatefulWidget {
  const TaskFollowScreen({super.key});

  @override
  State<TaskFollowScreen> createState() => _TaskFollowScreenState();
}

class _TaskFollowScreenState extends State<TaskFollowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(
        color: Colors.transparent,
        child: AddTaskWidget(),
      ),
      appBar: AppBar(
        backgroundColor: context.colorPalette.greyE2E,
        title: AppBarText(context.appLocalization.taskTracking),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              context.appLocalization.history,
              style: TextStyle(
                color: context.colorPalette.black,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: TaskHeader(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              children: [
                TaskInfo(title: context.appLocalization.taskStartedOn, value: "02 : 48 : 59 "),
                const SizedBox(width: 10),
                TaskInfo(title: context.appLocalization.dueAt, value: "06:30 صباحاً"),
                const SizedBox(width: 10),
                TaskInfo(title: context.appLocalization.mustBeCompletedWithin, value: "00 : 33 : 22"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                context.appLocalization.subtasks,
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 30),
                itemCount: 5,
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 20),
                itemBuilder: (context, index) {
                  return const SubTaskWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
