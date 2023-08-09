import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class CardItem extends StatelessWidget {
  final String name;
  final Widget consumer;
  final bool press;
  final VoidCallback changePress;
  final VoidCallback mySetState;
  const CardItem(
      {required this.name,
      required this.consumer,
      required this.press,
      required this.changePress,
      required this.mySetState,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w8, vertical: AppSizes.h8),
            child: Text(
              name,
              style: TextStyle(fontSize: AppTextStyle.font20),
            ),
          ),
          const Divider(),
          Container(
            alignment: Alignment.center,
            height: AppSizes.h100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                press ? consumer : const Text(''),
                SizedBox(
                  height: AppSizes.h48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      changePress();
                      mySetState();
                    },
                    child: Text(press
                        ? DictionaryManager
                            .instance.dictionarySensorsPlusScreen.stop
                        : DictionaryManager
                            .instance.dictionarySensorsPlusScreen.start),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
