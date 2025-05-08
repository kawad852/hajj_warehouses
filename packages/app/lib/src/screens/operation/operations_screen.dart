import 'package:shared/shared.dart';

class OperationsScreen extends StatefulWidget {
  const OperationsScreen({super.key});

  @override
  State<OperationsScreen> createState() => _OperationsScreenState();
}

class _OperationsScreenState extends State<OperationsScreen> {
  late Query<InventoryOperationModel> _operationsQuery;

  void _initializeOperations() {
    _operationsQuery = kFirebaseInstant.inventoryOperations.whereIdBranch.orderByDesc;
  }

  @override
  void initState() {
    super.initState();
    _initializeOperations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarText(context.appLocalization.operationsLog)),
      body: CustomFirestoreQueryBuilder(
        query: _operationsQuery,
        onComplete: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.docs.length,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) {
              if (snapshot.isLoadingMore(index)) {
                return const FPLoading();
              }
              final operation = snapshot.docs[index].data();
              final operationType = operation.operationType;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CustomSvg(
                      operationType == OperationType.create.value ||
                              operationType == OperationType.add.value
                          ? MyIcons.addSquare
                          : operationType == OperationType.withdraw.value
                          ? MyIcons.minusSquare
                          : MyIcons.closeSquare,
                    ),
                  ),
                  Expanded(child: OperationCard(operation: operation)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
