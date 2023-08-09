import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class NumberConfirmationButtons extends StatelessWidget {
  final VoidCallback onPressed;

  const NumberConfirmationButtons({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ItemsList(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(87, 164, 219, 1.0)),
              onPressed: onPressed,
              child: Text(
                DictionaryManager.instance.dictionaryGlobal.yes,
              ),
            ),
          ),
          SizedBox(width: AppSizes.w16),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(87, 164, 219, 1.0)),
              onPressed: () {},
              child: Text(
                DictionaryManager.instance.dictionaryGlobal.no,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
