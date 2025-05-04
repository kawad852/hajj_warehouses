import 'package:shared/shared.dart';

class ChatEditor extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onPressed;

  const ChatEditor({super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, bottomPadding + 10),
      child: BaseEditor(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        // padding: const EdgeInsetsDirectional.only(end: 10),
        hintText: context.appLocalization.aiHint,
        suffixIconConstraints: const BoxConstraints(maxHeight: 60),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: IconButton.filled(
            onPressed: onPressed,
            style: IconButton.styleFrom(backgroundColor: context.colorPalette.primary),
            icon: Transform.flip(
              flipX: context.languageCode == LanguageEnum.arabic,
              child: const CustomSvg(MyIcons.send),
            ),
          ),
        ),
      ),
    );
  }
}
