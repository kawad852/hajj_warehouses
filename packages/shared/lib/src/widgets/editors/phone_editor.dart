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
    return BaseEditor(
      initialValue: _controller.phoneNum,
      labelText: widget.labelText,
      onChanged: (value) {
        if (value.isEmpty) {
          _controller.phoneNum = null;
        } else {
          _controller.phoneNum = value;
        }
      },
      keyboardType: TextInputType.phone,
      required: widget.required,
      validator: (value) {
        if (!widget.required && (value == null || value.isEmpty)) {
          return null;
        } else if (value!.length < 9 || value.length > 11) {
          return "invalidPhoneNum";
        }
        return ValidationHelper.general(context, value);
      },
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: TextButton.icon(
          onPressed: () {
            _showCountriesSheet(context);
          },
          label: Text(_controller.getDialCode(), textDirection: TextDirection.ltr),
          icon: const Icon(Icons.arrow_drop_down_rounded),
        ),
      ),
    );
  }
}
