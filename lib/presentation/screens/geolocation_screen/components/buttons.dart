import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class MyButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback onTap;
  MyButton({ required this.isLoading, required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.h8, horizontal: AppSizes.w12),
        decoration: BoxDecoration(
          color:  isLoading ? Colors.grey : Colors.black,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: isLoading
                      ? SizedBox(
                          height: AppSizes.h20,
                          width: AppSizes.w20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: AppSizes.w2,
                          ),
                        )
                      : Text(
                          text,
                          style: TextStyle(
                            color: AppTextStyle.colorWhite,
                            fontSize: AppTextStyle.font15,
                          ),
                        ),
      ),
      onTap: isLoading ? (){} : onTap,
    );
  }
}
