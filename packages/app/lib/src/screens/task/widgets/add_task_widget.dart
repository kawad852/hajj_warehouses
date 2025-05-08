import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class AddTaskWidget extends StatelessWidget {
  final TaskModel? task;
  const AddTaskWidget({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.push((context) => TaskInputScreen(task: task));
          },
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorPalette.primary,
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
            child: const CustomSvg(MyIcons.plusWhite),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          context.appLocalization.addNewTask,
          style: TextStyle(
            color: context.colorPalette.black,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
