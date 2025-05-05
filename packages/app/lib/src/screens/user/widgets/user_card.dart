import 'package:shared/shared.dart';

import '../../../../shared.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: context.colorPalette.greyDAD),
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Row(
        children: [
          BaseNetworkImage(user.profilePhoto!, width: 64, height: 64),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.displayName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      user.jobTitle,
                      style: TextStyle(
                        color: context.colorPalette.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "- ${user.branch?.name}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToolButton(onTap: () {}, text: "عرض", icon: MyIcons.eye),
              const SizedBox(height: 5),
              ToolButton(
                onTap: () {
                  context.push((context) {
                    return UserInputScreen(user: user);
                  });
                },
                text: "تحرير",
                icon: MyIcons.edit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
