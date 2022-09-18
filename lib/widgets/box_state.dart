import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxState extends StatelessWidget {
  final String title;
  final String subTitle;
  const BoxState({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 45,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromARGB(88, 180, 179, 179),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.raleway(
              fontSize: 11,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              if (title == 'Estado')
                Icon(
                  Icons.circle,
                  color: (subTitle != 'Alive') ? Colors.red : Colors.green,
                  size: 15,
                ),
              Container(
                width: 60,
                child: Text(
                  subTitle,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
