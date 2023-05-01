import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
      effect: const JumpingDotEffect(
          activeDotColor: Colors.black,
          dotHeight: 12.0,
          dotWidth: 12.0,
          verticalOffset: 8.0),
    );
  }
}
