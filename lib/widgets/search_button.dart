import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reto_t_evolvers/delegate/search_delegate.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 20),
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 20),
            Text(
              'Buscar personajes',
              style: GoogleFonts.raleway(
                fontSize: 15,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        showSearch(context: context, delegate: SearchButtonDelegate());
      },
    );
  }
}
