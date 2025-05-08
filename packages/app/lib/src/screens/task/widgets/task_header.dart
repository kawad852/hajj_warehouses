import 'package:app/src/screens/task/widgets/task_images_listview.dart';
import 'package:app/src/screens/task/widgets/task_toggle_buttons.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as sv;
import 'package:shared/shared.dart';

class TaskHeader extends StatelessWidget {
  final TaskModel task;

  const TaskHeader({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final values = task.values;
    final images = values.$2;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: AlignmentDirectional.topStart,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(image: sv.Svg(MyIcons.taskBackground), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              task.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            children: [
              const CustomSvg(MyIcons.calendarSelected, width: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  task.startTime!.getDefaultFormattedDate(context),
                  style: TextStyle(
                    color: context.colorPalette.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CustomSvg(MyIcons.clock, color: context.colorPalette.primary),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  task.startTime!.getTime(context),
                  style: TextStyle(
                    color: context.colorPalette.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const CustomSvg(MyIcons.profileSelected, width: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    task.employee!.displayName!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (images.isNotEmpty) TaskImagesListview(images: images),
          const SizedBox(height: 10),
          TaskToggleButtons(
            images: images,
            mainTaskId: task.id,
            subTaskId: null,
            imagesField: values.$1,
            status: task.status,
          ),
        ],
      ),
    );
  }
}
