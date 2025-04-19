import 'package:shared/shared.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const RemoveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: context.colorScheme.error,
        foregroundColor: context.colorScheme.onError,
      ),
      icon: const Icon(Icons.remove_circle),
    );
  }
}
