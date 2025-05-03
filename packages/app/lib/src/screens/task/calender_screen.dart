import 'package:app/shared.dart';
import 'package:app/src/screens/task/widgets/date_widget.dart';
import 'package:shared/shared.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

enum DateType { yestarday, today, tomorrow }

class _CalenderScreenState extends State<CalenderScreen> {
  DateType dateType = DateType.today;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppBar(color: Colors.transparent, child: AddTaskWidget()),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 0,
                top: 26,
                left: 0,
                right: 0,
                child: Divider(color: context.colorPalette.greyC4C, thickness: 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      DateWidget(
                        onTap: () {
                          setState(() {
                            dateType = DateType.yestarday;
                          });
                        },
                        title: "الأمس",
                        isSelected: dateType == DateType.yestarday,
                      ),
                      DateWidget(
                        onTap: () {
                          setState(() {
                            dateType = DateType.today;
                          });
                        },
                        title: "اليوم",
                        isSelected: dateType == DateType.today,
                      ),
                      DateWidget(
                        onTap: () {
                          setState(() {
                            dateType = DateType.tomorrow;
                          });
                        },
                        title: "غداً",
                        isSelected: dateType == DateType.tomorrow,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      context.push((context) => const FullCalenderSreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "عرض الكل",
                        style: TextStyle(
                          color: context.colorPalette.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              return TaskWidget(testIndex: index);
            },
          ),
          Container(
            width: double.infinity,
            height: 91,
            decoration: BoxDecoration(
              color: context.colorPalette.greyE2E,
              borderRadius: BorderRadius.circular(kRadiusPrimary),
            ),
            child: Row(
              children: [
                Container(
                  width: 5,
                  height: 91,
                  decoration: BoxDecoration(
                    color: context.colorPalette.greyC4C,
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(kRadiusPrimary),
                      bottomStart: Radius.circular(kRadiusPrimary),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
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
                ),
                Container(
                  width: 32,
                  height: 91,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorPalette.grey708,
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(kRadiusPrimary),
                      bottomEnd: Radius.circular(kRadiusPrimary),
                    ),
                  ),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "مكتملة",
                      style: TextStyle(
                        color: context.colorPalette.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
