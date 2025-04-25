import 'package:shared/shared.dart';

class TaskInputScreen extends StatefulWidget {
  final TaskInputType taskInputType;
  const TaskInputScreen({super.key, required this.taskInputType});

  @override
  State<TaskInputScreen> createState() => _TaskInputScreenState();
}

class _TaskInputScreenState extends State<TaskInputScreen> {
  bool get _isSingleTask => widget.taskInputType == TaskInputType.single;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(
          _isSingleTask ? "إضافة مهمة فرعية" : "إضافة مهمة رئيسية",
        ),
      ),
      bottomNavigationBar: BottomButton(text: "اضافة", onPressed: () {}),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          if (_isSingleTask)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "اضافة مهمة فرعية من مهمة :",
                  style: TextStyle(
                    color: context.colorPalette.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "وجبة الإفطار",
                  style: TextStyle(
                    color: context.colorPalette.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          TitledTextField(
            title: "عنوان المهمة",
            child: TextEditor(onChanged: (value) {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TitledTextField(
              title: "وصف توضيحي",
              child: TextEditor(onChanged: (value) {}, maxLines: 4),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TitledTextField(
                  title: "التاريخ",
                  child: TextEditor(
                    onChanged: (value) {},
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TitledTextField(
                  title: "الموظف المسؤول",
                  child: DropDownEditor(
                    items: const [],
                    onChanged: (value) {},
                    title: "اختر الموظف",
                    value: "s",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TitledTextField(
                  title: "وقت بداية التنفيذ",
                  child: TextEditor(
                    onChanged: (value) {},
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TitledTextField(
                  title: "وقت نهاية المهمة",
                  child: TextEditor(
                    onChanged: (value) {},
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
