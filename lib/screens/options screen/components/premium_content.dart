import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/items_list.dart';
import 'package:practice_app/screens/options%20screen/components/white_block_layout.dart';

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
              height: 25,
              width: 25,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text('Telegram Premium'),
          ],
        ),
      ),
    );
  }
}
