import 'dart:io';

import 'package:convida_ai_1/components/event_name_field.dart';
import 'package:convida_ai_1/components/invite_fields.dart';
import 'package:convida_ai_1/components/invite_fields_text.dart';
import 'package:convida_ai_1/components/my_image_picker.dart';
import 'package:convida_ai_1/screens/invite_creation_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InviteCreation extends StatefulWidget {
  const InviteCreation(
      {Key? key, this.nameYourEvent = 'INSIRA O NOME DO SEU EVENTO'})
      : super(key: key);

  final String? nameYourEvent;

  @override
  State<InviteCreation> createState() => _InviteCreationState();
}

class _InviteCreationState extends State<InviteCreation> {
  final _controller = InviteCreationController();
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EventNameField(
                nameEvent: widget.nameYourEvent,
              ),
              ImagePreviewWidget(
                  previewImage: file,
                  onCameraTap: () async {
                    final pickedFile =
                        await _controller.pickImage(ImageSource.camera);
                    setState(() {
                      file = pickedFile;
                    });
                  },
                  onGalleryTap: () async {
                    final pickedFile =
                        await _controller.pickImage(ImageSource.gallery);
                    setState(() {
                      file = pickedFile;
                    });
                  }),
              Row(
                children: const [
                  Expanded(
                    child: InviteFields(
                      fieldTitle: 'Data:',
                      topPadding: 8.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: InviteFieldsText(myHintText: '01/04/2022')),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: InviteFields(
                      fieldTitle: 'Local:',
                      topPadding: 8.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: InviteFieldsText(
                          myHintText: 'R. Nunes Machado, 1000')),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: InviteFields(
                      fieldTitle: 'Valor:',
                      topPadding: 8.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: InviteFieldsText(myHintText: 'R\$ 50,00')),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: InviteFields(
                      fieldTitle: 'PIX',
                      topPadding: 8.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: InviteFieldsText(myHintText: '(41) 99999-9999')),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('Criar'),
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () async {
                      if (file != null) {
                        await _controller.uploadImage(file!);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
