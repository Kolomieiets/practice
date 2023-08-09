import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class AddPhoto extends StatelessWidget {
  final double percent;
  const AddPhoto(this.percent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: AppSizes.w16,
      bottom: -25.0,
      child: Container(
        height: AppSizes.h60,
        width: AppSizes.w60,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(percent),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(95, 157, 157, 157).withOpacity(percent),
                blurRadius: 3.0),
          ],
        ),
        child: Icon(
          Icons.add_a_photo_outlined,
          color: Colors.grey.withOpacity(percent),
          size: AppSizes.h30,
        ),
      ),
    );
  }
}
