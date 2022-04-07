import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/app_colors.dart';

class EventNameField extends StatefulWidget {
  const EventNameField({ Key? key, this.nameEvent }) : super(key: key);

  final String? nameEvent;

  @override
  State<EventNameField> createState() => _EventNameFieldState();
}

class _EventNameFieldState extends State<EventNameField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
                maxLength: 30,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
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