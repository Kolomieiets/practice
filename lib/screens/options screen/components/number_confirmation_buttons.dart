import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/items_list.dart';

class NumberConfirmationButtons extends StatelessWidget {
  final VoidCallback onPressed;

  const NumberConfirmationButtons({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ItemsList(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(87, 164, 219, 1.0)), 
                  onPressed: onPressed,
                  child: Text('Yes'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(87, 164, 219, 1.0)),
                  onPressed: () {},
                  child: Text('No'),
                ),
              ),
            ],
          ),
        );
  }
}
