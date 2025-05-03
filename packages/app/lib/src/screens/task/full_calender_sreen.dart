import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class FullCalenderSreen extends StatefulWidget {
  const FullCalenderSreen({super.key});

  @override
  State<FullCalenderSreen> createState() => _FullCalenderSreenState();
}

class _FullCalenderSreenState extends State<FullCalenderSreen> {
  int dateIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppBarText("جميع المهام")),
      bottomNavigationBar: const BottomAppBar(color: Colors.transparent, child: AddTaskWidget()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      dateIndex = index;
                    });
                  },
                  dateIndex: dateIndex,
                  currentIndex: index,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: context.colorPalette.greyC4C, thickness: 2),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: 5,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              itemBuilder: (context, index) {
                return TaskCard(task: TaskModel(createdBy: kCurrentLightUser));
              },
            ),
          ),
        ],
      ),
    );
  }
}
