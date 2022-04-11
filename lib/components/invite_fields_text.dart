import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/app_colors.dart';

class InviteFieldsText extends StatefulWidget {
  const InviteFieldsText({Key? key, required this.myHintText, this.textController})
      : super(key: key);

  final String myHintText;
  final TextEditingController? textController;


  @override
  State<InviteFieldsText> createState() => _InviteFieldsTextState();
}

class _InviteFieldsTextState extends State<InviteFieldsText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      maxLength: 30,
      style: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 16,
        color: AppColors.miniTextColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 30),
        hintText: widget.myHintText,
        hintStyle: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 16,
          color: AppColors.miniTextColor,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
