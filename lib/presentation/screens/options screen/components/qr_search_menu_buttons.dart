import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class QrSearchMenuButtons extends StatelessWidget {
  final double percent;
  QrSearchMenuButtons(this.percent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
                right: AppSizes.w10,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.qr_code,
                        color: Colors.white.withOpacity(percent),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
  }
}