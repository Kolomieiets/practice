import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice_app/screens/options%20screen/components/back_arrow.dart';

class MyAnimatedAppBar extends SliverPersistentHeaderDelegate {
  const MyAnimatedAppBar() : super();

  @override
  double get maxExtent => 116;

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

    final interpolatedPadding = EdgeInsets.lerp(
      EdgeInsets.only(top: 8.0, left: 60.0, right: 0.0, bottom: 16.0),
      EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
      expendPercentage,
    );

    return Align(
      child: Container(
        color: Color.fromRGBO(0, 0, 0, 1),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: minExtent + (maxExtent - minExtent) * expendPercentage,
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: interpolatedPadding!,
                  child: Text(
                    'Money Transfer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
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
