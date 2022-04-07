import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  MyImagePicker({Key? key}) : super(key: key);

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File? image;

  _showOptions(BuildContext context) {
    Future pickImage(ImageSource source) async {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    }

    showModalBottomSheet(
        context: context,
        builder: (context) {
          // ignore: sized_box_for_whitespace
          return Column(children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text("Tirar foto"),
              onTap: () => pickImage(ImageSource.camera),
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Escolha uma foto da biblioteca"),
              onTap: () => pickImage(ImageSource.gallery),
            )
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => _showOptions(context),
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            child: image != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                      image!,
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                )
                : Image.asset('lib/assets/photo.png')),
      ),
    );
  }
}
