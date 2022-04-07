import 'package:convida_ai_1/components/event_name_field.dart';
import 'package:convida_ai_1/components/invite_fields.dart';
import 'package:convida_ai_1/components/invite_fields_text.dart';
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EventNameField(
                nameEvent: widget.nameYourEvent,
              ),
              MyImagePicker(),
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
                    onPressed: () {},
                  ),
                ),
              ),

              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         InviteFields(
              //           fieldTitle: 'Data:',
              //           topPadding: 8.0,
              //         ),
              //         const InviteFields(fieldTitle: 'Local:'),
              //         InviteFields(fieldTitle: 'Valor:'),
              //         InviteFields(fieldTitle: 'PIX:'),
              //       ],
              //     ),
              //     // Column(
              //     //   mainAxisSize: MainAxisSize.min,
              //     //   children: [
              //     //     InviteFieldsText(myHintText: '01/04/2022'),
              //     //     InviteFieldsText(myHintText: 'R. Nunes Machado, 1000'),
              //     //     InviteFieldsText(myHintText: "R\$ 50,00"),
              //     //     InviteFieldsText(myHintText: '(41) 99999-9999'),
              //     //   ],
              //     // ),
              //   ],
              // ),
            ],
          ),
        )
        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 60,
        //         width: 400,
        //         child: EventNameField(
        //           nameEvent: widget.nameYourEvent,
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 40,
        //         width: 80,
        //       ),
        //       MyImagePicker(),
        //       const SizedBox(
        //         height: 40,
        //         width: 80,
        //       ),
        //       Column(
        //         children: [
        //           Row(
        //             mainAxisSize: MainAxisSize.min,
        //             // ignore: prefer_const_literals_to_create_immutables
        //             children: [
        //               Column(
        //                 children: [
        //                   const InviteFields(fieldTitle: 'Data:', topPadding: 8.0,),
        //                   const InviteFields(fieldTitle: 'Local:'),
        //                   const InviteFields(fieldTitle: 'Valor:'),
        //                   const InviteFields(fieldTitle: 'PIX:'),
        //                 ],
        //               ),
        //             ],
        //           ),

        //         ],
        //       )
        //       // Container(
        //       //   margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
        //       //   child: TextField(
        //       //     decoration: InputDecoration(
        //       //       hintText: 'E-mail',
        //       //       enabledBorder: UnderlineInputBorder(
        //       //           borderSide: BorderSide(color: AppColors.textFieldColor)),
        //       //       focusedBorder: UnderlineInputBorder(
        //       //         borderSide: BorderSide(color: AppColors.textFieldColor),
        //       //       ),
        //       //     ),
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
        );
  }
}
