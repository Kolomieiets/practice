import 'package:flutter/material.dart';
import 'package:practice_app/services/global/entity/my_telegram_user_info.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/telegram_no_image_avatar.dart';
import 'package:practice_app/resources/app_sizes.dart';

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
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w16, vertical: AppSizes.h16),
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
