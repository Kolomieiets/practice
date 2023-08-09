import 'package:flutter/material.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class CalculatorButtons extends StatelessWidget {
  final int index;
  CalculatorButtons(this.index, {super.key});
  final List<String> buttons = [
    'C',
    'DEL',
    '(',
    ')',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttons[index],
          style: TextStyle(
            fontSize: AppTextStyle.font27,
            color: AppTextStyle.colorGrey,
          ),
        ),
      ),
    );
  }
}
