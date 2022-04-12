import 'dart:io';
import 'dart:typed_data';

import 'package:convida_ai_1/classes/my_dialog.dart';
import 'package:convida_ai_1/components/event_name_field.dart';
import 'package:convida_ai_1/components/invite_fields.dart';
import 'package:convida_ai_1/components/invite_fields_text.dart';
import 'package:convida_ai_1/components/my_image_picker.dart';
import 'package:convida_ai_1/controller/invite_creation_controller.dart';
import 'package:convida_ai_1/controller/invite_share_controller.dart';
import 'package:convida_ai_1/screens/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';

class InviteCreation extends StatefulWidget {
  const InviteCreation({
    Key? key,
  }) : super(key: key);

  @override
  State<InviteCreation> createState() => _InviteCreationState();
}

class _InviteCreationState extends State<InviteCreation> {
  // instancia o controller criado no arquivo invite creation controller
  final _controller = InviteCreationController();
  // instancia o controlador do showDialog
  final _dialogController = MyDialog();

  final _invitationShareController = InvitationShareController();

  // variável para armazenar a foto selecionada
  File? file;
  // variável para o hinttext do nome do evento
  String? nameYourEvent = 'INSIRA O NOME DO SEU EVENTO';
  // controllers dos textfields
  TextEditingController? eventNameController = TextEditingController();
  TextEditingController? eventDateController = TextEditingController();
  TextEditingController? eventLocationController = TextEditingController();
  TextEditingController? eventCostController = TextEditingController();
  TextEditingController? eventPaymentController = TextEditingController();
  // variável para armazenar o ID do usuário logado
  final userID = FirebaseAuth.instance.currentUser!.uid;
  // variável para armazenar, oportunamente, a URL da imagem do convite
  String? imageUrl;
  // variável para acessa a tela de carregamento
  bool isLoading = false;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) => isLoading
      ? const LoadingScreen()
      : Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Screenshot(
              controller: screenshotController,
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
                          setState(() => isLoading = true);
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

                          await _dialogController.showMyDialog(
                              context,
                              'Convite Criado!',
                              'Agora é só aguardar o grande dia.',
                              'Ok', () async {
                            await captureScreen();
                            setState(() => isLoading = false);
                          }, 'Compartilhar');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

  Future<void> captureScreen() async {
    await _invitationShareController.screenCapture(screenshotController);
  }
}
