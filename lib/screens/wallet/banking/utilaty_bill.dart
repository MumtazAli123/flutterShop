import 'package:flutter/material.dart';

class UtilitiesScreen extends StatelessWidget {
  const UtilitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Pay Utilities '),
    );
  }
  _buildBody(){}
}
