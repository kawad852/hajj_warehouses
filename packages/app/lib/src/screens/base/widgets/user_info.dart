import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "السلام عليكم ، ",
              style: TextStyle(
                color: context.colorPalette.grey708,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: Text(
                "صهيب العجارمة 👋",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              "مدير فرع - ",
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Flexible(
              child: Text(
                "مطبخ عرفة 1 - شركة الفارس",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.colorPalette.grey708,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_drop_down,
                color: context.colorPalette.grey708,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
