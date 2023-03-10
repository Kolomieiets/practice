import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/my_telegram_user_info.dart';

class AnimatedName extends StatelessWidget {
  final TextStyle? style;
  AnimatedName(this.style, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      pause: Duration(milliseconds: 500),
      animatedTexts: [
        RotateAnimatedText(
          '${MyTelegramUserInfo.user.firstName} ',
          textStyle: style,
        ),
        RotateAnimatedText(
          '${MyTelegramUserInfo.user.lastName}',
          textStyle: style,
        ),
      ],
    );
  }
}
