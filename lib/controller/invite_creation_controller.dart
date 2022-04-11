import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InviteCreationController {
  Future<File> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    final file = File(image!.path);
    return file;
  }

  Future<void> uploadImage(File fileToUpload, String uID) async {
    final storageRef = FirebaseStorage.instance.ref();
    final invitationsRef = storageRef.child("images").child('Images of $uID');
    final invitationsImagesRef = invitationsRef.child("convite de $uID em ${DateTime.now()}.jpg");
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
      String uID) async {
    return FirebaseFirestore.instance
        .collection('events')
        .doc("Eventos de $uID").collection('my_events').doc()
        .set({
          'event_name': eventName,
          'event_date': eventDate,
          'event_location': eventLocation,
          'event_cost': eventCost,
          'event_payment': eventPayment
        })
        .then((value) => debugPrint('Event added'))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }
}
