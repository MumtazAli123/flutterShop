import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nodejs/models/cart_models.dart';
import 'package:nodejs/models/expense_model.dart';
import 'package:nodejs/sqlflite/data/db_helper.dart';
import 'package:nodejs/sqlflite/date_time_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'hive_database.dart';

class ExpensiveDataModel extends ChangeNotifier{
  DBHelper dbHelper = DBHelper();
  List<ExpensiveItem> overAllExpenseList = [];
//  get expensive list
  List<ExpensiveItem> getAllExpensiveList() {
    return overAllExpenseList;
  }

//  prepare data to display
  final db = HiveDataBase();
  void prepareData( ){
    if (db.readData().isNotEmpty){
      overAllExpenseList = db.readData();
    }
  }

//  add new expensive

  void addNewExpensive(ExpensiveItem newExpensive) {
    overAllExpenseList.add(newExpensive);
    notifyListeners();
    db.saveData(overAllExpenseList);
  }

//delete expensive
  void deleteExpensive(ExpensiveItem expense) {
    overAllExpenseList.remove(expense);
    notifyListeners();
    db.saveData(overAllExpenseList);
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
  String getDayNameList(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'M';
      case 2:
        return 'T';
      case 3:
        return 'W';
      case 4:
        return 'Th';
      case 5:
        return 'F';
      case 6:
        return 'St';
      case 7:
        return 'S';
      default:
        return '';
    }
  }


  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<DBHelper> getData ()async{
    _cart.toString();
    return dbHelper;
  }

  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;


  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addTotalPrice(double productPrice){
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }
  void removeTotalPrice(double productPrice){
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }
  double getTotalPrice(){
    _getPrefItems();
    return _totalPrice;
  }

  void addCounter(double parse) {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }


}
