import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/white_block_layout.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class PremiumContent extends StatelessWidget {
  const PremiumContent({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBlockLayout(
      child: ItemsList(
        Row(
          children: [
            Image.asset(
              'assets/icons/star.gif',
              height: AppSizes.h24,
              width: AppSizes.w24,
            ),
            SizedBox(
              width: AppSizes.w16,
            ),
            Text(DictionaryManager
                        .instance.dictionaryTelegramScreen.premium),
          ],
        ),
      ),
    );
  }
}
