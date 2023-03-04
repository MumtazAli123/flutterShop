import 'package:flutter/material.dart';

class ExpensiveTile extends StatelessWidget {
  final String title;
  final String amount;
  final DateTime dateTime;
  const ExpensiveTile(
      {Key? key,
      required this.title,
      required this.amount,
      required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('${dateTime.runtimeType} ${dateTime.day} / ${dateTime.month} / ${dateTime.year}, ${dateTime.hour}:${dateTime.minute}:${dateTime.second}  '),
      trailing: Text(amount),
    );
  }
}
