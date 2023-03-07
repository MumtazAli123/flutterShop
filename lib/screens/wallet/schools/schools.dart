import 'package:flutter/material.dart';

class SchoolsScreen extends StatelessWidget {
  const SchoolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Pay Fees Schools & Collages'),
    );
  }
  _buildBody(){}
}
