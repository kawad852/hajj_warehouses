import 'dart:io';

import 'package:shared/shared.dart';

class ImagesAttacher extends StatefulWidget {
  final void Function(List<XFile> files) onChanged;
  final String title;

  const ImagesAttacher({super.key, required this.onChanged, required this.title});

  @override
  State<ImagesAttacher> createState() => _ImagesAttacherState();
}

class _ImagesAttacherState extends State<ImagesAttacher> {
  final List<XFile> _files = [];

  Future<void> _pickImages(BuildContext context) async {
    AppOverlayLoader.fakeLoading();
    List<XFile> files = await ImagePicker().pickMultiImage(
      // maxWidth: widget.size.width + kImageSizeVariation,
    );
    if (files.isNotEmpty) {
      setState(() {
        _files.addAll(files);
      });
      widget.onChanged(_files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _pickImages(context);
          },
          child: Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: context.colorPalette.primary),
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
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
                Text(
                  widget.title,
                  style: TextStyle(
                    color: context.colorPalette.black001,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: List.generate(_files.length, (index) {
            final file = _files[index];
            return Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: FileImage(File(file.path)), fit: BoxFit.cover),
              ),
            );
          }),
        ),
      ],
    );
  }
}
