import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/chart_screen/components/data.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class ChartData {
  static int interval = 5;

  static List<Data> barData = [
    Data(
      id: 1,
      name: DictionaryManager.instance.dictionaryChartScreen.barOwn,
      y: 3,
    ),
    Data(
      id: 2,
      name: DictionaryManager.instance.dictionaryChartScreen.barNever,
      y: 3.7,
    ),
    Data(
      id: 3,
      name: DictionaryManager.instance.dictionaryChartScreen.barUsedTo,
      y: 2,
    ),
    Data(
      id: 4,
      name: DictionaryManager.instance.dictionaryChartScreen.barPlanned,
      y: 1.3,
    ),
  ];

  static List<Data> pieData = [
    Data(
      name: DictionaryManager.instance.dictionaryChartScreen.pieNone,
      color: Colors.purple,
      percentage: 71.0,
    ),
    Data(
      name: DictionaryManager.instance.dictionaryChartScreen.pieOneCat,
      color: Colors.green,
      percentage: 14.2,
    ),
    Data(
      name: DictionaryManager.instance.dictionaryChartScreen.pieTwoCats,
      color: Colors.deepPurple,
      percentage: 6.8,
    ),
    Data(
      name: DictionaryManager.instance.dictionaryChartScreen.pieThreeCats,
      color: Colors.lime,
      percentage: 8.0,
    ),
  ];
}
