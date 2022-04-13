import 'package:convida_ai_1/controller/invite_share_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screenshot/screenshot.dart';

import '../design/app_colors.dart';
import '../screens/my_home_page.dart';

final _imageShareController = InvitationShareController();

class MyDialog {
  Future showMyDialog(context, String myTitle, String myContent,
      String buttonTxt, void Function() share, String? shareButtonText) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          myTitle,
          style: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.titlesColor),
        ),
        content: Text(
          myContent,
          style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            fontSize: 12,
            color: AppColors.textColor,
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () => share(),
            child: Text(
              shareButtonText!,
              style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontSize: 12,
                  color: AppColors.miniIconsColor),
            ),
          ),
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
              buttonTxt,
              style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontSize: 12,
                  color: AppColors.miniIconsColor),
            ),
          )
        ],
      ),
    );
  }
}
