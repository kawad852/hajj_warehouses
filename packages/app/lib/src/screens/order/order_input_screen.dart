import 'package:app/src/screens/search/search_screen.dart';
import 'package:shared/shared.dart';

class OrderInputScreen extends StatefulWidget {
  const OrderInputScreen({super.key});

  @override
  State<OrderInputScreen> createState() => _OrderInputScreenState();
}

class _OrderInputScreenState extends State<OrderInputScreen> {
  late OrderModel _order;

  void _onAdd(BuildContext context) {
    ApiService.fetch(
      context,
      callBack: () async {
        _order.id = await RowIdHelper.getOrderId();
        _order.createdAt = kNowDate;
        _order.userId = kSelectedUserId;

        await kFirebaseInstant.orders.doc(_order.id).set(_order);
        if (context.mounted) {
          Fluttertoast.showToast(
            msg: context.appLocalization.addedSuccessfully,
          );
          context.pop();
        }
      },
    );
  }

  @override
  void initState() {
    _order = OrderModel(status: OrderStatusEnum.placed.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(
        text: "ارسال الطلب",
        onPressed: () {
          _onAdd(context);
        },
      ),
      appBar: AppBar(title: const AppBarText("ارسال طلب جديد")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "*",
                  style: TextStyle(
                    color: context.colorPalette.redC10,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "حالة الطلب",
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CustomRadio(
                  value: false,
                  title: "عادية",
                  groupValue: _order.urgent,
                  onChanged: (value) {
                    setState(() {
                      _order.urgent = false;
                    });
                  },
                ),
                CustomRadio(
                  value: true,
                  title: "طارئة",
                  groupValue: _order.urgent,
                  onChanged: (value) {
                    setState(() {
                      _order.urgent = true;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 80),
            Text(
              "مشروحات وملاحظات حول الطلب",
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BaseEditor(
                onChanged: (value) => _order.note = value,
                filled: true,
                fillColor: Colors.transparent,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorPalette.greyBDB),
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorPalette.greyBDB),
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
              ),
            ),
            Text(
              "يمكنك اضافة اكثر من صنف إلى الطلب مع تحديد الكمية المطلوبة لكل صنف  ",
              style: TextStyle(
                color: context.colorPalette.grey666,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const ItemTableHeader(),
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: _order.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 5),
              itemBuilder: (context, index) {
                final item = _order.items[index];
                return ItemTableCell(
                  onChangedQuntity: (value) {},
                  itemName: item.name,
                );
              },
            ),
            ProductsSearchScreen(
              indexName: AlgoliaIndices.items.value,
              isFullScreen: false,
              onTap: (e) {
                context.pop();
                final item = LightItemModel(id: e.id, name: e.name);
                setState(() {
                  _order.items = [..._order.items, item];
                });
              },
              builder: (controller) {
                return BaseEditor(
                  hintText: "ادخل رقم الصنف او الإسم",
                  hintStyle: TextStyle(
                    color: context.colorPalette.grey666,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  readOnly: true,
                  onTap: () {
                    controller.openView();
                  },
                  canRequestFocus: false,
                  prefixIcon: IconButton(
                    onPressed: null,
                    icon: CustomSvg(
                      MyIcons.addTask,
                      color: context.colorPalette.grey708,
                      width: 20,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
