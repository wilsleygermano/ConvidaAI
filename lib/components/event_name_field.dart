import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/app_colors.dart';

class EventNameField extends StatefulWidget {
  const EventNameField(
      {Key? key, this.nameEvent, this.textController, required this.isedit})
      : super(key: key);

  final String? nameEvent;
  final TextEditingController? textController;
  final bool isedit;

  @override
  State<EventNameField> createState() => _EventNameFieldState();
}

class _EventNameFieldState extends State<EventNameField> {
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
      controller: widget.textController,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.characters,
      readOnly: !isedit,
      style: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 24,
        color: AppColors.titlesColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: widget.nameEvent,
        hintStyle: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 24,
          color: AppColors.titlesColor,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
