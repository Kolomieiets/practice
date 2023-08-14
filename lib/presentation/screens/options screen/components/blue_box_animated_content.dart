import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/animated_name.dart';
import 'package:practice_app/services/global/entity/my_telegram_user_info.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/telegram_user_avatar.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class BlueBoxAnimatedContent extends StatelessWidget {
  final double percent;
  final double size;
  BlueBoxAnimatedContent({required this.percent, required this.size, super.key});

  

  @override
  Widget build(BuildContext context) {
    final double interpolatedImageSize = AppSizes.h35 + (percent * 20);
    final double interpolatedTextSize = 200 + (percent * 100);

    final interpolatedPadding = EdgeInsets.lerp(
      EdgeInsets.only(top: AppSizes.h4, left: AppSizes.w60, right: 0.0, bottom: AppSizes.h4),
      EdgeInsets.only(left: AppSizes.w16, right: AppSizes.w16, bottom: AppSizes.h8),
      percent,
    );

    final interpolatedTextStyle = TextStyle.lerp(
      TextStyle(
        fontSize: AppTextStyle.font16,
        fontWeight: FontWeight.w500,
        color: AppTextStyle.colorWhite,
        overflow: TextOverflow.ellipsis,
      ),
      TextStyle(
        fontSize: AppTextStyle.font20,
        fontWeight: FontWeight.w800,
        color: AppTextStyle.colorWhite,
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
                    height: AppSizes.h60,
                    width: interpolatedTextSize,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TelegramUserAvatar(interpolatedImageSize),
                        SizedBox(width: AppSizes.w8),
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