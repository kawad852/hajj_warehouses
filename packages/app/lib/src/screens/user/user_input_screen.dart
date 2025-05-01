import 'package:shared/shared.dart';

class UserInputScreen extends StatefulWidget {
  const UserInputScreen({super.key});

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  late PhoneController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = PhoneController(context);
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppBarText("اضافة موظف")),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          const Align(child: BaseNetworkImage(kBurgerImage, width: 90, height: 90)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TitledTextField(title: "الاسم الكامل", child: TextEditor(onChanged: (value) {})),
          ),
          Row(
            children: [
              Expanded(
                child: TitledTextField(
                  title: "المسمى الوظيفي",
                  child: TextEditor(onChanged: (value) {}),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TitledTextField(
                  title: "فرع العمل",
                  child: DropDownEditor(
                    items: const [],
                    onChanged: (value) {},
                    title: "اختر الفرع",
                    value: "s",
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: TitledTextField(
                    title: "الرقم الوطني",
                    child: NumbersEditor(onChanged: (value) {}),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TitledTextField(
                    title: "رقم الهاتف",
                    child: PhoneEditor(controller: _phoneController),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TitledTextField(
                  title: "الأجر",
                  child: BaseEditor(
                    onChanged: (value) {},
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    suffixIcon: const IconButton(
                      onPressed: null,
                      icon: CustomSvg(MyIcons.currency),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TitledTextField(
                  title: "تاريخ بدأ العمل",
                  child: TextEditor(onChanged: (value) {}),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TitledTextField(title: "العنوان", child: TextEditor(onChanged: (value) {})),
          ),
          Row(
            children: [
              Switch(
                activeColor: context.colorPalette.grey708,
                activeTrackColor: context.colorPalette.greyD9D,
                value: true,
                onChanged: (value) {},
              ),
              const SizedBox(width: 5),
              Text(
                "تفعيل صلاحية الوصول للتطبيق",
                style: TextStyle(
                  color: context.colorPalette.black001,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: TitledTextField(
                    title: "اسم المستخدم",
                    child: TextEditor(onChanged: (value) {}),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TitledTextField(
                    title: "كلمة المرور",
                    child: PasswordEditor(onChanged: (value) {}, initialValue: null),
                  ),
                ),
              ],
            ),
          ),
          TitledTextField(
            title: "صلاحية الوصول",
            child: SizedBox(
              width: context.mediaQuery.width * 0.45,
              child: DropDownEditor(
                items: const [],
                onChanged: (value) {},
                title: "اختر الفرع",
                value: "s",
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const CustomSvg(MyIcons.attachCircle),
                  const SizedBox(width: 10),
                  Text(
                    "*",
                    style: TextStyle(
                      color: context.colorPalette.redC10,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "ارفاق صور لشهادة الصحة ، او عقد التوظيف او البطاقة",
                      style: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
