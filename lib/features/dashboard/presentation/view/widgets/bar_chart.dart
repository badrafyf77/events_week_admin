import 'package:events_week_admin/core/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.grey[300],
            strokeWidth: 1,
          ),
        ),
        alignment: BarChartAlignment.spaceAround,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 0,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getLeftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(value.toInt().toString(), style: style),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 9,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '01/03';
        break;
      case 1:
        text = '02/03';
        break;
      case 2:
        text = '03/03';
        break;
      case 3:
        text = '04/03';
        break;
      case 4:
        text = '05/03';
        break;
      case 5:
        text = '06/03';
        break;
      case 6:
        text = '07/03';
        break;
      case 7:
        text = '08/03';
        break;
      case 8:
        text = '09/03';
        break;
      case 9:
        text = '10/03';
        break;
      case 10:
        text = '11/03';
        break;
      case 11:
        text = '12/03';
        break;
      case 12:
        text = '13/03';
        break;
      case 13:
        text = '14/03';
        break;
      case 14:
        text = '15/03';
        break;
      case 15:
        text = '16/03';
        break;
      case 16:
        text = '17/03';
        break;
      case 17:
        text = '18/03';
        break;
      case 18:
        text = '19/03';
        break;
      case 19:
        text = '20/03';
        break;
      case 20:
        text = '21/03';
        break;
      case 21:
        text = '22/03';
        break;
      case 22:
        text = '23/03';
        break;
      case 23:
        text = '24/03';
        break;
      case 24:
        text = '25/03';
        break;
      case 25:
        text = '26/03';
        break;
      case 26:
        text = '27/03';
        break;
      case 27:
        text = '28/03';
        break;
      case 28:
        text = '29/03';
        break;
      case 29:
        text = '30/03';
        break;
      case 30:
        text = '31/03';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      angle: AppUtils().degreeToRadian(value < 0 ? -45 : 45),
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getBottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            getTitlesWidget: getLeftTitles,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 8,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 12,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 20,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 30,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 80,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: 50,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            BarChartRodData(
              toY: 8,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            BarChartRodData(
              toY: 10,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 9,
          barRods: [
            BarChartRodData(
              toY: 12,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 10,
          barRods: [
            BarChartRodData(
              toY: 20,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 11,
          barRods: [
            BarChartRodData(
              toY: 30,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 12,
          barRods: [
            BarChartRodData(
              toY: 80,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 13,
          barRods: [
            BarChartRodData(
              toY: 50,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 14,
          barRods: [
            BarChartRodData(
              toY: 8,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 15,
          barRods: [
            BarChartRodData(
              toY: 10,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 16,
          barRods: [
            BarChartRodData(
              toY: 12,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 17,
          barRods: [
            BarChartRodData(
              toY: 20,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 18,
          barRods: [
            BarChartRodData(
              toY: 30,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 19,
          barRods: [
            BarChartRodData(
              toY: 80,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 20,
          barRods: [
            BarChartRodData(
              toY: 50,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 21,
          barRods: [
            BarChartRodData(
              toY: 8,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 22,
          barRods: [
            BarChartRodData(
              toY: 10,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 23,
          barRods: [
            BarChartRodData(
              toY: 12,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 24,
          barRods: [
            BarChartRodData(
              toY: 20,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 25,
          barRods: [
            BarChartRodData(
              toY: 30,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 26,
          barRods: [
            BarChartRodData(
              toY: 80,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 27,
          barRods: [
            BarChartRodData(
              toY: 50,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 28,
          barRods: [
            BarChartRodData(
              toY: 8,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 29,
          barRods: [
            BarChartRodData(
              toY: 10,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 30,
          barRods: [
            BarChartRodData(
              toY: 12,
              color: AppColors.kPrimaryColor,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: _BarChart(),
    );
  }
}

class AppUtils {
  factory AppUtils() {
    return _singleton;
  }

  AppUtils._internal();
  static final AppUtils _singleton = AppUtils._internal();

  double degreeToRadian(double degree) {
    return degree * math.pi / 180;
  }

  double radianToDegree(double radian) {
    return radian * 180 / math.pi;
  }
}
