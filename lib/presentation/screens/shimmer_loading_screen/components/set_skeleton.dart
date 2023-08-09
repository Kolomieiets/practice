import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/services/global/entity/items_for_shimmer_loading.dart';
import 'package:practice_app/presentation/screens/shimmer_loading_screen/components/set_item_list.dart';
import 'package:skeletons/skeletons.dart';

class SetSkeleton extends StatelessWidget {
  final int i;
  final bool isLoading;
  final List<LoadingItems> info;
  const SetSkeleton(this.i, this.isLoading, this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w8, vertical: AppSizes.h8),
      child: Skeleton(
          isLoading: isLoading,
          skeleton: SkeletonListTile(
            leadingStyle: const SkeletonAvatarStyle(),
            titleStyle: SkeletonLineStyle(height: AppSizes.h16, width: AppSizes.w100),
            hasSubtitle: true,
            subtitleStyle: SkeletonLineStyle(
                height: AppSizes.h16, width: MediaQuery.of(context).size.width - AppSizes.w100),
          ),
          child: SetItemList(i, info)),
    );
  }
}
