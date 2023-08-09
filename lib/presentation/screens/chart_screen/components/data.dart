import 'package:flutter/material.dart';

class Data {
  int? id;
  double? percentage;
  final String name;
  double? y;
  Color? color;

  Data({
    this.id,
    this.percentage,
    required this.name,
    this.y,
    this.color,
  });
}
