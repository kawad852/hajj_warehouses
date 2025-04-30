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

  bool get _isDeposit => _transaction.transactionType == TransactionType.deposit.value;
  bool get _isWithdrawal => _transaction.transactionType == TransactionType.withdrawal.value;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.unFocusKeyboard();
    }
  }

  @override
  void initState() {
    super.initState();
    _transaction = TransactionModel(
      createdAt: kNowDate,
      id: kUUID,
      branchId: kSelectedBranchId,
      transactionType: widget.transactionType.value,
      amount: 0.0,
      operationId: '0',
      user: kCurrentLightUser,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: StretchedButton(
        onPressed: () {
          _submit(context);
        },
        child: Text(
          "اضافة",
          style: TextStyle(
            color: context.colorPalette.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                  _isDeposit ? "اضافة عهدة" : "تسجيل مصروف",
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              CounterWidget(maxQuantity: 1, onChanged: (value) {}),

              if (_isDeposit) ...[
                const EditorLabel("سبب الإضافة"),
                const SizedBox(height: 8),
                Row(
                  children:
                      DepositReasonEnum.values.map((e) {
                        final isOne = e == DepositReasonEnum.one;
                        return CustomRadio(
                          value: e.value,
                          title: isOne ? "لأول مره" : "تزويد أضافي",
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
                  title: "مشروحات وملاحظات",
                  textStyle: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                  child: BaseEditor(
                    onChanged: (value) {},
                    filled: true,
                    fillColor: Colors.transparent,
                    maxLines: 4,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: context.colorPalette.grey708),
                      borderRadius: BorderRadius.circular(kRadiusSecondary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: context.colorPalette.grey708),
                      borderRadius: BorderRadius.circular(kRadiusSecondary),
                    ),
                  ),
                ),
              ),

              if (_isDeposit)
                TitledTextField(
                  title: "الموظف المسؤول",
                  textStyle: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: context.colorPalette.grey708),
                      borderRadius: BorderRadius.circular(kRadiusSecondary),
                    ),
                    child: DropDownEditor(
                      items: const [],
                      onChanged: (value) {},
                      title: "اختر الموظف",
                      value: "s",
                    ),
                  ),
                ),
              ImagesAttacher(
                onChanged: (path) {},
                title: _isDeposit ? "ارفاق صورة لسند التسليم او الحوالة" : "ارفاق صورة للفاتورة",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
