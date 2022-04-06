
 import 'package:convida_ai_1/components/show_photo_camera.dart';
import 'package:convida_ai_1/components/show_photo_library.dart';
import 'package:flutter/material.dart';

showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          child: Column(children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text("Tire uma foto"),
              onTap:  () async => await showPhotoCamera(),
            ), 
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Escolha uma foto da galeria"),
              onTap: ()  async => await showPhotoLibrary(),
            )
          ])
        );
      }
    );
  }