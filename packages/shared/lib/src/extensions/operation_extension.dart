import 'package:shared/shared.dart';

extension OperationExteension on OperationType {
  RadioInfoModel get _requestTypeRadioInfoModel => RadioInfoModel(
    label: "حالة الطلب",
    items: [RadioModel(label: "طارئة", value: "1"), RadioModel(label: "عادية", value: "2")],
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
              RadioModel(label: "مشتريات ذاتية", value: "1"),
              RadioModel(label: "استلام طلبية", value: "2"),
            ],
          ),
        );

      case OperationType.supply:
        return OperationInfoModel(
          title: "طلب تزويد كمية للصنف",
          radio: _requestTypeRadioInfoModel,
          buttonLabel: sendOrderButtonLabel,
        );
      case OperationType.transfer:
        return OperationInfoModel(
          title: "نقل مواد",
          buttonLabel: sendOrderButtonLabel,
          radio: _requestTypeRadioInfoModel,
        );

      case OperationType.destroy:
        return OperationInfoModel(
          title: singleItem ? "أتلاف كمية للصنف" : "إتلاف أصناف",
          buttonLabel: "تسجيل الإتلاف",
          radio: RadioInfoModel(
            label: "سبب الإتلاف",
            items: [
              RadioModel(label: "فاسدة", value: "1"),
              RadioModel(label: "سوء نقل أو تخزين", value: "2"),
            ],
          ),
        );

      default:
        throw Exception();
    }
  }
}
