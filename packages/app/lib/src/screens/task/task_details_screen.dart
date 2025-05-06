import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(color: Colors.transparent, child: AddTaskWidget()),
      appBar: AppBar(
        backgroundColor: context.colorPalette.greyE2E,
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
        bottom: const PreferredSize(preferredSize: Size.fromHeight(150), child: TaskHeader()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                TaskInfo(title: "بدأت المهمة في", value: "02 : 48 : 59 "),
                SizedBox(width: 10),
                TaskInfo(title: "وقت الإنتهاء عند", value: "06:30 صباحاً"),
                SizedBox(width: 10),
                TaskInfo(title: "يجب الإنهاء خلال", value: "00 : 33 : 22"),
              ],
            ),
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
