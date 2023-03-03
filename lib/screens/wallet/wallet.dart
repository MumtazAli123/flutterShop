import 'package:flutter/material.dart';
import 'package:googleapis/connectors/v1.dart';
import '../../api/data/expensive_data.dart';
import '../../models/expense_model.dart';
import '../../utils/utils.dart';
import '../../widgets/input_widget.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;



  void addNewExpensive(){
    Utils.popupAwesome(context, Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10,),
        const Text('Add new Expense'),
        const SizedBox(height: 10,),
        CustomTextField(controller: _titleController, hintText: 'Title'),
        const SizedBox(height: 10,),
        CustomTextField(controller: _priceController, hintText: 'Price')
      ],
    ), ()=> Navigator.pushNamed(context, '/wallet'),);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Wallet'),
    );
  }
  _buildBody(){}
}

