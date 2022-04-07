
import 'package:convida_ai_1/components/event_name_field.dart';
import 'package:convida_ai_1/components/my_image_picker.dart';
import 'package:flutter/material.dart';

class InviteCreation extends StatefulWidget {
  const InviteCreation(
      {Key? key, this.nameYourEvent = 'INSIRA O NOME DO SEU EVENTO'})
      : super(key: key);

  final String? nameYourEvent;

  @override
  State<InviteCreation> createState() => _InviteCreationState();
}

class _InviteCreationState extends State<InviteCreation> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: 400,
              child: EventNameField(nameEvent: widget.nameYourEvent,),
            ),
            SizedBox(
              height: 40,
              width: 80,
            ),
            MyImagePicker(),
            SizedBox(
              height: 40,
              width: 80,
            ),

          ],
        ),
      ),
    );
  }
}
