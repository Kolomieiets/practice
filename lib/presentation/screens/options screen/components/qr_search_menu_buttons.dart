import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';

class QrSearchMenuButtons extends StatelessWidget {
  final double percent;
  QrSearchMenuButtons(this.percent, {super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
                right: AppSizes.w10,
                top: AppSizes.h10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.h4),
                        child: Icon(
                          Icons.qr_code,
                          color: Colors.white.withOpacity(percent),
                          size: AppSizes.h28,
                        ),
                      ),
                      SizedBox(width: AppSizes.h16),
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.h4),
                      child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: AppSizes.h28,
                          ),
                    ),
                    SizedBox(width: AppSizes.h16),
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.h4),
                      child: Icon(
                            Icons.menu_rounded,
                            color: Colors.white,
                            size: AppSizes.h28,
                          ),
                    ),
                  ],
                ),
              );
  }
}