import 'package:flutter/material.dart';

class WalletToUpScreen extends StatelessWidget {
  const WalletToUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Wallet ToUP'),
    );
  }
  _buildBody(){}
}
