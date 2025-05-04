import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class SubTaskWidget extends StatefulWidget {
  const SubTaskWidget({super.key});

  @override
  State<SubTaskWidget> createState() => _SubTaskWidgetState();
}

class _SubTaskWidgetState extends State<SubTaskWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colorPalette.greyE2E,
            borderRadius: BorderRadius.circular(kRadiusPrimary),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kRadiusPrimary),
            child: ExpansionTile(
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              tilePadding: EdgeInsets.zero,
              showTrailingIcon: false,
              collapsedShape: BorderDirectional(
                start: BorderSide(
                  color: context.colorPalette.greyC4C,
                  width: 5,
                ),
              ),
              shape: BorderDirectional(
                start: BorderSide(
                  color: context.colorPalette.greyC4C,
                  width: 5,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CustomSvg(MyIcons.checkSolid),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "التحضير لوجبة الغداء",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: context.colorPalette.black001,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "البدأ بإعداد وتجهيز الخضار واللحم والأصناف الضرورية واللازمة للوجبة واخراج المواد اللازمة من المخزون",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                SizedBox(
                  height: 105,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemCount: 6,
                    shrinkWrap: true,
                    padding: const EdgeInsetsDirectional.only(
                      top: 8,
                      bottom: 8,
                      start: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const BaseNetworkImage(
                        kBurgerImage,
                        width: 95,
                        height: 95,
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SubTaskInfo(
                        title: "بدأت المهمة",
                        value: "10:12:59 صباحاً",
                      ),
                      SizedBox(width: 8),
                      SubTaskInfo(
                        title: "انتهت المهمة",
                        value: "11:48:59 صباحاً",
                      ),
                      SizedBox(width: 8),
                      SubTaskInfo(
                        title: "الوقت المستغرق",
                        value: "01 : 33 : 22",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isExpanded,
          child: Positioned(
            bottom: -30,
            child: Column(
              children: [
                Container(
                  width: 330,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: context.colorPalette.primary,
                    borderRadius: BorderRadius.circular(kRadiusSecondary),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomSvg(MyIcons.camera),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          "ارفاق صور",
                          style: TextStyle(
                            color: context.colorPalette.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      VerticalDivider(color: context.colorPalette.white),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          "01 : 33 : 22",
                          style: TextStyle(
                            color: context.colorPalette.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      VerticalDivider(color: context.colorPalette.white),
                      const CustomSvg(MyIcons.checkWhite),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 6),
                        child: Text(
                          "إنهاء المهمة",
                          style: TextStyle(
                            color: context.colorPalette.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
