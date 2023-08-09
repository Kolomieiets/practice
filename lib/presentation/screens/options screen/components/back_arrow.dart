import 'package:flutter/material.dart';
import 'package:practice_app/config/auto_router.dart';
import 'package:practice_app/presentation/screens/home_screen/home_screen.dart';
import 'package:practice_app/resources/app_sizes.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: AppSizes.w10,
      child: IconButton(
        onPressed: () {
          AppRouter.instance.replaceNamed(HomeScreen.routeName);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}
