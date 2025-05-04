import 'package:shared/shared.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final time = TimeOfDay(hour: task.startTime!.hour, minute: task.startTime!.minute);
    final isCompleted = task.status == TaskStatusEnum.completed.value;
    return Container(
      width: double.infinity,
      height: 67,
      decoration: BoxDecoration(
        color: isCompleted ? context.colorPalette.greyE2E : context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(kRadiusPrimary),
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 67,
            decoration: BoxDecoration(
              color: isCompleted ? context.colorPalette.primary : context.colorPalette.greyC4C,
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
                            "02:31:56",
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
                    if (task.hasSubTasks) ...[
                      const CustomSvg(MyIcons.checkOutlined),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5, end: 10),
                        child: Text(
                          "1/4",
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
    );
  }
}
