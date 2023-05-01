import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/screens/chart_screen/components/chart_data.dart';

class CatOwnerStats extends StatelessWidget {
  const CatOwnerStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 29, 50, 91),
        // borderRadius: BorderRadius.all(
        //   Radius.circular(40),
        // ),
      ),
      height: 240,
      child: AspectRatio(
        aspectRatio: 2,
        child: BarChart(
          BarChartData(
            maxY: 5,
            minY: 0,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitleWidgets,
                  reservedSize: 30,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitleWidgets,
                  reservedSize: 40,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            groupsSpace: 12,
            barTouchData: BarTouchData(enabled: true),
            barGroups: ChartData.barData
                .map(
                  (data) => BarChartGroupData(
                    x: data.id!,
                    barRods: [
                      BarChartRodData(
                        toY: data.y!,
                        gradient: LinearGradient(
                            colors: [
                              Colors.green,
                              Colors.blue,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                        width: 30,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: Colors.grey,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10%';
        break;
      case 2:
        text = '20%';
        break;
      case 3:
        text = '30%';
        break;
      case 4:
        text = '40%';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      color: Colors.grey,
    );
    String text = ChartData.barData[value.toInt() - 1].name;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }
}
