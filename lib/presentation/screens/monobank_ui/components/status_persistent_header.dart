import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class StatusPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 1),
      width: double.infinity,
      
    );
  }

  @override
  double get maxExtent => AppSizes.h40;

  @override
  double get minExtent => AppSizes.h40;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}