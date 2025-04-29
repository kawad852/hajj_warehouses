import 'package:animate_do/animate_do.dart';
import 'package:shared/shared.dart';

class EmptyWidget extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? body;
  final VoidCallback? onPressed;
  final String? buttonText;

  const EmptyWidget({super.key, this.icon, this.title, this.body, this.onPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: context.colorScheme.tertiaryContainer,
              child: ZoomIn(
                child: Icon(
                  icon ?? FontAwesomeIcons.folderOpen,
                  size: 40,
                  color: context.colorScheme.tertiary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 20),
              child: Text(
                title ?? "لا يوجد نتائج",
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (body != null) Text(body!, textAlign: TextAlign.center),
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
