import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nodejs/api/bar_graph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  const MyBarGraph(
      {Key? key,
      this.maxY,
      required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thuAmount,
      required this.friAmount,
      required this.satAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // initialize bar data;
    BarData myBarData = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thuAmount: thuAmount,
        friAmount: friAmount,
        satAmount: satAmount);
    myBarData.initializeBarDat();

    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
       rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false) ),

       bottomTitles: AxisTitles(sideTitles:SideTitles(showTitles: true) )
      ),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Colors.green[800],
                    width: 15,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: maxY,
                      color: Colors.grey[200],
                    ))
              ]))
          .toList(),
    ));
  }
  get text => null;

  Widget getBottomTiles(double value, TitleMeta meta){

    const style = TextStyle(
      color:  Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }

}
