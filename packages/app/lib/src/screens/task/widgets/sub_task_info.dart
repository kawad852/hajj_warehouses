import 'package:shared/shared.dart';

class SubTaskInfo extends StatelessWidget {
  final String title;
  final String value;
  const SubTaskInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: context.colorPalette.grey666,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: context.colorPalette.primary,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
