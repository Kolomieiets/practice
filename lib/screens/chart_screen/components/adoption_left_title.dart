import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AdoptionLeftTitles extends StatelessWidget {
  final double value;
  final TitleMeta meta;
  const AdoptionLeftTitles(this.value, this.meta, {super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '';
        break;
      case 2:
        text = '2k';
        break;
      case 3:
        text = '3k';
        break;
      case 4:
        text = '4k';
        break;
      case 5:
        text = '5k';
        break;
      case 6:
        text = '6k';
        break;
      case 7:
        text = '7k';
        break;
      case 8:
        text = '8k';
        break;
      case 9:
        text = '9k';
        break;
      case 10:
        text = '10k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }
}
