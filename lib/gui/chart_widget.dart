import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../global_settings.dart';
import '../main.dart';
import '../api_requests.dart';

class ChartWidget extends StatelessWidget {
  final List<PriceDate> points;

  const ChartWidget({required this.points, super.key});

  @override
  Widget build(BuildContext context) {
    double minPrice = 10000;
    double maxPrice = -1;

    for (int i = 0; i < points.length; i++) {
      maxPrice = max(points[i].price, maxPrice);
      minPrice = min(points[i].price, minPrice);
      //maxDate = max(points[i].date, maxDate);
      //minDate = min(points[i].date, minDate);
    }
    debugPrint(maxPrice.toString());
    debugPrint(minPrice.toString());
    return LineChart(
      LineChartData(
        minY: minPrice - 0.01 * minPrice,
        maxY: maxPrice + 0.01 * maxPrice,
        backgroundColor: colorMode[theme]["mainBackground"],
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: colorMode[theme]["mainFontColor"],
            barWidth: 3,
            dotData: FlDotData(
              show: false,
            ),
            spots:
                points.map((point) => FlSpot(point.date, point.price)).toList(),
          ),
        ],
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: false,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: colorMode[theme]["mainThemeGradient"],
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
      ),
    );
  }
}
