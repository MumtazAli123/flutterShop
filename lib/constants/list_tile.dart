import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpensiveTile extends StatelessWidget {
  final String title;
  final String amount;
  final DateTime dateTime;
  final Function(BuildContext)? editTaped;
  final Function(BuildContext) deletedTaped;
  const ExpensiveTile(
      {Key? key,
      required this.title,
      required this.amount,
      required this.dateTime,
      required this.deletedTaped,
      required this.editTaped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            onPressed: deletedTaped,
            icon: Icons.delete,
          ),
          SlidableAction(
            backgroundColor: Colors.green,
            onPressed: editTaped,
            icon: Icons.edit,
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
            '${dateTime.runtimeType} ${dateTime.day} / ${dateTime.month} / ${dateTime.year}, ${dateTime.hour}:${dateTime.minute}:${dateTime.second}  '),
        trailing: Text(amount),
      ),
    );
  }
}
