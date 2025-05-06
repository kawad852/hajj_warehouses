import 'package:app/shared.dart';
import 'package:app/src/screens/task/widgets/timer_builder.dart';
import 'package:app/src/screens/task/widgets/toggle_button_child.dart';
import 'package:shared/shared.dart';

class SubTaskCard extends StatefulWidget {
  final String mainTaskId;
  final TaskModel task;

  const SubTaskCard({super.key, required this.task, required this.mainTaskId});

  @override
  State<SubTaskCard> createState() => _SubTaskCardState();
}

class _SubTaskCardState extends State<SubTaskCard> {
  bool isExpanded = false;
  final _storageService = StorageService();

  TaskModel get task => widget.task;

  Future<void> _pickImage(BuildContext context) async {
    AppOverlayLoader.fakeLoading();
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null && context.mounted) {
      ApiService.fetch(
        context,
        callBack: () async {
          final image = await _storageService.uploadFile(collection: "subTasks", file: file);
          final docRef = kFirebaseInstant.subTasks(widget.mainTaskId).doc(task.id);
          docRef.update({
            MyFields.images: FieldValue.arrayUnion([image]),
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
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
                start: BorderSide(color: context.colorPalette.greyC4C, width: 5),
              ),
              shape: BorderDirectional(
                start: BorderSide(color: context.colorPalette.greyC4C, width: 5),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CustomSvg(MyIcons.checkSolid),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            task.title,
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
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "غير",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black001,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                if (task.images.isNotEmpty)
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: SizedBox(
                      height: 105,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemCount: task.images.length,
                        padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final image = task.images[index];
                          return BaseNetworkImage(image, width: 95, height: 95);
                        },
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SubTaskInfo(title: "بدأت المهمة", value: task.startTime!.getTime(context)),
                      if (task.endedAt != null) ...[
                        const SizedBox(width: 8),
                        SubTaskInfo(title: "انتهت المهمة", value: task.endedAt!.getTime(context)),
                        const SizedBox(width: 8),
                        TimerBuilder(
                          startDateTime: task.startTime,
                          endDateTime: task.endedAt!,
                          child: (value) {
                            return SubTaskInfo(title: "الوقت المستغرق", value: value);
                          },
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isExpanded,
          child: SizedBox(
            height: 40,
            child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorPalette.primary,
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                  border: Border.all(color: Colors.white),
                ),
                child: ToggleButtons(
                  constraints: const BoxConstraints(minWidth: 120, minHeight: 40),
                  isSelected: const [true, true, true],
                  fillColor: context.colorPalette.primary,
                  selectedColor: context.colorPalette.white,
                  color: Colors.white,
                  borderColor: Colors.white,
                  textStyle: TextStyle(
                    color: context.colorPalette.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    fontFamily: GoogleFonts.cairo().fontFamily!,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  onPressed: (value) {
                    if (value == 0) {
                      _pickImage(context);
                    }
                  },
                  children: const [
                    ToggleButtonChild(icon: MyIcons.camera, title: "ارفاق صور"),
                    ToggleButtonChild(title: "01 : 33 : 22"),
                    ToggleButtonChild(icon: MyIcons.checkWhite, title: "إنهاء المهمة"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
