import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class TaskBubble extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const TaskBubble({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 3),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF2F,
          border: Border.all(color: context.colorPalette.greyDAD),
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            CustomSvg(MyIcons.addTask, color: context.colorPalette.grey708),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
