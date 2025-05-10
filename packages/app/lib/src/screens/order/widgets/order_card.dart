import 'package:shared/shared.dart';

class OrderCard extends StatelessWidget {
  final Widget child;
  const OrderCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF2F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: child,
    );
  }
}
