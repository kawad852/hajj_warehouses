import 'package:shared/shared.dart';

class TaskImagesListview extends StatelessWidget {
  final List<String> images;

  const TaskImagesListview({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        height: 105,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: images.length,
          padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 10),
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
