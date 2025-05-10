import 'package:shared/shared.dart';

class ItemEditScreen extends StatefulWidget {
  final ItemModel item;

  const ItemEditScreen({super.key, required this.item});

  @override
  State<ItemEditScreen> createState() => _ItemEditScreenState();
}

class _ItemEditScreenState extends State<ItemEditScreen> {
  late ItemModel _item;

  void _onEdit(BuildContext context) {
    ApiService.fetch(
      context,
      callBack: () async {
        await kFirebaseInstant.items.doc(_item.id).update(_item.toJson());
        if (context.mounted) {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: context.appLocalization.successfullyUpdated);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _item = ItemModel.fromJson(widget.item.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_item.name)),
      bottomNavigationBar: BottomButton(
        text: context.appLocalization.update,
        onPressed: () {
          _onEdit(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            TextEditor(
              initialValue: _item.name,
              onChanged: (value) => _item.name = value!,
              labelText: context.appLocalization.itemName,
            ),
            NumbersEditor(
              initialValue: _item.minimumQuantity,
              onChanged: (value) => _item.minimumQuantity = value!,
              labelText: context.appLocalization.minimumLimit,
            ),
          ],
        ),
      ),
    );
  }
}
