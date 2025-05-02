import 'package:shared/shared.dart';

class TaskWidget extends StatelessWidget {
  final int testIndex;
  const TaskWidget({super.key, required this.testIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 67,
      decoration: BoxDecoration(
        color:
            testIndex == 0
                ? context.colorPalette.greyE2E
                : context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(kRadiusPrimary),
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 67,
            decoration: BoxDecoration(
              color:
                  testIndex == 0
                      ? context.colorPalette.grey708
                      : context.colorPalette.greyC4C,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(kRadiusPrimary),
                bottomStart: Radius.circular(kRadiusPrimary),
              ),
            ),
          ),
          testIndex == 0
              ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomSvg(MyIcons.checkSolid),
              )
              : Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorPalette.white,
                ),
              ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "وجبة العشاء",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black001,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    if (testIndex == 1)
                      Row(
                        children: [
                          Text(
                            "02:31:56",
                            style: TextStyle(
                              color: context.colorPalette.grey708,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: CustomSvg(MyIcons.clockSolid),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const CustomSvg(MyIcons.checkOutlined),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 5,
                        end: 10,
                      ),
                      child: Text(
                        "1/4",
                        style: TextStyle(
                          color: context.colorPalette.grey666,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const CustomSvg(MyIcons.clockOutlined),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 5,
                        end: 10,
                      ),
                      child: Text(
                        "02:00 مساءً",
                        style: TextStyle(
                          color: context.colorPalette.grey666,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
