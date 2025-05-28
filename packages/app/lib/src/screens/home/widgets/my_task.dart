import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class MyTask extends StatelessWidget {
  final TaskModel task;

  const MyTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigate((context) {
          return TaskDetailsScreen(task: task);
        });
      },
      child: Material(
        color: context.colorPalette.greyF2F,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        if (task.totalSubTasks > 0) ...[
                          const CustomSvg(MyIcons.checkOutlined),
                          const SizedBox(width: 5),
                          Text(
                            "${task.completedSubTasksCount}/${task.totalSubTasks}",
                            style: TextStyle(
                              color: context.colorPalette.grey666,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                        const SizedBox(width: 12),
                        const CustomSvg(MyIcons.clockOutlined),
                        const SizedBox(width: 5),
                        Text(
                          task.startTime!.getTime(context),
                          style: TextStyle(
                            color: context.colorPalette.grey666,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const CustomSvg(MyIcons.calenderOutlined),
                        const SizedBox(width: 5),
                        Text(
                          task.startTime!.defaultDateFormat,
                          style: TextStyle(
                            color: context.colorPalette.grey666,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
