import 'package:shared/shared.dart';

class UserInputScreen extends StatefulWidget {
  const UserInputScreen({super.key});

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;
  late PhoneController _phoneController;
  late UserModel _user;
  late Future<List<BranchModel>> _branchesFuture;

  void _initialize() {
    _branchesFuture = context.appProvider.getBranches();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          final auth = await _firebaseAuth.createUserWithEmailAndPassword(
            email: _user.email!,
            password: _user.password!,
          );
          if (context.mounted) {
            final userDocRef = kFirebaseInstant.users.doc();
            _user.id = auth.user!.uid;
            _user.createdAt = kNowDate;
            _user.languageCode = context.languageCode;
            _user.phoneNum = _phoneController.getPhoneNumber;
            _user.phoneCountryCode = _phoneController.countryCode;
            await userDocRef.set(_user);
          }
          if (context.mounted) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: "تمت العملية بنجاح");
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _user = UserModel();
    _phoneController = PhoneController(context);
    _initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BigFutureBuilder(
      future: _branchesFuture,
      onComplete: (context, snapshot) {
        final branches = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: const AppBarText("اضافة موظف")),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(child: BaseNetworkImage(kBurgerImage, width: 90, height: 90)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TitledTextField(
                      title: "الاسم الكامل",
                      child: TextEditor(onChanged: (value) => _user.displayName),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TitledTextField(
                          title: "المسمى الوظيفي",
                          child: TextEditor(onChanged: (value) => _user.jobTitle),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BranchesDropdown(
                          branches: branches,
                          title: "الفرع",
                          onChanged: (value) {
                            final branch = branches.firstWhere((e) => e.id == value);
                            _user.branch = LightBranchModel(id: branch.id, name: branch.name);
                          },
                          value: _user.branch?.id,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TitledTextField(
                            title: "الرقم الوطني",
                            child: TextEditor(onChanged: (value) => _user.nationalNumber = value!),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TitledTextField(
                          title: "الأجر",
                          child: DecimalsEditor(
                            onChanged: (value) => _user.salary = value!,
                            textAlign: TextAlign.center,
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
                    child: TitledTextField(
                      title: "العنوان",
                      child: TextEditor(onChanged: (value) => _user.address = value!),
                    ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TitledTextField(
                            title: "اسم المستخدم",
                            child: TextEditor(onChanged: (value) => _user.username = value!),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TitledTextField(
                            title: "كلمة المرور",
                            child: PasswordEditor(
                              onChanged: (value) => _user.password = value!,
                              initialValue: null,
                            ),
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
            ),
          ),
        );
      },
    );
  }
}
