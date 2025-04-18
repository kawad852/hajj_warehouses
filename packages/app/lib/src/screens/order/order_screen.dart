import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText("طلب رقم 1731519#"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: StretchedButton(
                onPressed: () {},
                child: Text(
                  "قبول الطلب",
                  style: TextStyle(
                    color: context.colorPalette.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: StretchedButton(
                onPressed: () {},
                backgroundColor: context.colorPalette.redC10,
                child: Text(
                  "رفض الطلب",
                  style: TextStyle(
                    color: context.colorPalette.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          OrderCard(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "حالة الطلب : طارئة",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.black001,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const OrderStatus(),
              ],
            ),
          ),
          const SizedBox(height: 70),
          OrderCard(
            child: Text(
              "وقت الطلب : 07:35:01 صباحاً - 01-03-2025",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: StretchedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const CustomSvg(MyIcons.paperclip),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "2 اصناف في الطلب",
                            textAlign: TextAlign.center,
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
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: StretchedButton(
                    onPressed: () {},
                    backgroundColor: context.colorPalette.greyC4C,
                    child: Text(
                      "إستلام الطلب",
                      style: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          StretchedButton(
            onPressed: () {},
            child: Row(
              children: [
                const CustomSvg(MyIcons.map),
                Expanded(
                  child: Text(
                    "تتبع الطلب مباشرة على الخريطة",
                    textAlign: TextAlign.center,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "عمليات تمت على الطلب",
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ProcessTimeLine(
            itemCount: 5,

            contentsBuilder: (context, index) {
              return OperationCard(operation: OperationModel(createdAt: kNowDate));
            },
          ),
        ],
      ),
    );
  }
}
