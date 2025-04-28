import 'package:shared/shared.dart';

class BranchSelector extends StatelessWidget {
  final Widget Function(BuildContext, BranchModel) builder;

  const BranchSelector({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Selector<BranchModel, BranchModel>(
      selector: (context, provider) => provider,
      builder: (context, branch, _) {
        return builder(context, branch);
      },
    );
  }
}
