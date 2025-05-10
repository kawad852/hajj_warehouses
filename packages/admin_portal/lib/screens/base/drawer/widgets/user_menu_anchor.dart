import 'package:shared/shared.dart';

class UserMenuAnchor extends StatelessWidget {
  const UserMenuAnchor({super.key});

  @override
  Widget build(BuildContext context) {
    return UserSelector(
      builder: (context, user) {
        if (user.id == null) {
          return const SizedBox.shrink();
        }
        return MenuAnchor(
          style: MenuStyle(
            padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(MyTheme.radiusPrimary)),
            ),
          ),
          menuChildren: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Selector<AppProvider, String>(
                    selector: (context, provider) => provider.appTheme,
                    builder: (context, appTheme, child) {
                      final isLightModel = appTheme == ThemeEnum.light;
                      return IconButton.outlined(
                        onPressed: () {
                          context.appProvider.setTheme(
                            context,
                            theme: isLightModel ? ThemeEnum.dark : ThemeEnum.light,
                          );
                        },
                        icon: Icon(isLightModel ? Icons.dark_mode : Icons.light_mode),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.displayName,
                    style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(user.email!, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: () {
                      context.userProvider.logout(context);
                    },
                    style: TextButton.styleFrom(foregroundColor: context.colorScheme.error),
                    label: Text(context.appLocalization.logout),
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
            ),
          ],
          builder: (context, controller, child) {
            return IconButton.filledTonal(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: Icon(FontAwesomeIcons.lightUser),
            );
          },
        );
      },
    );
  }
}
