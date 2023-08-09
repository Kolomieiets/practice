import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/layouts/main_layout.dart';
import 'package:practice_app/presentation/screens/chart_screen/components/bar_colors_interpretation.dart';
import 'package:practice_app/presentation/screens/chart_screen/components/cat_adoption_stats.dart';
import 'package:practice_app/presentation/screens/chart_screen/components/cat_count_stats.dart';
import 'package:practice_app/presentation/screens/chart_screen/components/cat_owner_stats.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';
import 'package:practice_app/presentation/widgets/drawer.dart';
import 'package:practice_app/services/dictionary/dictionary_manager.dart';

@RoutePage()
class ChartScreen extends StatelessWidget {
  static const String routeName = '/chart';

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appBar: AppBar(
          title: Text(DictionaryManager.instance.dictionaryChartScreen.title,),
        ),
        drawer: MyDrawer(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.w16,  vertical: AppSizes.h16),
            child: Column(
              children: [
                Text(
                  DictionaryManager.instance.dictionaryChartScreen.lineTitle,
                  style: TextStyle(
                    fontSize: AppTextStyle.font18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: AppSizes.h16),
                CatAdoptionStats(),
                SizedBox(height: AppSizes.h8),
                BarColorsInterpretation(),
                SizedBox(height: AppSizes.h48),
                Text(
                  DictionaryManager.instance.dictionaryChartScreen.barTitle,
                  style: TextStyle(
                    fontSize: AppTextStyle.font18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: AppSizes.h16),
                CatOwnerStats(),
                SizedBox(height: AppSizes.h48),
                Text(
                  DictionaryManager.instance.dictionaryChartScreen.pieTitle,
                  style: TextStyle(
                    fontSize: AppTextStyle.font18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: AppSizes.h32),
                CatCountStats(),
                SizedBox(height: AppSizes.h48),
              ],
            ),
          ),
        ),
    );
  }

  
}
