import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/block_name.dart';
import 'package:practice_app/screens/options%20screen/components/number_confirmarion_content.dart';
import 'package:practice_app/screens/options%20screen/components/number_confirmation_buttons.dart';
import 'package:practice_app/screens/options%20screen/components/white_block_layout.dart';

class NumberConfirmation extends StatefulWidget {
  const NumberConfirmation({super.key});

  @override
  State<NumberConfirmation> createState() => _NumberConfirmationState();
}

class _NumberConfirmationState extends State<NumberConfirmation> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (isVisible)
      return WhiteBlockLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlockName('Is +380 (63) 617 63 01 still your number?'),
            NumberConfirmationContent(),
            NumberConfirmationButtons(onPressed: () {
              isVisible = false;
              setState(() {});
            }),
          ],
        ),
      );

    return SizedBox();
  }
}
