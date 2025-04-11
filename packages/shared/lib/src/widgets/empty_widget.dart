import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/widgets/stretch_button.dart' show StretchedButton;

class EmptyWidget extends StatelessWidget {
  final IconData icon;
  final String title, body;
  final VoidCallback? onPressed;
  final String? buttonText;

  const EmptyWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    this.onPressed,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: ElasticIn(child: Icon(icon, size: 50, color: context.colorScheme.secondary)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 30),
              child: Text(
                title,
                style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Text(body, textAlign: TextAlign.center),
            if (onPressed != null)
              StretchedButton(
                margin: const EdgeInsets.only(top: 30, left: 60, right: 60),
                onPressed: onPressed,
                child: Text(buttonText!),
              ),
          ],
        ),
      ),
    );
  }
}
