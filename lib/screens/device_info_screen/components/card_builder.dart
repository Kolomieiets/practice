import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardBuilder extends StatelessWidget {
  final String text;
  const CardBuilder(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: GoogleFonts.cairo(fontSize: 20),
        ),
      ),
    );
  }
}
