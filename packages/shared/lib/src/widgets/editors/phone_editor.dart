import '../../../shared.dart';
import '../../models/country/country_model.dart';
import '../countries_bottomsheet.dart';

class PhoneEditor extends StatefulWidget {
  final PhoneController controller;
  final bool required;
  final EdgeInsetsGeometry? padding;
  final String? labelText;

  const PhoneEditor({
    super.key,
    required this.controller,
    this.required = true,
    this.padding,
    this.labelText,
  });

  @override
  State<PhoneEditor> createState() => _PhoneEditorState();
}

class _PhoneEditorState extends State<PhoneEditor> {
  late PhoneController _controller;

  void _showCountriesSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        return const CountriesBottomSheet();
      },
    ).then((value) {
      if (value != null) {
        final countryModel = value as CountryModel;
        setState(() {
          _controller.countryCode = countryModel.code;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BaseEditor(
        initialValue: _controller.phoneNum,
        labelText: widget.labelText,
        textDirection: TextDirection.ltr,
        onChanged: (value) {
          if (value.isEmpty) {
            _controller.phoneNum = null;
          } else {
            _controller.phoneNum = value;
          }
        },
        keyboardType: TextInputType.phone,
        alignLabelWithHint: false,
        required: widget.required,
        validator: (value) {
          if (!widget.required && (value == null || value.isEmpty)) {
            return null;
          } else if (value!.length < 9 || value.length > 11) {
            return "invalidPhoneNum";
          }
          return ValidationHelper.general(context, value);
        },
        suffixIconConstraints: const BoxConstraints(maxWidth: 75),
        prefixIcon: Center(
          child: Material(
            type: MaterialType.transparency,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                _showCountriesSheet(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_controller.getDialCode(), textDirection: TextDirection.ltr),
                    const SizedBox(width: 5),
                    const Icon(Icons.arrow_drop_down_rounded),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
