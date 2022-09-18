import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            'Personajes ',
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.w200,
            ),
          ),
          Text(
            'Rick y Morty',
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
