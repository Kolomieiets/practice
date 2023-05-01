import 'package:flutter/material.dart';
import 'package:practice_app/screens/chart_screen/components/bar_colors_interpretation.dart';
import 'package:practice_app/screens/chart_screen/components/cat_adoption_stats.dart';
import 'package:practice_app/screens/chart_screen/components/cat_count_ctats.dart';
import 'package:practice_app/screens/chart_screen/components/cat_owner_stats.dart';
import 'package:practice_app/utils/pop_utils.dart';
import 'package:practice_app/widgets/drawer.dart';

class ChartScreen extends StatelessWidget {
  static const String routeName = '/chart';
  ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return PopUtils.onWillPop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cat stats'),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Cat adoption and surrender Statistics',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16.0),
                CatAdoptionStats(),
                SizedBox(height: 8.0),
                BarColorsInterpretation(),
                SizedBox(height: 48.0),
                Text(
                  'How many people in the US own a cat',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16),
                CatOwnerStats(),
                SizedBox(height: 48.0),
                Text(
                  'How many cats people own',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 32),
                CatCountStats(),
                SizedBox(height: 48.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
