import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class BarColorsInterpretation extends StatelessWidget {
  const BarColorsInterpretation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: AppSizes.h5,
              width: AppSizes.w16,
              color: Colors.blue,
              margin: EdgeInsets.only(right: AppSizes.w5),
            ),
            Text(
              DictionaryManager.instance.dictionaryChartScreen.lineRehomed,
            ),
            SizedBox(width: AppSizes.w10),
            Container(
              height: AppSizes.h5,
              width: AppSizes.w16,
              color: Colors.amber,
              margin: EdgeInsets.only(right: AppSizes.w5),
            ),
            Text(
              DictionaryManager.instance.dictionaryChartScreen.lineFostered,
            ),
            SizedBox(width: AppSizes.w10),
            Container(
              height: AppSizes.h5,
              width: AppSizes.w16,
              color: Colors.deepPurple,
              margin: EdgeInsets.only(right: AppSizes.w5),
            ),
            Text(
              DictionaryManager.instance.dictionaryChartScreen.lineReceived,
            ),
            SizedBox(width: AppSizes.w10),
            Container(
              height: AppSizes.h5,
              width: AppSizes.w16,
              color: Colors.green,
              margin: EdgeInsets.only(right: AppSizes.w5),
            ),
            Text(
              DictionaryManager.instance.dictionaryChartScreen.lineEuthanasia,
            ),
          ],
        ),
      ),
    );
  }
}
