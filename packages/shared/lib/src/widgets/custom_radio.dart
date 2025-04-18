import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final ValueChanged<T?> onChanged;
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EasyRadio<T>(
          value: value,
          dotColor: context.colorPalette.grey708,
          activeFillColor: context.colorPalette.greyD9D,
          activeBorderColor: Colors.transparent,
          inactiveBorderColor: Colors.transparent,
          inactiveFillColor: context.colorPalette.greyD9D,
          dotRadius: 7,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 5, end: 15),
          child: Text(
            title,
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
