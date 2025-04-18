import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class ItemManagementScreen extends StatefulWidget {
  final ItemModel item;

  const ItemManagementScreen({super.key, required this.item});

  @override
  State<ItemManagementScreen> createState() => _ItemManagementScreenState();
}

class _ItemManagementScreenState extends State<ItemManagementScreen> {
  late Query<OperationModel> _query;

  ItemModel get _item => widget.item;

  void _initialize() {
    _query = kFirebaseInstant.items
        .doc(_item.id)
        .collection(MyCollections.operations)
        .withConverter<OperationModel>(
          fromFirestore: (snapshot, _) => OperationModel.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson(),
        );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            pinned: true,
            leading: CustomBack(),
            title: AppBarText("إدارة صنف"),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomSvg(MyIcons.edit, width: 30),
              ),
            ],
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverList.list(
              children: [
                const ManageButton(title: "اسم الصنف : ارز حبة طويلة ( 10 كغ )"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: ManageButton(
                          title: "الكمية المتوفرة : 91",
                          backgroundColor: context.colorPalette.grey708,
                          textColor: context.colorPalette.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: ManageButton(
                          title: "الحد الأدنى : 100",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ManageButton(
                        onTap: () {},
                        title: "اضافة كمية",
                        iconWidth: 20,
                        icon: MyIcons.addTask,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: ManageButton(
                        onTap: () {},
                        title: "طلب تزويد",
                        icon: MyIcons.truckTime,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: ManageButton(
                        onTap: () {},
                        title: "إتلاف اصناف",
                        backgroundColor: context.colorPalette.redC33,
                        icon: MyIcons.trash,
                        iconColor: null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: ManageButton(
                    onTap: () {},
                    width: 115,
                    title: "سحب كمية",
                    iconWidth: 20,
                    icon: MyIcons.addTask,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 10),
                  child: Text(
                    "عمليات تمت على الصنف",
                    style: TextStyle(
                      color: context.colorPalette.black001,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverFillRemaining(
              child: CustomFirestoreQueryBuilder(
                query: _query,
                onComplete: (context, snapshot) {
                  return ProcessTimeLine(
                    itemCount: snapshot.docs.length,
                    contentsBuilder: (context, index) {
                      if (snapshot.isLoadingMore(index)) {
                        return const FPLoading();
                      }
                      final operation = snapshot.docs[index].data();
                      return OperationCard(operation: operation);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
