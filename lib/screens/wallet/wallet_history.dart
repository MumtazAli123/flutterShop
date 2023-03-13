// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/list_tile.dart';
import '../../models/data/expensive_data.dart';
import '../../utils/utils.dart';

class WalletHistoryScreen extends StatelessWidget {
  const WalletHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Wallet History'),
    );
  }
  _buildBody(){
    return Consumer<ExpensiveDataModel>(
        builder: (context, value, child) => ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            // ExpensiveSummary(startOfWeek: value.startOfWeekDate()),
            // const SizedBox(
            //   height: 10,
            // ),
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
                    value.getAllExpensiveList()[index].dateTime,
                    // deletedTaped: (BuildContext) => deleteExpenseItem(
                    //     value.getAllExpensiveList()[index]),
                    // ignore: avoid_types_as_parameter_names,
                    editTaped: (BuildContext) {
                      // updateItem();
                      Utils.snackBar(
                          'Update was successfully', context);
                    // ignore: avoid_types_as_parameter_names
                    }, deletedTaped: (BuildContext ) {  },
                  ),
                )),
          ],
        ));
  }
}
