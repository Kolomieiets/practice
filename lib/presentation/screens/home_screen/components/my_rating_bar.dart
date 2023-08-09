import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practice_app/resources/app_sizes.dart';

class MyRatingBar extends StatelessWidget {
  const MyRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      glow: false,
      initialRating: 3,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: Colors.green,
        ),
        half: Icon(
          Icons.star_half,
          color: Colors.green,
        ),
        empty: Icon(
          Icons.star_border,
          color: Colors.green,
        ),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: AppSizes.w4),
      onRatingUpdate: (rating) {},
    );
  }
}
