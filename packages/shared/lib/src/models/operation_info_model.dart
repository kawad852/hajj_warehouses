class OperationInfoModel {
  final String title;
  final RadioInfoModel radio;
  final String buttonLabel;
  // final String noteLabel;
  // final String imageEditorLabel;

  OperationInfoModel({
    required this.title,
    required this.radio,
    required this.buttonLabel,
    // required this.noteLabel,
    // required this.imageEditorLabel,
  });
}

class RadioInfoModel {
  final String label;
  final List<RadioModel> items;

  RadioInfoModel({required this.label, required this.items});
}

class RadioModel {
  final String label;
  final String value;

  RadioModel({required this.label, required this.value});
}
