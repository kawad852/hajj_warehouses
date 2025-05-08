import 'package:app/shared.dart';
import 'package:app/src/screens/task/widgets/task_images_listview.dart';
import 'package:app/src/screens/task/widgets/task_toggle_buttons.dart';
import 'package:app/src/screens/task/widgets/timer_builder.dart';
import 'package:shared/shared.dart';

class SubTaskCard extends StatefulWidget {
  final String mainTaskId;
  final TaskModel task;
  final bool mainTaskStarted;

  const SubTaskCard({
    super.key,
    required this.task,
    required this.mainTaskId,
    required this.mainTaskStarted,
  });

  @override
  State<SubTaskCard> createState() => _SubTaskCardState();
}

class _SubTaskCardState extends State<SubTaskCard> {
  bool isExpanded = false;

  TaskModel get task => widget.task;

  @override
  Widget build(BuildContext context) {
    final colors = task.getStatusColors(context);
    final status = task.status;
    final isCompleted = status == TaskStatusEnum.completed.value;
    final values = task.values;
    final images = values.$2;
    final visible = isExpanded && !isCompleted && widget.mainTaskStarted;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: colors.$1,
            borderRadius: BorderRadius.circular(kRadiusPrimary),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kRadiusPrimary),
            child: ExpansionTile(
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              tilePadding: EdgeInsets.zero,
              showTrailingIcon: false,
              collapsedShape: BorderDirectional(start: BorderSide(color: colors.$2, width: 5)),
              shape: BorderDirectional(start: BorderSide(color: colors.$2, width: 5)),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CustomSvg(MyIcons.checkSolid),
                        const SizedBox(width: 10),
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
                      ],
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        task.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black001,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                if (images.isNotEmpty)
                  TaskImagesListview(
                    images: images,
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                  ),
                if (isCompleted)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        SubTaskInfo(
                          title: "بدأت المهمة",
                          value: task.startedAt?.getTime(context) ?? '-',
                        ),
                        if (task.endedAt != null) ...[
                          const SizedBox(width: 8),
                          SubTaskInfo(
                            title: "انتهت المهمة",
                            value: task.endedAt?.getTime(context) ?? '-',
                          ),
                          const SizedBox(width: 8),
                          TimerBuilder(
                            startDateTime: task.startTime,
                            endDateTime: task.endedAt,
                            child: (value) {
                              return SubTaskInfo(title: "الوقت المستغرق", value: value);
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                SizedBox(height: visible ? 40 : 10),
              ],
            ),
          ),
        ),
        Visibility(
          visible: visible,
          child: TaskToggleButtons(
            images: images,
            mainTaskId: widget.mainTaskId,
            subTaskId: task.id,
            imagesField: values.$1,
            status: status,
            startedAt: task.startedAt,
          ),
        ),
      ],
    );
  }
}
