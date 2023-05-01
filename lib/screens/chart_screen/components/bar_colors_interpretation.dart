import 'package:flutter/material.dart';

class BarColorsInterpretation extends StatelessWidget {
  const BarColorsInterpretation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 5.0,
          width: 16.0,
          color: Colors.blue,
          margin: EdgeInsets.only(right: 5.0),
        ),
        Text('rehomed'),
        SizedBox(width: 10),
        Container(
          height: 5.0,
          width: 16.0,
          color: Colors.amber,
          margin: EdgeInsets.only(right: 5.0),
        ),
        Text('fostered'),
        SizedBox(width: 10),
        Container(
          height: 5.0,
          width: 16.0,
          color: Colors.deepPurple,
          margin: EdgeInsets.only(right: 5.0),
        ),
        Text('received'),
        SizedBox(width: 10),
        Container(
          height: 5.0,
          width: 16.0,
          color: Colors.green,
          margin: EdgeInsets.only(right: 5.0),
        ),
        Text('euthanasia'),
      ],
    );
  }
}
