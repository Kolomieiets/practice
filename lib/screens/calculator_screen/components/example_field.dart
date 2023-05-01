import 'package:flutter/material.dart';

class ExampleField extends StatelessWidget {
  final String example;
  const ExampleField(this.example, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.bottomRight,
      height: MediaQuery.of(context).size.height / 2.5,
      child: Text(
        example,
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
