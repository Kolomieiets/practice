import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicator extends StatelessWidget {
  final int activeIndex;
  final List<XFile>? images;

  const DotsIndicator({required this.activeIndex, required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: images!.length,
      effect: JumpingDotEffect(
          activeDotColor: Colors.black,
          dotHeight: AppSizes.h12,
          dotWidth: AppSizes.h12,
          verticalOffset: 8.0),
    );
  }
}
