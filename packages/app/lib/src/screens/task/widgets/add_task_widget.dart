import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class AddTaskWidget extends StatelessWidget {
  final TaskInputType taskInputType;
  const AddTaskWidget({super.key, required this.taskInputType});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.push((context) => TaskInputScreen(taskInputType: taskInputType));
          },
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorPalette.grey708,
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
            child: const CustomSvg(MyIcons.plusWhite),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "إضافة مهمة جديدة",
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
