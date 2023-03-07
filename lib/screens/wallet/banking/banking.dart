import 'package:flutter/material.dart';

class BankingScreen extends StatelessWidget {
  const BankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Transfer or TopUp'),
    );
  }
  _buildBody(){}
}
