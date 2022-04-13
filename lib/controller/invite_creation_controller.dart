import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convida_ai_1/classes/evento.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../classes/evento.dart';

class InviteCreationController {
  Future<File> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    final file = File(image!.path);
    return file;
  }

  Future<void> uploadImage(File fileToUpload, String nameOfYourEvent) async {
    final storageRef = FirebaseStorage.instance.ref();
    final invitationsRef =
        storageRef.child("images").child('Images of $nameOfYourEvent');
    final invitationsImagesRef =
        invitationsRef.child("convite de $nameOfYourEvent.jpg");
    try {
      await invitationsImagesRef.putFile(fileToUpload);
    } on FirebaseException catch (e) {
      print('Não foi possível salvar a foto: ${e.code}');
    }
  }

  Future<void> addTextFields(
    String eventName,
    String eventDate,
    String eventLocation,
    String? eventCost,
    String? eventPayment,
    String uID,
    String? imageUrl,
  ) async {
    return FirebaseFirestore.instance
        .collection('events')
        .doc()
        .set(Evento(eventName, imageUrl, eventDate, eventLocation, eventCost,
                eventPayment, uID)
            .toJson())
        .then((value) => debugPrint('Event added'))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  Future<String> getImageUrl(String nameOfYourEvent) async {
    final imageUrl = await FirebaseStorage.instance
        .ref()
        .child(
            "images/Images of $nameOfYourEvent/convite de $nameOfYourEvent.jpg")
        .getDownloadURL();
    return imageUrl;
  }
}
