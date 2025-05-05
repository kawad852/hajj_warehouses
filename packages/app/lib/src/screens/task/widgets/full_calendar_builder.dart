import 'package:shared/shared.dart';

import '../../../../shared.dart';

class FullCalendarBuilder extends StatefulWidget {
  const FullCalendarBuilder({super.key});

  @override
  State<FullCalendarBuilder> createState() => _FullCalendarBuilderState();
}

class _FullCalendarBuilderState extends State<FullCalendarBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 15),
          child: Row(
            children: [
              Text(
                "رمضان 1446هـ",
                style: TextStyle(
                  color: context.colorPalette.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        SizedBox(
          height: 69,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 5),
            itemCount: 20,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.only(start: 15, top: 10, bottom: 7),
            itemBuilder: (context, index) {
              return CalenderCard(
                onTap: () {
                  setState(() {
                    // dateIndex = index;
                  });
                },
                dateIndex: 0,
                currentIndex: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
