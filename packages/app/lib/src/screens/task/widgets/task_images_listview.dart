import 'package:shared/shared.dart';

class TaskImagesListview extends StatelessWidget {
  final List<String> images;
  final EdgeInsetsGeometry? padding;

  const TaskImagesListview({super.key, required this.images, this.padding});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        height: 90,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: images.length,
          padding: padding,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final image = images[index];
            return BaseNetworkImage(image, width: 95, height: 95);
          },
        ),
      ),
    );
  }
}
