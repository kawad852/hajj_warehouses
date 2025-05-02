import 'dart:io';

import 'package:flutter/services.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/helper/storage_service.dart';

class UserInputScreen extends StatefulWidget {
  const UserInputScreen({super.key});

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final _formKey = GlobalKey<FormState>();
  late PhoneController _phoneController;
  late UserModel _user;
  late Future<List<BranchModel>> _branchesFuture;
  final _storageService = StorageService();
  XFile? _file;
  List<XFile> _files = [];

  void _initialize() {
    _branchesFuture = context.appProvider.getBranches();
  }

  Future<void> _pickImage(BuildContext context) async {
    AppOverlayLoader.fakeLoading();
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _file = file;
      });
    }
  }

  Future<void> _pickImages(BuildContext context) async {
    AppOverlayLoader.fakeLoading();
    List<XFile> files = await ImagePicker().pickMultiImage();
    if (files.isNotEmpty) {
      setState(() {
        _files.addAll(files);
      });
    }
  }

  Future<void> _submit(BuildContext context) async {
    try {
      String? errorMsg;
      if (_file == null) {
        errorMsg = "الصورة الشخصية مطلوبة";
      } else if (_files.isEmpty) {
        errorMsg = "أرفق صور لشهادة الصحة ، او عقد التوظيف او البطاقة";
      }
      if (errorMsg != null) {
        Fluttertoast.showToast(msg: errorMsg);
      } else {
        if (_formKey.currentState!.validate()) {
          AppOverlayLoader.show();
          context.unFocusKeyboard();
          final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: "${_user.username}@hajjwarehouses.com",
            password: _user.password,
          );
          final id = auth.user!.uid;
          final userDocRef = kFirebaseInstant.users.doc(id);
          if (context.mounted) {
            _user.id = id;
            _user.createdAt = kNowDate;
            _user.languageCode = context.languageCode;
            _user.phoneNum = _phoneController.getPhoneNumber;
            _user.phoneCountryCode = _phoneController.countryCode;
            _user.profilePhoto = await _storageService.uploadFile(
              collection: "personalPhotos",
              file: _file!,
            );
            _user.images = await _storageService.uploadFiles("personalPhotos", _files);
            await userDocRef.set(_user);
          }
          if (context.mounted) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: "تمت العملية بنجاح");
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'weak-password') {
          context.showSnackBar("passwordWeakError");
        } else if (e.code == 'email-already-in-use') {
          context.showSnackBar("emailAlreadyInUse");
        } else {
          context.showSnackBar(context.appLocalization.generalError);
        }
      }
    } catch (e) {
      if (context.mounted) {
        context.showSnackBar(context.appLocalization.generalError);
      }
    } finally {
      AppOverlayLoader.hide();
    }
  }

  @override
  void initState() {
    super.initState();
    _user = UserModel(branch: kBranch);
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
          bottomNavigationBar: BottomButton(
            text: "إضافة",
            onPressed: () {
              _submit(context);
            },
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Align(child: BaseNetworkImage(kBurgerImage, width: 90, height: 90)),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Builder(
                        builder: (context) {
                          if (_file != null) {
                            return GestureDetector(
                              onTap: () {
                                _pickImage(context);
                              },
                              child: Image.file(
                                File(_file!.path),
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            );
                          }
                          return MaterialButton(
                            color: context.colorPalette.greyF2F,
                            elevation: 0,
                            onPressed: () {
                              _pickImage(context);
                            },
                            height: 90,
                            minWidth: 90,
                            child: const Icon(Icons.add),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TitledTextField(
                      title: "الاسم الكامل",
                      child: TextEditor(onChanged: (value) => _user.displayName = value!),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TitledTextField(
                          title: "المسمى الوظيفي",
                          child: TextEditor(onChanged: (value) => _user.jobTitle = value!),
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
                          labelText: '',
                          value: _user.branch?.id ?? kSelectedBranchId,
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
                            child: PhoneEditor(controller: _phoneController, required: true),
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
                          child: DatePickerEditor(
                            value: _user.workStartDate ?? kNowDate,
                            onChanged: (value) {
                              _user.workStartDate = value;
                            },
                          ),
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
                        value: _user.canAccessApp,
                        onChanged: (value) {
                          setState(() {
                            _user.canAccessApp = value;
                          });
                        },
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
                            child: TextEditor(
                              onChanged: (value) => _user.username = value!,
                              hintText: "بالأحرف الإنجليزية",
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                              ],
                            ),
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
                    onTap: () {
                      _pickImages(context);
                    },
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
                  if (_files.isNotEmpty)
                    SizedBox(
                      height: 90,
                      child: SingleChildScrollView(
                        child: Row(
                          children:
                              _files
                                  .map((e) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(e.path),
                                        height: 90,
                                        width: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  })
                                  .separator(const SizedBox(width: 10))
                                  .toList(),
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
