import 'dart:io';

import 'package:convida_ai_1/classes/my_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convida_ai_1/classes/evento.dart';
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
  final bool isCreate;
  String? urlImage;
  String? titulo;
  InviteCreation({
    Key? key,
    required this.isCreate,
    this.titulo,
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

  late bool isCreate;
  late String? titulo;
  // variável para armazenar a foto selecionada
  Evento? evento;
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
  final _scrollController = ScrollController();

  @override
  void initState() {
    isCreate = widget.isCreate;
    if (!isCreate) {
      titulo = widget.titulo;
      getEvent();
    }
    super.initState();
  }

  void getEvent() {
    FirebaseFirestore.instance
        .collection('events')
        .where('user_uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('titulo', isEqualTo: titulo)
        .get()
        .then((snapshot) async {
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          evento = Evento.fromJson(snapshot.docs[0].data());
        });
        if (evento != null) {
          eventCostController!.text = evento!.valor!;
          eventDateController!.text = evento!.data;
          eventLocationController!.text = evento!.local;
          eventNameController!.text = evento!.titulo;
          eventPaymentController!.text = evento!.pix!;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => isLoading
      ? const LoadingScreen()
      : Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Screenshot(
              controller: screenshotController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EventNameField(
                    isedit: isCreate,
                    nameEvent: nameYourEvent,
                    textController: eventNameController,
                  ),
                  // widget que tem a função de tirar/escolher foto e mostrar sua preview
                  isCreate
                      ? ImagePreviewWidget(
                          previewImage: file,
                          onCameraTap: () async {
                            final pickedFile =
                                await _controller.pickImage(ImageSource.camera);
                            setState(() {
                              file = pickedFile;
                            });
                          },
                          onGalleryTap: () async {
                            final pickedFile = await _controller
                                .pickImage(ImageSource.gallery);
                            setState(() {
                              file = pickedFile;
                            });
                          })
                      : Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image: NetworkImage(evento!.url!),
                                width: 350,
                                height: 350,
                                fit: BoxFit.cover,
                              ))),
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
                          isedit: isCreate,
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
                              isedit: isCreate,
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
                          isedit: isCreate,
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
                          isedit: isCreate,
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
                      child: isCreate
                          ? ElevatedButton(
                              child: const Text('Criar'),
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
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
                                setState(() => isLoading = false);
                                await _dialogController.showMyDialog(
                                    context,
                                    'Convite Criado!',
                                    'Agora é só aguardar o grande dia.',
                                    'Ok', () async {
                                  await captureScreen();
                                }, 'Compartilhar');
                              },
                            )
                          : ElevatedButton(
                              child: const Text('Compartilhar'),
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              onPressed: () async {
                                await captureScreen();
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
