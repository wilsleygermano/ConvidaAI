import 'package:convida_ai_1/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteCreation extends StatefulWidget {
  const InviteCreation({Key? key, this.nameYourEvent = 'INSIRA O NOME DO SEU EVENTO'}) : super(key: key);

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
              
            )
          ],
        ),
      ),
    );
  }
}
