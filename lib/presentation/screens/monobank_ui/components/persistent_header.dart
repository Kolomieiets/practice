import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 1),
      width: double.infinity,
      height: AppSizes.h60,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.h16, vertical: AppSizes.h12),
        child:
            //  Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            SizedBox(
          height: AppSizes.h50,
          width: MediaQuery.of(context).size.width - 32,
          child:
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              TextField(
            cursorColor: Colors.white,
            style: TextStyle(
              color: AppTextStyle.colorWhite,
            ),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.qr_code,
                size: AppSizes.h24,
                color: Color.fromARGB(255, 171, 171, 171),
              ),
              hintText: DictionaryManager
                        .instance.dictionaryMonobankScreen.textField,
              hintStyle: TextStyle(
                color: AppTextStyle.colorLightGrey,
                fontSize: AppTextStyle.font16,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          //   ],
          // ),
        ),
        // ],
        // ),
      ),
    );
  }

  @override
  double get maxExtent => AppSizes.h60;

  @override
  double get minExtent => AppSizes.h60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
