import 'package:flutter/material.dart';

class NolCardScreen extends StatelessWidget {
  const NolCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Nol Card TopUp'),
    );
  }
  _buildBody(){}
}
