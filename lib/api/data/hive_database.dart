import 'package:hive/hive.dart';
import 'package:nodejs/models/expense_model.dart';
import 'expensive_data.dart';

final _myBox = Hive.box("expense_database2");

class HiveDataBase {
  List todayDataList  = [];

  void loadData (){}
  void updateData(int daysPerWeek, String text, String price, String cent){
    _myBox.put("CURRENT_HIVE-DATA_LIST", todayDataList);
  }

  void saveData(List<ExpensiveItem> allExpensive) {
    /*
   Hive can only store string dateTime, and not custom like ExpenseItem.
   So lets convert

   [
     ExpenseItem ( name / amount / dateTime )
     ..
   ]

   ->

   [

   [name , amount, dateTime]
   ..

   ]

   */

    List<List<dynamic>> allExpensesFormatted = [];
    for (var expense in allExpensive) {
      List<dynamic> expenseFormatted = [
        expense.title,
        expense.amount,
        expense.dateTime
      ];
      allExpensesFormatted.add(expenseFormatted);
    }
    _myBox.put("ALL_EXPENSES", allExpensesFormatted);
  }

  List<ExpensiveItem> readData() {
    /*
    Data is stored in Hive as a list f String + datetime

    saveData =
    [

    [ title, amount, dateTime],
    ...

    ]
    [
     ExpensiveItem ( title / amount / dateTime )
    ]
     */

    List saveExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpensiveItem> allExpenses = [];
    for (int i = 0; i < saveExpenses.length; i++) {
      //collect expenses data
      String title = saveExpenses[i][0];
      String amount = saveExpenses[i][1];
      DateTime dateTime = saveExpenses[i][2];

      //  create expenses item
      ExpensiveItem expense =
          ExpensiveItem(title: title, amount: amount, dateTime: dateTime);
      allExpenses.add(expense);
    }
    return allExpenses;
  }

  static Future<int> updateItem(
      int id, String title, String? description, String text) async {
    final db = HiveDataBase();
    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('items', data, where: "id = ? ", whereArgs: [id]);
    return result;
  }

  update(String s, Map<String, String?> data,
      {required String where, required List<int> whereArgs}) {}
}
