import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.push((context) => TaskInputScreen(mainTaskId: ""));
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
