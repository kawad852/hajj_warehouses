import 'package:app/shared.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 0,
                top: 26,
                left: 0,
                right: 0,
                child: Divider(
                  color: context.colorPalette.greyC4C,
                  thickness: 2,
                ),
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
                    onTap: () {},
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
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: 15,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 67,
                  decoration: BoxDecoration(
                    color: context.colorPalette.greyF2F,
                    borderRadius: BorderRadius.circular(kRadiusPrimary),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
