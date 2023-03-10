import 'package:flutter/material.dart';

class BlockName extends StatelessWidget {
  final String name;
  BlockName(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 16.0),
      child: Text(
        name,
        style: TextStyle(
            color: Color.fromRGBO(87, 164, 219, 1.0), fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}