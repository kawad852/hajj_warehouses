import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  FirebaseStorage get _firebaseStorage => FirebaseStorage.instance;

  Future<String> uploadFile({
    required String collection,
    required XFile file,
    String contentType = "image/jpeg",
  }) async {
    final image = await _firebaseStorage.ref('$collection/${file.name}').putData(
          await file.readAsBytes(),
          SettableMetadata(contentType: contentType),
        );
    var url = await image.ref.getDownloadURL();
    return url;
  }

  Future<List<String>> uploadFiles(String collection, List<Object> files) async {
    List<String> images = [];
    for (var element in files) {
      if (element is String) {
        images.add(element);
      }
      if (element is XFile) {
        final image = await uploadFile(
          collection: collection,
          file: element,
        );
        images.add(image);
      }
    }
    return images;
  }

  Future<void> deleteFiles({
    required List<dynamic> files,
  }) async {
    for (var element in files) {
      if (element != null) {
        await FirebaseStorage.instance.refFromURL(element).delete();
      }
    }
  }
}
