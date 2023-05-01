import 'package:flutter/material.dart';
import 'package:practice_app/screens/chart_screen/components/data.dart';

class ChartData {
  static int interval = 5;

  static List<Data> barData = [
    Data(
      id: 1,
      name: 'own a cat',
      y: 3,
    ),
    Data(
      id: 2,
      name: 'never have',
      y: 3.7,
    ),
    Data(
      id: 3,
      name: 'used to',
      y: 2,
    ),
    Data(
      id: 4,
      name: 'planned to',
      y: 1.3,
    ),
  ];

  static List<Data> pieData = [
    Data(name: 'None',
    color: Colors.purple,
    percentage: 71.0,
    ),
    Data(name: '1 cat',
    color: Colors.green,
    percentage: 14.2,
    ),
    Data(name: '2 cats',
    color: Colors.deepPurple,
    percentage: 6.8,
    ),
    Data(name: '3 or more cats',
    color: Colors.lime,
    percentage: 8.0,
    ),
  ];
}
