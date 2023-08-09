import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/block_name.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/number_confirmarion_content.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/number_confirmation_buttons.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/white_block_layout.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

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
            BlockName(
              DictionaryManager
                  .instance.dictionaryTelegramScreen.numberConfirmation,
            ),
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
