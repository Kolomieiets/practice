import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class CardBuilder extends StatelessWidget {
  final String text;
  const CardBuilder(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w8, vertical: AppSizes.h8),
        child: Text(
          text,
          style: GoogleFonts.cairo(fontSize: AppTextStyle.font20),
        ),
      ),
    );
  }
}
