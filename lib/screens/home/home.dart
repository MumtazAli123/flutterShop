import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nodejs/constants/expensive_summary.dart';
import 'package:nodejs/constants/list_tile.dart';
import 'package:nodejs/widgets/input_widget.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../../api/data/expensive_data.dart';
import '../../features/auth/auth_screen.dart';
import '../../models/expense_model.dart';
import '../../sqlflite/sql_helper.dart';
import '../../utils/utils.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool _isLoading = true;
  // final ImagePicker _pickerController = ImagePicker();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _centController = TextEditingController();

  @override
  void initState(){
    super.initState();
  //  prepare Data
    Provider.of<ExpensiveData>(context, listen: false).prepareData();
    _refreshJournals();
    if (kDebugMode) {
      print(".. Number of items ${_journals.length} ");
    }
  }

  List<Map<String, dynamic>> _journals = [];
  final color = Colors.red;
  final urlImage =
      "https://miro.medium.com/max/1000/1*JbDo7U0l62vYMfm1WxnA1g.png";

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  Future<void> _deleteItem(
    int id,
  ) async {
    Utils.snackBar1('message', context);
  }

  void onSave() {
    String amount = '${_priceController.text}.${_centController.text}';
    ExpensiveItem newExpense = ExpensiveItem(
        title: _titleController.text,
        amount: amount,
        dateTime: DateTime.now());
    Provider.of<ExpensiveData>(context, listen: false)
        .addNewExpensive(newExpense);
    clear();
  }

  void clear() {
    _titleController.clear();
    _priceController.clear();
    _centController.clear();
  }

  void addNewExpensive() {
    Utils.popupAwesome(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text('Add new Expense'),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: _titleController,
            hintText: 'Title',
            text: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
         Row(
           children: [
             Expanded(child:  CustomTextField(
               controller: _priceController,
               hintText: 'Price',
               text: TextInputType.number,
             ),),
             Expanded(child:  CustomTextField(
               controller: _centController,
               hintText: 'Cents',
               text: const TextInputType.numberWithOptions(),
             ),)
           ],
         ),
        ],
      ),
      () => onSave(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/wallet'),
                label: const Text('Wallet'),
                icon: const Icon(Icons.wallet),
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/post'),
                label: const Text('Add'),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpensive,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.green,
      centerTitle: true,
      title: const Text(
        "Home ",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AuthScreen.routeName);
            },
            icon: const Icon(Icons.person))
      ],
    );
  }

  _buildBody() {
    return Consumer<ExpensiveData>(
        builder: (context, value, child) => ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ExpensiveSummary(startOfWeek: value.startOfWeekDate()),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.getAllExpensiveList().length,
                    itemBuilder: (context, index) => Card(
                          color: Colors.orange.shade300,
                          semanticContainer: true,
                          child: ExpensiveTile(
                              title: value.getAllExpensiveList()[index].title,
                              amount:
                                  'PKR: ${value.getAllExpensiveList()[index].amount}',
                              dateTime:
                                  value.getAllExpensiveList()[index].dateTime),
                        )),
              ],
            ));
  }
}
