import 'package:app/screens_exports.dart';
import 'package:flutter/material.dart';

class TaskDialog extends StatelessWidget {
  const TaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        width: double.infinity,
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TaskBubble(onTap: () {}, title: "اضافة مهمة جديدة"),
            TaskBubble(onTap: () {}, title: "اضافة طلب جديد"),
            TaskBubble(onTap: () {}, title: "سحب مواد من المخزون"),
            TaskBubble(onTap: () {}, title: "اضافة مواد للمخزون"),
          ],
        ),
      ),
    );
  }
}
