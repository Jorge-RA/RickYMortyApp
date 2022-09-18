// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final bool? bold;
  const CustomText(
      {Key? key, this.bold, required this.text, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.raleway(
        fontWeight: this.bold != null ? FontWeight.bold : FontWeight.w500,
        fontSize: this.size,
        color: this.bold == null ? Colors.grey : Colors.black,
      ),
    );
  }
}
