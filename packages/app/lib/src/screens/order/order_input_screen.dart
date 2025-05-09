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
        // _order.id = await _order.getId();
        // _order.createdAt = kNowDate;
        // // _order.userId = kSelectedUserId;
        //
        // await kFirebaseInstant.orders.doc(_order.id).set(_order);
        // if (context.mounted) {
        //   Fluttertoast.showToast(msg: context.appLocalization.addedSuccessfully);
        //   context.pop();
        // }
      },
    );
  }

  @override
  void initState() {
    _order = OrderModel(
      status: OrderStatusEnum.placed.value,
      user: kCurrentLightUser,
      branch: kBranch!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.sendRequest,
        onPressed: () {
          _onAdd(context);
        },
      ),
      appBar: AppBar(title: AppBarText(context.appLocalization.sendNewRequest)),
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
                  context.appLocalization.requestStatus,
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
                  title: context.appLocalization.normal,
                  groupValue: '0',
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                CustomRadio(
                  value: true,
                  title: context.appLocalization.urgent,
                  groupValue: '0',
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              context.appLocalization.explanationsNotesAboutRequest,
              style: TextStyle(
                color: context.colorPalette.black001,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BaseEditor(
                onChanged: (value) {},
                filled: true,
                fillColor: Colors.transparent,
                maxLines: 3,
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
              context.appLocalization.youCanAddMoreItemToOrder,
              style: TextStyle(
                color: context.colorPalette.grey666,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const ItemTableHeader(),
            // ListView.separated(
            //   separatorBuilder: (context, index) => const SizedBox(height: 5),
            //   itemCount: 1,
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   padding: const EdgeInsets.only(bottom: 5),
            //   itemBuilder: (context, index) {
            //     final item = ItemModel();
            //     final length = 1;
            //     return ItemTableCell(
            //       key: ValueKey("$length${item.id}"),
            //       onChangedQuntity: (value) {},
            //       itemName: item.name,
            //       autoFocus: index + 1 == length,
            //       length: length,
            //       onRemove: () {
            //         setState(() {});
            //       },
            //     );
            //   },
            // ),
            SearchScreen(
              indexName: AlgoliaIndices.items.value,
              isFullScreen: false,
              onTap: (e) {
                final ids = [];
                if (ids.contains(e.id)) {
                  Fluttertoast.showToast(msg: context.appLocalization.itemAlreadyAdded);
                  return;
                }
                Navigator.pop(context);
                final item = LightItemModel(id: e.id, name: e.name);
                setState(() {});
              },
              builder: (controller) {
                return BaseEditor(
                  hintText: context.appLocalization.enterItemNumberOrName,
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
                      color: context.colorPalette.primary,
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
