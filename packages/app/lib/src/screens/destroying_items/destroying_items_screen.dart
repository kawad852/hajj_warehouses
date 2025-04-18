import 'package:shared/shared.dart';

class DestroyingItemsScreen extends StatefulWidget {
  const DestroyingItemsScreen({super.key});

  @override
  State<DestroyingItemsScreen> createState() => _DestroyingItemsScreenState();
}

class _DestroyingItemsScreenState extends State<DestroyingItemsScreen> {
  int? _groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 165,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "يجب ان توضح الصور سبب اتلاف الأصناف",
              style: TextStyle(
                color: context.colorPalette.grey666,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            AttachImage(
              onTap: () {},
              title: "ارفاق صور للمواد التي سيتم اتلافها",
            ),
            StretchedButton(
              onPressed: () {},
              child: Text(
                "تسجيل الإتلاف",
                style: TextStyle(
                  color: context.colorPalette.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: const AppBarText("اتلاف اصناف")),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                "سبب الإتلاف",
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
                value: 0,
                title: "فاسدة",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                  });
                },
              ),
              CustomRadio(
                value: 1,
                title: "سوء نقل او تخزين",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "مشروحات وملاحظات حول الإتلاف",
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
            "يرجى ادخال الأصناف والكميات المراد اتلافها من كل صنف",
            style: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const ItemTableHeader(),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 5),
            itemBuilder: (context, index) {
              return ItemTableCell(
                onChangedQuntity: (value) {},
                itemName: "text",
              );
            },
          ),
          TextEditor(
            onChanged: (value) {},
            hintText: "ادخل رقم الصنف او الإسم",
            hintStyle: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: IconButton(
              onPressed: null,
              icon: CustomSvg(
                MyIcons.addTask,
                color: context.colorPalette.grey708,
                width: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
