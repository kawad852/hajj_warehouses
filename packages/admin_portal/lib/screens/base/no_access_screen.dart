import 'package:shared/shared.dart';

class NoAccessScreen extends StatelessWidget {
  const NoAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(kScreenMargin),
        child: Center(
          child: Card(
            color: context.colorScheme.errorContainer,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.lock, size: 50),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      context.appLocalization.noAccessTitle,
                      style: context.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(context.appLocalization.noAccessBody),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
