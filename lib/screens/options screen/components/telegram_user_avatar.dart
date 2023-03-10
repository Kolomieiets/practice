import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/my_telegram_user_info.dart';
import 'package:practice_app/screens/options%20screen/components/telegram_no_image_avatar.dart';

class TelegramUserAvatar extends StatelessWidget {
  final double size;
  TelegramUserAvatar(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: MyTelegramUserInfo.user.url == null
          ? TelegramNoImageAvatar(size)
          : Image.network(
              MyTelegramUserInfo.user.url!,
              height: size,
              width: size,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                    padding: EdgeInsets.all(16.0),
                    height: size,
                    width: size,
                    color: Colors.white,
                    child: const CircularProgressIndicator(
                        strokeWidth: 1.0, color: Colors.grey));
              },
              errorBuilder: (context, error, stackTrace) => TelegramNoImageAvatar(size),
            ),
    );
  }
}
