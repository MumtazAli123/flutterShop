import 'package:flutter/cupertino.dart';
import 'package:nodejs/api/bar_graph/bar_graph.dart';
import 'package:nodejs/api/data/expensive_data.dart';
import 'package:nodejs/sqlflite/date_time_helper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ExpensiveSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpensiveSummary({Key? key, required this.startOfWeek})
      : super(key: key);
  // list graph
  double calculateMax(
      ExpensiveData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    double? max = 100;
    List<double> values = [
      value.calculateDailyExpensiveSummary()[sunday] ?? 0,
      value.calculateDailyExpensiveSummary()[monday] ?? 0,
      value.calculateDailyExpensiveSummary()[tuesday] ?? 0,
      value.calculateDailyExpensiveSummary()[wednesday] ?? 0,
      value.calculateDailyExpensiveSummary()[thursday] ?? 0,
      value.calculateDailyExpensiveSummary()[friday] ?? 0,
      value.calculateDailyExpensiveSummary()[saturday] ?? 0,
    ];
    //  sort from smallest to largest
    values.sort();
    //  get largest amount
    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }
  // calculate week total

  // String calculateWeekTotal (
  //     ExpensiveData value,
  //     String sunday,
  //     String monday,
  //     String tuesday,
  //     String wednesday,
  //     String thursday,
  //     String friday,
  //     String saturday
  //
  //     ){
  //   List<double> values = [
  //     value.calculateDailyExpensiveSummary()[sunday] ?? 0,
  //     value.calculateDailyExpensiveSummary()[monday] ?? 0,
  //     value.calculateDailyExpensiveSummary()[tuesday] ?? 0,
  //     value.calculateDailyExpensiveSummary()[wednesday] ?? 0,
  //     value.calculateDailyExpensiveSummary()[thursday] ?? 0,
  //     value.calculateDailyExpensiveSummary()[friday] ?? 0,
  //     value.calculateDailyExpensiveSummary()[saturday] ?? 0,
  //   ];
  //   String total (int p) {
  //     assert(p > 0);
  //     p = 0;
  //     for (int i = 0; i < values.length; i++){
  //      p += values[i] as int;
  //     }
  //     return p.toStringAsFixed(2);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String sunday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String monday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String friday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));
    return Consumer<ExpensiveData>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text("Week Total"),
                      Text(' \$200'),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: MyBarGraph(
                        maxY: calculateMax(value, sunday, monday, tuesday,
                            wednesday, thursday, friday, saturday),
                        sunAmount:
                            value.calculateDailyExpensiveSummary()[sunday] ?? 0,
                        monAmount:
                            value.calculateDailyExpensiveSummary()[monday] ?? 0,
                        tueAmount:
                            value.calculateDailyExpensiveSummary()[tuesday] ??
                                0,
                        wedAmount:
                            value.calculateDailyExpensiveSummary()[wednesday] ??
                                0,
                        thuAmount:
                            value.calculateDailyExpensiveSummary()[thursday] ??
                                0,
                        friAmount:
                            value.calculateDailyExpensiveSummary()[friday] ?? 0,
                        satAmount:
                            value.calculateDailyExpensiveSummary()[saturday] ??
                                0),
                  ),
                ],
              ),
            ));
  }
}
