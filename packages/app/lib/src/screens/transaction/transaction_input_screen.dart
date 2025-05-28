import 'package:app/src/screens/transaction/widgets/expenses_dropdown.dart';
import 'package:shared/shared.dart';

class TransactionInputScreen extends StatefulWidget {
  final TransactionType transactionType;

  const TransactionInputScreen({super.key, required this.transactionType});

  @override
  State<TransactionInputScreen> createState() => _TransactionInputScreenState();
}

class _TransactionInputScreenState extends State<TransactionInputScreen> {
  final _formKey = GlobalKey<FormState>();
  late TransactionModel _transaction;
  late Future<List<UserModel>> _employeesFuture;

  bool get _isDeposit => _transaction.transactionType == TransactionType.deposit.value;
  bool get _isWithdrawal => _transaction.transactionType == TransactionType.withdrawal.value;

  void _initialize() {
    if (_isDeposit) {
      _employeesFuture = kFirebaseInstant.users
          .where(MyFields.idBranch, isEqualTo: kSelectedBranchId)
          .get()
          .then((value) {
            return value.docs.map((e) => e.data()).toList();
          });
    } else {
      _employeesFuture = Future.value([]);
    }
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
      ApiService.fetch(
        context,
        callBack: () async {
          final batch = kFirebaseInstant.batch();
          final docRef = kFirebaseInstant.transactions.doc();
          _transaction.id = docRef.id;
          batch.set(docRef, _transaction);
          final branchDocRef = kFirebaseInstant.branches.doc(_transaction.branch.id);
          batch.update(branchDocRef, {
            MyFields.balance: FieldValue.increment(
              _isDeposit ? _transaction.amount : -_transaction.amount,
            ),
          });
          await batch.commit();
          if (context.mounted) {
            SendNotificationService.sendToUsers(
              context,
              id: _transaction.id,
              type: "TRANSACTION",
              titleEn: _isDeposit ? "💰Cash deposit" : "Cash Withdrawal",
              titleAr: _isDeposit ? "💰 إضافة عهدة" : "سحب من العهدة",
              bodyEn:
                  _isDeposit
                      ? "A new cash deposit of ${_transaction.amount} riyals has been added to your account by the administration."
                      : "${_transaction.amount} riyals was withdrawn by the management.",
              bodyAr:
                  _isDeposit
                      ? "💰 تم إضافة عهدة نقدية جديدة بقيمة ${_transaction.amount}ريال لحسابك من قبل الإدارة. "
                      : " تم سحب عهدة نقدية جديدة بقيمة${_transaction.amount}ريال من قبل الإدارة. ",
              toRoles: [RoleEnum.manager.value],
            );
            Navigator.pop(context);
            Fluttertoast.showToast(msg: context.appLocalization.theOperationWasSuccessful);
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _transaction = TransactionModel(
      createdAt: kNowDate,
      id: kUUID,
      branch: kBranch!,
      transactionType: widget.transactionType.value,
      amount: 0.0,
      user: kCurrentLightUser,
    );
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ImpededFutureBuilder(
      future: _employeesFuture,
      onComplete: (context, snapshot) {
        final employees = snapshot.data!;
        return Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomButton(
            text: context.appLocalization.add,
            onPressed: () {
              _submit(context);
            },
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      _isDeposit
                          ? context.appLocalization.addImprest
                          : context.appLocalization.recordExpense,
                      style: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  CounterWidget(
                    maxQuantity: null,
                    onChanged: (value) => _transaction.amount = value.toDouble(),
                  ),

                  if (_isDeposit) ...[
                    EditorLabel(context.appLocalization.reasonForAddition),
                    const SizedBox(height: 8),
                    Row(
                      children:
                          DepositReasonEnum.values.map((e) {
                            final isOne = e == DepositReasonEnum.one;
                            return CustomRadio(
                              value: e.value,
                              title:
                                  isOne
                                      ? context.appLocalization.forTheFirstTime
                                      : context.appLocalization.additionalSupply,
                              groupValue: _transaction.depositReason,
                              onChanged: (value) {
                                setState(() {
                                  _transaction.depositReason = value;
                                });
                              },
                            );
                          }).toList(),
                    ),
                  ],

                  if (_isWithdrawal)
                    ExpensesDropdown(
                      value: _transaction.expenseType,
                      onChanged: (value) => _transaction.expenseType = value,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TitledTextField(
                      title: context.appLocalization.explanationsAndNotes,
                      textStyle: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                      child: BaseEditor(
                        onChanged: (value) => _transaction.notes = value,
                        filled: true,
                        fillColor: Colors.transparent,
                        maxLines: 4,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.colorPalette.primary),
                          borderRadius: BorderRadius.circular(kRadiusSecondary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.colorPalette.primary),
                          borderRadius: BorderRadius.circular(kRadiusSecondary),
                        ),
                      ),
                    ),
                  ),

                  if (_isDeposit)
                    TitledTextField(
                      title: context.appLocalization.responsibleEmployee,
                      textStyle: TextStyle(
                        color: context.colorPalette.black001,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: context.colorPalette.primary),
                          borderRadius: BorderRadius.circular(kRadiusSecondary),
                        ),
                        child: DropDownEditor(
                          value: _transaction.employee?.id,
                          items:
                              employees.map((e) {
                                return DropdownMenuItem(value: e.id, child: Text(e.displayName));
                              }).toList(),
                          onChanged: (value) {
                            final user = employees.firstWhere((e) => e.id == value);
                            _transaction.employee = LightUserModel(
                              id: user.id,
                              displayName: user.displayName,
                            );
                          },
                          title: context.appLocalization.chooseEmployee,
                        ),
                      ),
                    ),
                  ImagesAttacher(
                    onChanged: (path) {},
                    title:
                        _isDeposit
                            ? context.appLocalization.attachPhotoOfDelivery
                            : context.appLocalization.attachPhotoInvoice,
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
