import 'package:shared/shared.dart';

import '../../../../shared.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  String get _getTimeDifference {
    Duration diff = task.endedAt!.difference(task.startedAt!);

    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String formattedDuration =
        "${twoDigits(diff.inHours)}:"
        "${twoDigits(diff.inMinutes.remainder(60))}:"
        "${twoDigits(diff.inSeconds.remainder(60))}";

    return formattedDuration;
  }

  @override
  Widget build(BuildContext context) {
    final time = TimeOfDay(hour: task.startTime!.hour, minute: task.startTime!.minute);
    final isCompleted = task.status == TaskStatusEnum.completed.value;
    final colors = task.getStatusColors(context);
    return GestureDetector(
      onTap: () {
        context.push((context) => TaskDetailsScreen(task: task));
      },
      child: Container(
        width: double.infinity,
        height: 67,
        decoration: BoxDecoration(
          color: colors.$1,
          borderRadius: BorderRadius.circular(kRadiusPrimary),
        ),
        child: Row(
          children: [
            Container(
              width: 5,
              height: 67,
              decoration: BoxDecoration(
                color: colors.$2,
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(kRadiusPrimary),
                  bottomStart: Radius.circular(kRadiusPrimary),
                ),
              ),
            ),
            isCompleted
                ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CustomSvg(MyIcons.checkSolid),
                )
                : Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colorPalette.white,
                  ),
                ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.colorPalette.black001,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      if (isCompleted)
                        Row(
                          children: [
                            Text(
                              _getTimeDifference,
                              style: TextStyle(
                                color: context.colorPalette.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: CustomSvg(MyIcons.clockSolid),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      if (task.totalSubTasks > 0) ...[
                        const CustomSvg(MyIcons.checkOutlined),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 5, end: 10),
                          child: Text(
                            "${task.completedSubTasksCount}/${task.totalSubTasks}",
                            style: TextStyle(
                              color: context.colorPalette.grey666,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                      const CustomSvg(MyIcons.clockOutlined),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5, end: 10),
                        child: Text(
                          time.format(context),
                          style: TextStyle(
                            color: context.colorPalette.grey666,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
