import 'package:shared/shared.dart';

extension OperationExteension on OperationType {
  OperationInfoModel getInfo(BuildContext context) {
    switch (this) {
      case OperationType.add:
        return OperationInfoModel(
          title: "إضافة كمية جديدة للصنف",
          radio: RadioInfoModel(
            label: "نوع التوريد",
            items: [
              RadioModel(label: "مشتريات ذاتية", value: "0"),
              RadioModel(label: "استلام طلبية", value: "1"),
            ],
          ),
        );

      case OperationType.supply:
        return OperationInfoModel(
          title: "طلب تزويد كمية للصنف",
          radio: RadioInfoModel(
            label: "حالة الطلب",
            items: [RadioModel(label: "طارئة", value: "1"), RadioModel(label: "عادية", value: "0")],
          ),
        );

      case OperationType.destroy:
        return OperationInfoModel(
          title: "أتلاف كمية للصنف",
          radio: RadioInfoModel(
            label: "سبب الإتلاف",
            items: [
              RadioModel(label: "فاسدة", value: "0"),
              RadioModel(label: "سوء نقل أو تخزين", value: "1"),
            ],
          ),
        );

      default:
        throw Exception();
    }
  }
}
