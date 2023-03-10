import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/animated_name.dart';
import 'package:practice_app/screens/options%20screen/components/my_telegram_user_info.dart';
import 'package:practice_app/screens/options%20screen/components/telegram_user_avatar.dart';

class BlueBoxAnimatedContent extends StatelessWidget {
  final double percent;
  final double size;
  BlueBoxAnimatedContent({required this.percent, required this.size, super.key});

  

  @override
  Widget build(BuildContext context) {
    final double interpolatedImageSize = 35 + (percent * 20);
    final double interpolatedTextSize = 200 + (percent * 100);

    final interpolatedPadding = EdgeInsets.lerp(
      EdgeInsets.only(top: 8.0, left: 60.0, right: 0.0, bottom: 8.0),
      EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      percent,
    );

    final interpolatedTextStyle = TextStyle.lerp(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
      ),
      const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        overflow: TextOverflow.fade,
      ),
      percent,
    );
    return Container(
                height: size,
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: interpolatedPadding!,
                  child: SizedBox(
                    height: 60,
                    width: interpolatedTextSize,
                    child: Row(
                      children: [
                        TelegramUserAvatar(interpolatedImageSize),
                        SizedBox(width: 8.0),
                        Flexible(
                          child: percent == 0.0
                              ? AnimatedName(interpolatedTextStyle)
                              : Text(
                                  '${MyTelegramUserInfo.user.firstName} ${MyTelegramUserInfo.user.lastName}',
                                  style: interpolatedTextStyle,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}