import 'package:flutter/material.dart';

class TelegramNoImageAvatar extends StatelessWidget {
  final double size;
  TelegramNoImageAvatar(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
                color: Colors.white,
                child: Image.asset('assets/images/avatar.png',
                    color: Colors.grey,
                    height: size,
                    width: size,
                    fit: BoxFit.cover),
              );
  }
}