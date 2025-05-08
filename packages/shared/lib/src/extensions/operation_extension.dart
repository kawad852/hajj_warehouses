import 'package:app/main.dart';
import 'package:path/path.dart';
import 'package:shared/shared.dart';

extension OperationExteension on OperationType {
  RadioInfoModel get _requestTypeRadioInfoModel => RadioInfoModel(
    label: rootNavigatorKey.currentContext!.appLocalization.requestStatus,
    items: [
      RadioModel(label: rootNavigatorKey.currentContext!.appLocalization.urgent, value: RequestTypeEnum.urgent.value),
      RadioModel(label: rootNavigatorKey.currentContext!.appLocalization.normal, value: RequestTypeEnum.normal.value),
    ],
  );

  OperationInfoModel getInfo(BuildContext context, bool singleItem) {
    final addButtonLabel = rootNavigatorKey.currentContext!.appLocalization.add;
    final sendOrderButtonLabel = rootNavigatorKey.currentContext!.appLocalization.sendRequest;
    switch (this) {
      case OperationType.add:
        return OperationInfoModel(
          title: singleItem ? rootNavigatorKey.currentContext!.appLocalization.addNewQuantityForItem : rootNavigatorKey.currentContext!.appLocalization.addQuantityToStock,
          buttonLabel: addButtonLabel,
          radio: RadioInfoModel(
            label: rootNavigatorKey.currentContext!.appLocalization.supplyType,
            items: [
              RadioModel(label: rootNavigatorKey.currentContext!.appLocalization.selfPurchase, value: SupplyTypeEnum.selfPurchase.value),
              RadioModel(label: rootNavigatorKey.currentContext!.appLocalization.receiveOrder, value: SupplyTypeEnum.orderReceiving.value),
            ],
          ),
        );

      case OperationType.supply:
        return OperationInfoModel(
          title: rootNavigatorKey.currentContext!.appLocalization.requestSupplyQuantityItem,
          radio: _requestTypeRadioInfoModel,
          buttonLabel: sendOrderButtonLabel,
          noteLabel: rootNavigatorKey.currentContext!.appLocalization.explanationsNotesAboutRequest,
        );
      case OperationType.transfer:
        return OperationInfoModel(
          title: rootNavigatorKey.currentContext!.appLocalization.transferMaterials,
          buttonLabel: sendOrderButtonLabel,
          radio: _requestTypeRadioInfoModel,
          noteLabel: rootNavigatorKey.currentContext!.appLocalization.explanationsNotesAboutRequest,
        );

      case OperationType.destroy:
        return OperationInfoModel(
          title: singleItem ? rootNavigatorKey.currentContext!.appLocalization.disposeQuantityItem : rootNavigatorKey.currentContext!.appLocalization.discardItems,
          buttonLabel: rootNavigatorKey.currentContext!.appLocalization.recordDisposal,
          radio: RadioInfoModel(
            label: rootNavigatorKey.currentContext!.appLocalization.reasonForDisposal,
            items: [
              RadioModel(label: rootNavigatorKey.currentContext!.appLocalization.damaged, value: DestroyReasonEnum.spoiled.value),
              RadioModel(
                label: rootNavigatorKey.currentContext!.appLocalization.poorTransportationOrStorage,
                value: DestroyReasonEnum.badTransportOrStorage.value,
              ),
            ],
          ),
          noteLabel: rootNavigatorKey.currentContext!.appLocalization.explanationsNotesAboutDisposal,
        );

      case OperationType.withdraw:
        return OperationInfoModel(
          title: singleItem ? rootNavigatorKey.currentContext!.appLocalization.withdrawQuantityItem : rootNavigatorKey.currentContext!.appLocalization.withdrawItems,
          buttonLabel: rootNavigatorKey.currentContext!.appLocalization.withdraw,
          radio: null,
          noteLabel: rootNavigatorKey.currentContext!.appLocalization.explanationsNotesWithdrawal,
        );

      default:
        throw Exception();
    }
  }
}
