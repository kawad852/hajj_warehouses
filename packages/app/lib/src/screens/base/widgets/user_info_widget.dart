import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return UserSelector(
      builder: (context, user) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "السلام عليكم ، ",
                  style: TextStyle(
                    color: context.colorPalette.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${user.displayName} 👋",
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
            InkWell(
              onTap:
                  kIsAdmin
                      ? () {
                        context.push((context) {
                          return const ChooseBranchScreen(showAppBar: true);
                        });
                      }
                      : null,
              child: Ink(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                        "${kBranch?.name} - شركة الفارس",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (kIsAdmin)
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_drop_down, color: context.colorPalette.primary),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
