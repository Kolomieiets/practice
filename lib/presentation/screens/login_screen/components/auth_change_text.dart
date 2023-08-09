import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class AuthChangeText extends StatelessWidget {
  final VoidCallback onTapFunction;
  final String buttonText;
  final String text;
  const AuthChangeText({required this.onTapFunction, required this.buttonText, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('or'),
        SizedBox(height: AppSizes.h8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                onTapFunction();
              },
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Text(text),
          ],
        ),
      ],
    );
  }
}
