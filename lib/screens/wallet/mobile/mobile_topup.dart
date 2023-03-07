import 'package:flutter/material.dart';

class MobileTopUpScreen extends StatelessWidget {
  const MobileTopUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Mobile topUp'),
    );
  }
  _buildBody(){}
}
