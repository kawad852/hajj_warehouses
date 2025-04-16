import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class MyTask extends StatelessWidget {
  const MyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "وجبة العشاء",
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const CustomSvg(MyIcons.checkOutlined),
                    const SizedBox(width: 5),
                    Text(
                      "4/4",
                      style: TextStyle(
                        color: context.colorPalette.grey666,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const CustomSvg(MyIcons.clockOutlined),
                    const SizedBox(width: 5),
                    Text(
                      "06:30 صباحاً",
                      style: TextStyle(
                        color: context.colorPalette.grey666,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const CustomSvg(MyIcons.calenderOutlined),
                    const SizedBox(width: 5),
                    Text(
                      "01.03.2025",
                      style: TextStyle(
                        color: context.colorPalette.grey666,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
