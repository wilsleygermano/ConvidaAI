import 'dart:io';

import 'package:convida_ai_1/components/event_name_field.dart';
import 'package:convida_ai_1/components/invite_fields.dart';
import 'package:convida_ai_1/components/invite_fields_text.dart';
import 'package:convida_ai_1/components/my_image_picker.dart';
import 'package:convida_ai_1/controller/invite_creation_controller.dart';
import 'package:convida_ai_1/design/app_colors.dart';
import 'package:convida_ai_1/screens/my_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class InviteCreation extends StatefulWidget {
  const InviteCreation({
    Key? key,
  }) : super(key: key);

  @override
  State<InviteCreation> createState() => _InviteCreationState();
}

class _InviteCreationState extends State<InviteCreation> {
  // 'importa' o controller criado no arquivo invite creation controller
  final _controller = InviteCreationController();
  // variável para armazenar a foto selecionada
  File? file;
  String? nameYourEvent = 'INSIRA O NOME DO SEU EVENTO';
  TextEditingController? eventNameController = TextEditingController();
  TextEditingController? eventDateController = TextEditingController();
  TextEditingController? eventLocationController = TextEditingController();
  TextEditingController? eventCostController = TextEditingController();
  TextEditingController? eventPaymentController = TextEditingController();
  final userID = FirebaseAuth.instance.currentUser!.uid;
  String? imageUrl;

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
                nameEvent: nameYourEvent,
                textController: eventNameController,
              ),
              // widget que tem a função de tirar/escolher foto e mostrar sua preview
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
                children: [
                  const Expanded(
                    child: InviteFields(
                      fieldTitle: 'Data:',
                      topPadding: 8.0,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: InviteFieldsText(
                      myHintText: '01/04/2022',
                      textController: eventDateController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: InviteFields(
                      fieldTitle: 'Local:',
                      topPadding: 8.0,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: InviteFieldsText(
                          textController: eventLocationController,
                          myHintText: 'R. Nunes Machado, 1000')),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: InviteFields(
                      fieldTitle: 'Valor:',
                      topPadding: 8.0,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: InviteFieldsText(
                      myHintText: 'R\$ 50,00',
                      textController: eventCostController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: InviteFields(
                      fieldTitle: 'PIX',
                      topPadding: 8.0,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: InviteFieldsText(
                      myHintText: '(41) 99999-9999',
                      textController: eventPaymentController,
                    ),
                  ),
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
                        await _controller.uploadImage(
                            file!, eventNameController!.text);
                      }
                      final url = await _controller
                          .getImageUrl(eventNameController!.text);
                      setState(() {
                        imageUrl = url;
                      });
                      await _controller.addTextFields(
                        eventNameController!.text,
                        eventDateController!.text,
                        eventLocationController!.text,
                        eventCostController!.text,
                        eventPaymentController!.text,
                        userID,
                        imageUrl,
                      );
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Convite Criado!',
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.titlesColor),
                          ),
                          content: Text(
                            'Agora é só esperar o grande dia',
                            style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontSize: 12,
                              color: AppColors.textColor,
                            ),
                          ),
                          actions: <Widget>[
                            OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Okay',
                                style: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontSize: 12,
                                    color: AppColors.miniIconsColor),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
