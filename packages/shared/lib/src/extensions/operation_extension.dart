import 'package:shared/shared.dart';

extension OperationExteension on OperationType {
  RadioInfoModel get _requestTypeRadioInfoModel => RadioInfoModel(
    label: "حالة الطلب",
    items: [
      RadioModel(label: "طارئة", value: RequestTypeEnum.urgent.value),
      RadioModel(label: "عادية", value: RequestTypeEnum.normal.value),
    ],
  );

  OperationInfoModel getInfo(BuildContext context, bool singleItem) {
    final addButtonLabel = "إضافة";
    final sendOrderButtonLabel = "إرسال الطلب";
    switch (this) {
      case OperationType.add:
        return OperationInfoModel(
          title: singleItem ? "إضافة كمية جديدة للصنف" : "إضافة كمية للمخزون",
          buttonLabel: addButtonLabel,
          radio: RadioInfoModel(
            label: "نوع التوريد",
            items: [
              RadioModel(label: "مشتريات ذاتية", value: SupplyTypeEnum.selfPurchase.value),
              RadioModel(label: "استلام طلبية", value: SupplyTypeEnum.orderReceiving.value),
            ],
          ),
        );

      case OperationType.supply:
        return OperationInfoModel(
          title: "طلب تزويد كمية للصنف",
          radio: _requestTypeRadioInfoModel,
          buttonLabel: sendOrderButtonLabel,
          noteLabel: "مشروحات وملاحظات حول الطلب",
        );
      case OperationType.transfer:
        return OperationInfoModel(
          title: "نقل مواد",
          buttonLabel: sendOrderButtonLabel,
          radio: _requestTypeRadioInfoModel,
          noteLabel: "مشروحات وملاحظات حول الطلب",
        );

      case OperationType.destroy:
        return OperationInfoModel(
          title: singleItem ? "أتلاف كمية للصنف" : "إتلاف أصناف",
          buttonLabel: "تسجيل الإتلاف",
          radio: RadioInfoModel(
            label: "سبب الإتلاف",
            items: [
              RadioModel(label: "فاسدة", value: DestroyReasonEnum.spoiled.value),
              RadioModel(
                label: "سوء نقل أو تخزين",
                value: DestroyReasonEnum.badTransportOrStorage.value,
              ),
            ],
          ),
          noteLabel: "مشروحات وملاحظات حول الإتلاف",
        );

      case OperationType.withdraw:
        return OperationInfoModel(
          title: singleItem ? "سحب كمية للصنف" : "سحب أصناف",
          buttonLabel: "سحب",
          radio: null,
          noteLabel: "مشروحات وملاحظات حول السحب",
        );

      default:
        throw Exception();
    }
  }
}
