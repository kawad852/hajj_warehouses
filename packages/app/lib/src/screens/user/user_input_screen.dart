import 'dart:io';

import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

class UserInputScreen extends StatefulWidget {
  final UserModel? user;

  const UserInputScreen({super.key, this.user});

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
  final List<Object> _files = [];

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
      if (_user.profilePhoto == null && _file == null) {
        errorMsg = context.appLocalization.personalPhotoRequired;
      } else if ((_user.images?.isEmpty ?? false) && _files.isEmpty) {
        errorMsg = context.appLocalization.attachIdCard;
      }
      if (errorMsg != null) {
        Fluttertoast.showToast(msg: errorMsg);
      } else {
        if (_formKey.currentState!.validate()) {
          AppOverlayLoader.show();
          context.unFocusKeyboard();
          if (widget.user == null) {
            final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: "${_user.username}@hajjwarehouses.com",
              password: _user.password,
            );
            final id = auth.user!.uid;
            _user.id = id;
            _user.createdAt = kNowDate;
          }
          final userDocRef = kFirebaseInstant.users.doc(_user.id);
          if (context.mounted) {
            _user.languageCode = context.languageCode;
            _user.phoneNum = _phoneController.getPhoneNumber;
            _user.phoneCountryCode = _phoneController.countryCode;
            if (_file != null) {
              _user.profilePhoto = await _storageService.uploadFile(
                collection: "personalPhotos",
                file: _file!,
              );
            }
            if (_files.isNotEmpty) {
              _user.images = await _storageService.uploadFiles("personalPhotos", _files);
            }
            await userDocRef.set(_user);
          }
          if (context.mounted) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: context.appLocalization.theOperationWasSuccessful);
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
    _user = UserModel.fromJson(widget.user?.toJson() ?? UserModel(branch: kBranch).toJson());
    _phoneController = PhoneController(
      context,
      countryCode: _user.phoneCountryCode,
      phoneNum: _user.phoneNum,
    );
    if (_user.images != null) {
      _files.addAll(_user.images!);
    }
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
          appBar: AppBar(title: AppBarText(context.appLocalization.addEmployee)),
          bottomNavigationBar: BottomButton(
            text: context.appLocalization.add,
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
                          } else if (_user.profilePhoto != null) {
                            return BaseNetworkImage(
                              _user.profilePhoto!,
                              height: 90,
                              width: 90,
                              onTap: () {
                                _pickImage(context);
                              },
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
                      title: context.appLocalization.fullName,
                      child: TextEditor(
                        initialValue: _user.displayName,
                        onChanged: (value) => _user.displayName = value!,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TitledTextField(
                          title: context.appLocalization.jobTitle,
                          child: TextEditor(
                            initialValue: _user.jobTitle,
                            onChanged: (value) => _user.jobTitle = value!,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TitledTextField(
                          title: context.appLocalization.role,
                          child: DropDownEditor(
                            value: _user.role,
                            onChanged: (value) {
                              setState(() {
                                _user.role = value;
                                if (value == RoleEnum.admin.value) {
                                  _user.branch = null;
                                }
                              });
                            },
                            title: "",
                            items:
                                RoleEnum.values.map((e) {
                                  return DropdownMenuItem(value: e.value, child: Text(e.value));
                                }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_user.role != RoleEnum.admin.value)
                    BranchesDropdown(
                      key: ValueKey(_user.role),
                      branches: branches,
                      title: context.appLocalization.branch,
                      onChanged: (value) {
                        final branch = branches.firstWhere((e) => e.id == value);
                        _user.branch = LightBranchModel(id: branch.id, name: branch.name);
                      },
                      labelText: '',
                      value: _user.branch?.id,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TitledTextField(
                            title: context.appLocalization.nationalIDNumber,
                            child: TextEditor(
                              initialValue: _user.nationalNumber,
                              onChanged: (value) => _user.nationalNumber = value!,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TitledTextField(
                            title: context.appLocalization.phoneNumber,
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
                          title: context.appLocalization.salary,
                          child: DecimalsEditor(
                            initialValue: _user.salary,
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
                          title: context.appLocalization.startDate,
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
                      title: context.appLocalization.address,
                      child: TextEditor(
                        initialValue: _user.address,
                        onChanged: (value) => _user.address = value!,
                      ),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Switch(
                  //       activeColor: context.colorPalette.primary,
                  //       activeTrackColor: context.colorPalette.greyD9D,
                  //       value: _user.canAccessApp,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _user.canAccessApp = value;
                  //         });
                  //       },
                  //     ),
                  //     const SizedBox(width: 5),
                  //     Text(
                  //       context.appLocalization.activateApplicationAccessPermission,
                  //       style: TextStyle(
                  //         color: context.colorPalette.black001,
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  if (_user.role != RoleEnum.employee.value)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TitledTextField(
                              title: context.appLocalization.userName,
                              child: TextEditor(
                                initialValue: _user.username,
                                readOnly: widget.user != null,
                                onChanged: (value) => _user.username = value!,
                                hintText: context.appLocalization.inEnglishLetters,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TitledTextField(
                              title: context.appLocalization.password,
                              child: PasswordEditor(
                                initialValue: _user.password,
                                onChanged: (value) => _user.password = value!,
                              ),
                            ),
                          ),
                        ],
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
                              context.appLocalization.attachIdCard,
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
                                    if (e is XFile) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          File(e.path),
                                          height: 90,
                                          width: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return BaseNetworkImage(e as String, height: 90, width: 90);
                                    }
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
