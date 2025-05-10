import '../../../shared.dart';

class EmailEditor extends StatelessWidget {
  final String? initialValue;
  final Function(String?) onChanged;
  final bool readonly;
  final bool isShow;
  final bool withErrorIndicator;

  const EmailEditor({
    super.key,
    required this.onChanged,
    required this.initialValue,
    this.readonly = false,
    this.isShow = false,
    this.withErrorIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      initialValue: initialValue,
      title: context.appLocalization.email,
      keyboardType: TextInputType.emailAddress,
      suffixIconConstraints: const BoxConstraints(maxWidth: 40),
      suffixIcon: const Center(child: CustomSvg(MyIcons.sms)),
      required: true,
      readOnly: readonly,
      onChanged: (value) {
        if (value.isEmpty) {
          onChanged(null);
        } else {
          onChanged(value);
        }
      },
      validator: (value) => ValidationHelper.email(context, value),
    );
  }
}
