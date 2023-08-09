import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/resources/app_sizes.dart';
import 'package:practice_app/resources/style/app_text_style.dart';

class CatAdoptionStats extends StatelessWidget {
  const CatAdoptionStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w8,
        vertical: AppSizes.h8,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 50, 27, 91), Colors.deepPurple],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      height: AppSizes.h240,
      child: AspectRatio(
        aspectRatio: 2,
        child: Padding(
          padding: EdgeInsets.only(right: AppSizes.w16),
          child: LineChart(
            LineChartData(
              maxY: 11,
              maxX: 6,
              gridData: FlGridData(show: false),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 119, 105, 181),
                    width: AppSizes.w4,
                  ),
                  left: const BorderSide(color: Colors.transparent),
                  right: const BorderSide(color: Colors.transparent),
                  top: const BorderSide(color: Colors.transparent),
                ),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    getTitlesWidget: bottomTitleWidgets,
                    showTitles: true,
                    interval: 1,
                    reservedSize: AppSizes.h40,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    getTitlesWidget: leftTitleWidgets,
                    showTitles: true,
                    interval: 2,
                    reservedSize: AppSizes.w30,
                  ),
                ),
              ),
              lineBarsData: [
                euthanasia(),
                fostered(),
                rehomed(),
                received(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LineChartBarData received() {
    return LineChartBarData(
      barWidth: AppSizes.h5,
      isStrokeCapRound: true,
      color: Color.fromARGB(255, 136, 76, 239),
      isCurved: true,
      dotData: FlDotData(show: false),
      spots: [
        FlSpot(1, 7),
        FlSpot(2, 7),
        FlSpot(3, 8),
        FlSpot(4, 9),
        FlSpot(5, 8.5),
        FlSpot(6, 8),
      ],
    );
  }

  LineChartBarData rehomed() {
    return LineChartBarData(
      barWidth: AppSizes.h5,
      isStrokeCapRound: true,
      color: Color.fromARGB(255, 85, 120, 226),
      isCurved: true,
      dotData: FlDotData(show: false),
      spots: [
        FlSpot(1, 3),
        FlSpot(2, 3.5),
        FlSpot(3, 5),
        FlSpot(4, 7),
        FlSpot(5, 6.5),
        FlSpot(6, 6),
      ],
    );
  }

  LineChartBarData euthanasia() {
    return LineChartBarData(
      barWidth: AppSizes.h5,
      isStrokeCapRound: true,
      color: Color.fromARGB(255, 94, 179, 97),
      isCurved: true,
      dotData: FlDotData(show: false),
      spots: [
        FlSpot(1, 4),
        FlSpot(2, 4),
        FlSpot(3, 3),
        FlSpot(4, 2.6),
        FlSpot(5, 2.0),
        FlSpot(6, 1.7),
      ],
    );
  }

  LineChartBarData fostered() {
    return LineChartBarData(
      barWidth: AppSizes.h5,
      isStrokeCapRound: true,
      color: Color.fromARGB(255, 238, 183, 71),
      isCurved: true,
      dotData: FlDotData(show: false),
      spots: [
        FlSpot(1, 2),
        FlSpot(2, 3),
        FlSpot(3, 2.5),
        FlSpot(4, 2),
        FlSpot(5, 2.1),
        FlSpot(6, 2),
      ],
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: AppTextStyle.font14,
      color: Colors.grey,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '';
        break;
      case 2:
        text = '2k';
        break;
      case 3:
        text = '3k';
        break;
      case 4:
        text = '4k';
        break;
      case 5:
        text = '5k';
        break;
      case 6:
        text = '6k';
        break;
      case 7:
        text = '7k';
        break;
      case 8:
        text = '8k';
        break;
      case 9:
        text = '9k';
        break;
      case 10:
        text = '10k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: AppTextStyle.font14,
      color: AppTextStyle.colorGrey
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '';
        break;
      case 2:
        text = '2016';
        break;
      case 3:
        text = '2017';
        break;
      case 4:
        text = '2018';
        break;
      case 5:
        text = '2019';
        break;
      case 6:
        text = '2020';
        break;
      default:
        return Container();
    }

    return Padding(
      padding: EdgeInsets.only(top: AppSizes.h8),
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }
}
