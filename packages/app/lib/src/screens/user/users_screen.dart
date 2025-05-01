import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppBarText("الكادر البشري")),
      bottomNavigationBar: BottomButton(
        text: "اضافة",
        onPressed: () {
          context.push((context) => const UserInputScreen());
        },
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 10,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemBuilder: (context, index) {
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
                const BaseNetworkImage(kBurgerImage, width: 64, height: 64),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "محمد عبدالله",
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
                            "شيف رئيسي",
                            style: TextStyle(
                              color: context.colorPalette.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "- فرع منى",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: context.colorPalette.grey708,
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
                    ToolButton(onTap: () {}, text: "تحرير", icon: MyIcons.edit),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
