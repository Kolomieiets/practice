import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/options%20screen/components/back_arrow.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class MyAnimatedAppBar extends SliverPersistentHeaderDelegate {
  const MyAnimatedAppBar() : super();

// TODO(Valentyna): fix animated AppBar on different sizes
// TODO(Valentyna): fix calculator keyboard size on small screens
  @override
  double get maxExtent => AppSizes.h116;

  @override
  double get minExtent => AppSizes.h85;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double expendPercentage =
        1.0 - min(1, shrinkOffset / (maxExtent - minExtent));

    final interpolatedPadding = EdgeInsets.lerp(
      EdgeInsets.only(
        bottom: minExtent / 5.5,
        // AppSizes.h16,
        left: AppSizes.w60,
        right: 0.0,
        top: 0.0,
      ),
      EdgeInsets.only(
          top: AppSizes.h16,
          left: AppSizes.h16,
          ),
      expendPercentage,
    );
    return Align(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 1),
              blurRadius: 0.0,
              spreadRadius: 0.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: minExtent +
                    (maxExtent - minExtent) * expendPercentage,
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: interpolatedPadding!,
                  child: Text(
                    DictionaryManager
                        .instance.dictionaryMonobankScreen.title,
                    style: TextStyle(
                      fontSize: AppTextStyle.font18,
                      fontWeight: FontWeight.w500,
                      color: AppTextStyle.colorWhite,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              BackArrow(),
            ],
          ),
        ),
      ),
    );
  }
}
