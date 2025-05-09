import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class OperationDetalisScreen extends StatefulWidget {
  const OperationDetalisScreen({super.key});

  @override
  State<OperationDetalisScreen> createState() => _OperationDetalisScreenState();
}

class _OperationDetalisScreenState extends State<OperationDetalisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarText(context.appLocalization.processDetails)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OperationBubble(
              title: context.appLocalization.quantityRequired,
              value: "35",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: OperationBubble(
                title: context.appLocalization.reasonForDisposal,
                value:
                    "كميات فاسدة بسبب عدم استهلاكها في الوقت المحدد كميات فاسدة بسبب عدم استهلاكها في الوقت المحدد",
              ),
            ),
            TitledTextField(
              title: context.appLocalization.explanationsAndNotes,
              textStyle: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
              child: BaseEditor(
                initialValue:
                    "كميات فاسدة بسبب عدم استهلاكها في الوقت المحدد كميات فاسدة بسبب عدم استهلاكها في الوقت المحدد",
                filled: true,
                readOnly: true,
                fillColor: Colors.transparent,
                maxLines: 4,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorPalette.grey666),
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorPalette.grey666),
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                context.appLocalization.picturesAttached,
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: 90,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const BaseNetworkImage("", width: 90, height: 90);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
