import 'package:app/src/screens/add_new_item/widgets/add_item_widget.dart';
import 'package:shared/shared.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({super.key});

  @override
  State<AddNewItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  final List<ItemModel> _items = [ItemModel(id: kUUID)];

  late final TextEditingController counterCtrl;
  int quntity = 1;
  List<String> data = [
    "تفاح",
    "موز",
    "عصير المراعي برتقال",
    "لبن المراعي كامل الدسم",
    "صلصلة طماطم",
    "بهارات كبسة حارة",
  ];

  @override
  void initState() {
    super.initState();
    counterCtrl = TextEditingController(text: "1");
  }

  @override
  void dispose() {
    counterCtrl.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      quntity++;
      counterCtrl.text = quntity.toString();
    });
  }

  void _decrementCounter() {
    if (quntity > 1) {
      setState(() {
        quntity--;
        counterCtrl.text = quntity.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: StretchedButton(
          onPressed: () {},
          child: Text(
            "اضافة",
            style: TextStyle(
              color: context.colorPalette.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBack(),
        title: const AppBarText("اضافة صنف جديد"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).copyWith(top: 0),
              child: Text(
                "يمكنك اضافة اكثر من صنف في نفس الوقت، لا يمكن تكرار اسماء الأصناف الجديدة مع الأصناف الموجوده مسبقاً.",
                style: TextStyle(
                  color: context.colorPalette.grey666,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverList.list(
              children:
                  List.generate(_items.length + 1, (index) {
                    if (index == _items.length) {
                      return IconButton.filled(
                        onPressed: () {
                          setState(() {
                            _items.add(ItemModel(id: kUUID));
                          });
                        },
                        icon: const Icon(Icons.add),
                      );
                    }
                    final element = _items[index];
                    return AddItemWidget(
                      key: ValueKey(element.id),
                      initialValue: 1,
                      onChanged: (value) => element.name = value!,
                      onQuantityChanged: (quantity) {},
                      removeButton:
                          _items.length > 1
                              ? IconButton.filled(
                                onPressed: () {
                                  setState(() {
                                    _items.removeAt(index);
                                  });
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: context.colorScheme.error,
                                  foregroundColor: context.colorScheme.onError,
                                ),
                                icon: Icon(Icons.remove_circle),
                              )
                              : null,
                    );
                  }).separator(const SizedBox(height: 10)).toList(),
              // _items.map((element) {

              // }).toList(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            sliver: SliverMainAxisGroup(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "مقترحات",
                      style: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children:
                        data.map((item) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 40,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: context.colorPalette.greyDAD),
                                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                                ),
                                child: Row(
                                  children: [
                                    CustomSvg(
                                      MyIcons.addTask,
                                      color: context.colorPalette.grey708,
                                      width: 20,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(
                                      item,
                                      style: TextStyle(
                                        color: context.colorPalette.black001,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
