 import 'package:image_picker/image_picker.dart';

Future<String?> showPhotoLibrary() async {
    final fileLibrary = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (fileLibrary != null) {
    return fileLibrary.path;
    }
  }