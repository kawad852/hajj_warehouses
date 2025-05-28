import 'package:app/screens_exports.dart';
import 'package:app/shared.dart';
import 'package:shared/shared.dart';

class NotificationRouteHandler {
  static void toggle(
    BuildContext context, {
    required String? id,
    required String? type,
    Map<dynamic, dynamic>? extra,
  }) {
    try {
      if (type == "ITEM") {
        context.navigate((context) {
          return ItemManagementScreen(id: id);
        });
      } else if (type == "OPERATION") {
        context.navigate((context) {
          return OperationDetailsScreen(operationId: id);
        });
      } else if (type == "ORDER") {
        context.navigate((context) {
          return OrderDetailsScreen(id: id);
        });
      } else if (type == "TASK") {
        context.navigate((context) {
          return TaskDetailsScreen(id: id);
        });
      } else if (type == "TRANSACTION") {
        context.navigate((context) {
          return const TransactionsScreen();
        });
      }
    } catch (e) {
      debugPrint("RouteError:: $e");
    }
  }
}
