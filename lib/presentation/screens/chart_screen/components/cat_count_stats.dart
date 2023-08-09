import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/presentation/screens/chart_screen/components/chart_data.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class CatCountStats extends StatefulWidget {
  const CatCountStats({super.key});

  @override
  State<CatCountStats> createState() => _CatCountStatsState();
}

class _CatCountStatsState extends State<CatCountStats> {
  int? touchedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizes.h240,
        child: AspectRatio(
          aspectRatio: 1.3,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (touchEvent, pieTouchResponse) {
                  if (pieTouchResponse != null &&
                      (pieTouchResponse.touchedSection is FlLongPressEnd ||
                          pieTouchResponse.touchedSection is FlPanEndEvent)) {
                    touchedIndex = -1;
                  } else if (pieTouchResponse != null) {
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  }

                  setState(() {});
                },
              ),
              centerSpaceRadius: 0,
              sections: ChartData.pieData
                  .asMap()
                  .map<int, PieChartSectionData>((index, data) {
                    final bool isTouched = index == touchedIndex;

                    final value = PieChartSectionData(
                      radius: isTouched ? AppSizes.h110 : AppSizes.h100,
                      color: data.color,
                      value: data.percentage,
                      title: isTouched ? '${data.percentage}% \n ${data.name}': '${data.percentage}%',
                      titleStyle: TextStyle(
                          color: isTouched ? AppTextStyle.colorBlack : AppTextStyle.colorWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: AppTextStyle.font15),
                      titlePositionPercentageOffset: isTouched ? 1.2 : 0.75,
                    );
                    return MapEntry(index, value);
                  })
                  .values
                  .toList(),
            ),
          ),
        ));
  }
}
