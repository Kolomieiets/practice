import 'dart:math';
import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/add_photo.dart';
import 'package:practice_app/screens/options%20screen/components/back_arrow.dart';
import 'package:practice_app/screens/options%20screen/components/blue_box_animated_content.dart';
import 'package:practice_app/screens/options%20screen/components/qr_search_menu_buttons.dart';


class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const CustomSliverAppBarDelegate() : super();

  @override
  double get maxExtent => 180;

  @override
  double get minExtent => 85;

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

    return Align(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Color.fromARGB(95, 76, 76, 76), blurRadius: 3.0),
          ],
          color: Color.fromRGBO(87, 164, 219, 1.0),
        ),
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              BlueBoxAnimatedContent(percent: expendPercentage, size: minExtent + (maxExtent - minExtent) * expendPercentage,),
              QrSearchMenuButtons(expendPercentage),
              BackArrow(),
              AddPhoto(expendPercentage),
            ],
          ),
        ),
      ),
    );
  }
}
