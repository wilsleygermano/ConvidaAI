

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<String?> showPhotoCamera() async {
    final fileCamera = await ImagePicker().pickImage(source: ImageSource.camera);
    if (fileCamera != null) {
    return fileCamera.path;
    }
  }
