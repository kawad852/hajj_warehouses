import 'package:shared/shared.dart';

class CustomEditor<T> extends StatelessWidget {
  final Function(String?)? onChangedText;
  final Function(int?)? onChangedInt;
  final Function(double?)? onChangedDouble;
  final bool nullable;

  const CustomEditor._({
    super.key,
    this.onChangedText,
    this.onChangedInt,
    this.onChangedDouble,
    required this.nullable,
  });

  factory CustomEditor.string({Key? key, required Function(String? value) onChanged}) {
    return CustomEditor._(key: key, onChangedText: onChanged, nullable: false);
  }

  factory CustomEditor.int({
    Key? key,
    required Function(int? value) onChanged,
    required bool nullable,
  }) {
    return CustomEditor._(key: key, onChangedInt: onChanged, nullable: nullable);
  }

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      onChanged: (v) {
        final value = v.isEmpty && nullable ? null : v;
        if (onChangedText != null) {
          onChangedText!(value);
        } else if (onChangedInt != null) {
          onChangedInt!(value != null ? int.parse(value) : null);
        }
      },
    );
  }
}
