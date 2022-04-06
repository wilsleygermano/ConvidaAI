import 'dart:io';

import 'package:convida_ai_1/components/show_options.dart';
import 'package:convida_ai_1/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteCreation extends StatefulWidget {
  const InviteCreation(
      {Key? key, this.nameYourEvent = 'INSIRA O NOME DO SEU EVENTO'})
      : super(key: key);

  final String nameYourEvent;

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
            Center(
              child: SizedBox(
                height: 50,
                width: 400,
                child: TextField(
                  textCapitalization: TextCapitalization.characters,
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 24,
                    color: AppColors.titlesColor,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.nameYourEvent,
                    hintStyle: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 24,
                      color: AppColors.titlesColor,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: 80,
            ),
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: InkWell(
                  onTap: () => showOptions(context),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Image(image: AssetImage('lib/assets/photo.png'),
                    fit: BoxFit.fill,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
