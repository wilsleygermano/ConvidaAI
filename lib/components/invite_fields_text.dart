import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/app_colors.dart';

class InviteFieldsText extends StatefulWidget {
  const InviteFieldsText(
      {Key? key,
      required this.myHintText,
      this.textController,
      required this.isedit})
      : super(key: key);

  final String myHintText;
  final TextEditingController? textController;
  final bool isedit;

  @override
  State<InviteFieldsText> createState() => _InviteFieldsTextState();
}

class _InviteFieldsTextState extends State<InviteFieldsText> {
  late bool isedit;

  @override
  void initState() {
    isedit = widget.isedit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(30)
      ],
      textInputAction: TextInputAction.next,
      controller: widget.textController,
      readOnly: !isedit,
      style: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 16,
        color: AppColors.miniTextColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 8),
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
