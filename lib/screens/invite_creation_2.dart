import 'dart:io';
import 'package:convida_ai_1/screens/invite_creation_loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import '../classes/my_dialog.dart';
import '../components/event_name_field.dart';
import '../components/invite_fields.dart';
import '../components/invite_fields_text.dart';
import '../components/my_image_picker.dart';
import '../controller/invite_creation_controller.dart';
import '../controller/invite_share_controller.dart';
import '../design/app_colors.dart';

class InviteCreation2 extends StatefulWidget {
  // Constructors
  final String eventName;
  final String eventDate;
  final String eventLocation;
  final String pixKey;
  final String eventPrice;
  final bool isCreating;
  final bool isLoading;
  final ImageProvider<Object> eventImage;

  const InviteCreation2.creating({
    Key? key,
    this.isCreating = true,
    this.isLoading = false,
    this.eventName = 'Nome do Evento',
    this.eventDate = 'R.Nunes Machado, 1000',
    this.eventLocation = '08/07/2018',
    this.eventImage = const AssetImage('lib/assets/photo.png'),
    this.eventPrice = "R\$ 50,00",
    this.pixKey = "(41) 99999-9999",
  }) : super(key: key);

  const InviteCreation2.viewing({
    Key? key,
    required this.eventName,
    required this.eventLocation,
    required this.eventDate,
    this.isLoading = false,
    this.isCreating = false,
    required this.eventImage,
    required this.pixKey,
    required this.eventPrice,
  }) : super(key: key);

  @override
  State<InviteCreation2> createState() => _InviteCreation2State();
}

class _InviteCreation2State extends State<InviteCreation2> {
  //Local Variables
  final _nameYourEvent = 'INSIRA O NOME DO SEU EVENTO';
  late ScrollController _scrollController;
  late TextEditingController _eventNameController;
  late TextEditingController _eventDateController;
  late TextEditingController _eventLocationController;
  late TextEditingController _eventCostController;
  late TextEditingController _eventPaymentController;
  late ScreenshotController _screenshotController;
  late InviteCreationController _controller;
  late MyDialog _myDialog;

  // instancia o controlador do showDialog
  final _dialogController = MyDialog();

  final userID = FirebaseAuth.instance.currentUser!.uid;

  final _invitationShareController = InvitationShareController();

  late bool isLoading;

  String? stateImageUrl;

  File? file;

  @override
  void initState() {
    if (widget.isCreating) {
      _eventNameController = TextEditingController();
      _eventDateController = TextEditingController();
      _eventLocationController = TextEditingController();
      _eventCostController = TextEditingController();
      _eventPaymentController = TextEditingController();
    }

    if (!widget.isCreating) {
      _eventNameController = TextEditingController(text: widget.eventName);
      _eventDateController = TextEditingController(text: widget.eventDate);
      _eventLocationController =
          TextEditingController(text: widget.eventLocation);
      _eventCostController = TextEditingController(text: widget.eventPrice);
      _eventPaymentController = TextEditingController(text: widget.pixKey);
    }

    _scrollController = ScrollController();
    _screenshotController = ScreenshotController();
    _controller = InviteCreationController();
    _myDialog = MyDialog();

    isLoading = widget.isLoading;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const InviteCreationgLoadingWidget()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Screenshot(
                    controller: _screenshotController,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EventNameField(
                          isedit: widget.isCreating,
                          nameEvent: _nameYourEvent,
                          textController: _eventNameController,
                        ),
                        // widget que tem a função de tirar/escolher foto e mostrar sua preview
                        widget.isCreating
                            ? ImagePreviewWidget(
                                previewImage: file,
                                onCameraTap: () async {
                                  final pickedFile = await _controller
                                      .pickImage(ImageSource.camera);
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
                                      image: widget.eventImage,
                                      width: 350,
                                      height: 350,
                                      fit: BoxFit.cover,
                                    ))),
                        Row(children: [
                          const Expanded(
                            child: InviteFields(
                              fieldTitle: 'Data:',
                              topPadding: 8.0,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: InviteFieldsText(
                              isedit: widget.isCreating,
                              myHintText: '01/04/2022',
                              textController: _eventDateController,
                            ),
                          ),
                        ]),
                        Row(
                          children: [
                            const Expanded(
                              child: InviteFields(
                                fieldTitle: 'Local:',
                                topPadding: 8.0,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: InviteFieldsText(
                                  isedit: widget.isCreating,
                                  textController: _eventLocationController,
                                  myHintText: 'R. Nunes Machado, 1000'),
                            ),
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
                              flex: 3,
                              child: InviteFieldsText(
                                isedit: widget.isCreating,
                                myHintText: 'R\$ 50,00',
                                textController: _eventCostController,
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
                              flex: 3,
                              child: InviteFieldsText(
                                isedit: widget.isCreating,
                                myHintText: '(41) 99999-9999',
                                textController: _eventPaymentController,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 24),
                    child: SizedBox(
                      height: 50,
                      child: widget.isCreating
                          ? ElevatedButton(
                              child: const Text('Criar'),
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              onPressed: () async {
                                if (file != null &&
                                    _eventCostController.text.isNotEmpty &&
                                    _eventDateController.text.isNotEmpty &&
                                    _eventLocationController.text.isNotEmpty &&
                                    _eventNameController.text.isNotEmpty &&
                                    _eventPaymentController.text.isNotEmpty) {
                                  setState(() => isLoading = true);
                                  if (file != null) {
                                    await _controller.uploadImage(
                                        file!, _eventNameController.text);
                                  }
                                  final url = await _controller
                                      .getImageUrl(_eventNameController.text);
                                  setState(() {
                                    stateImageUrl = url;
                                  });
                                  await _controller.addTextFields(
                                    _eventNameController.text,
                                    _eventDateController.text,
                                    _eventLocationController.text,
                                    _eventCostController.text,
                                    _eventPaymentController.text,
                                    userID,
                                    stateImageUrl,
                                  );
                                  setState(() => isLoading = false);
                                  await _dialogController.showMyDialog(
                                      context,
                                      'Convite Criado!',
                                      'Agora é só aguardar o grande dia.',
                                      'Ok', () async {
                                    await captureScreen();
                                  }, 'Compartilhar');
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        'Campo vazio',
                                        style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.inter().fontFamily,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.titlesColor),
                                      ),
                                      content: Text(
                                        'Preencha todos os campos!',
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                          fontSize: 12,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        OutlinedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Ok',
                                            style: TextStyle(
                                                fontFamily: GoogleFonts.inter()
                                                    .fontFamily,
                                                fontSize: 12,
                                                color:
                                                    AppColors.miniIconsColor),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }
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
          );
  }

  Future<void> captureScreen() async {
    await _invitationShareController.screenCapture(_screenshotController);
  }
}
