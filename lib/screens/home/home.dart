import 'package:flutter/material.dart';
import 'package:nodejs/features/auth/auth_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.green,
      centerTitle: true,
      title: const Text(
        "Home ",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _buildBody() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AuthScreen.routeName);
        },
        child: const Text('click'),
      ),
    );
  }
}
