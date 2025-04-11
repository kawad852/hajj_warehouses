import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    const size = 70.0;
    return Column(
      children: [
        Container(
          height: size,
          width: size,
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: context.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.add),
        ),
        Text("Food"),
      ],
    );
  }
}
