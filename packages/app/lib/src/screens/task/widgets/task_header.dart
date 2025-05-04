import 'package:shared/shared.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as sv;


class TaskHeader extends StatelessWidget {
  const TaskHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: sv.Svg(MyIcons.taskBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "وجبة الإفطار",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: context.colorPalette.black001,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "إعداد وتحضير وجبة الغداء لحجاج بيت الله الحرام من الجالية العربية وتقديمها لهم في الوقت المناسب",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            children: [
              const CustomSvg(MyIcons.calendarSelected, width: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "01.03.2025",
                  style: TextStyle(
                    color: context.colorPalette.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CustomSvg(MyIcons.clock, color: context.colorPalette.primary),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "01:30 صباحاً",
                  style: TextStyle(
                    color: context.colorPalette.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const CustomSvg(MyIcons.profileSelected, width: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    "صهيب العجارمة",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: 210,
              height: 40,
              decoration: BoxDecoration(
                color: context.colorPalette.primary,
                borderRadius: BorderRadius.circular(kRadiusSecondary),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "01 : 33 : 22",
                    style: TextStyle(
                      color: context.colorPalette.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  VerticalDivider(color: context.colorPalette.white),
                  const CustomSvg(MyIcons.checkWhite),
                  const SizedBox(width: 4),
                  Text(
                    "إنهاء المهمة",
                    style: TextStyle(
                      color: context.colorPalette.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
