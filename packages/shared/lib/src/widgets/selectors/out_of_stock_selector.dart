import 'package:shared/shared.dart';

class OutOfStockSelector extends StatelessWidget {
  final Widget Function(BuildContext, List<ItemModel>) builder;

  const OutOfStockSelector({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Selector<List<ItemModel>, List<ItemModel>>(
      selector: (context, provider) => provider,
      builder: (context, items, _) {
        return builder(context, items);
      },
    );
  }
}
