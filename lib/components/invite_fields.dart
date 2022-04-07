import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/app_colors.dart';

class InviteFields extends StatefulWidget {
  const InviteFields(
      {Key? key,
      this.fieldTitle,
      this.startPadding = 16.0,
      this.topPadding = 32.0})
      : super(key: key);
  final String? fieldTitle;
  final double startPadding;
  final double topPadding;
  @override
  State<InviteFields> createState() => _InviteFieldsState();
}

class _InviteFieldsState extends State<InviteFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsetsDirectional.only(
          start: widget.startPadding, top: widget.topPadding),
      child: Text(
        widget.fieldTitle!,
        style: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 18,
          color: AppColors.titlesColor,
        ),
      ),
    );
  }
}
