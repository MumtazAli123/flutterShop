import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nodejs/models/expense_model.dart';
import 'package:nodejs/sqlflite/date_time_helper.dart';

class ExpensiveData extends ChangeNotifier{
  List<ExpensiveItem> overAllExpenseList = [];
//  get expensive list
  List<ExpensiveItem> getAllExpensiveList() {
    return overAllExpenseList;
  }

//  add new expensive

  void addNewExpensive(ExpensiveItem newExpensive) {
    overAllExpenseList.add(newExpensive);
    notifyListeners();
  }

//delete expensive
  void deleteExpensive(ExpensiveItem expense) {
    overAllExpenseList.remove(expense);
    notifyListeners();
  }

// get weekday list
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

//  get date foe the start
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

//    get today date
    DateTime today = DateTime.now();

//go backward from today
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }
  Map <String, double> calculateDailyExpensiveSummary(){
    Map<String, double> dailyExpensiveSummary = {
    };

    for (var expense in overAllExpenseList){
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);
      if(dailyExpensiveSummary.containsKey(date)){
        double currentAmount = dailyExpensiveSummary[date]!;
        currentAmount += amount;
        dailyExpensiveSummary[date] = currentAmount;
      }else {
        dailyExpensiveSummary.addAll({date: amount});
      }
    }
    return dailyExpensiveSummary;
  }

}
