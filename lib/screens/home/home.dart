import 'package:flutter/material.dart';
import 'package:nodejs/features/auth/auth_screen.dart';
import 'package:nodejs/screens/home/post_screen.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "/post");
        },
        backgroundColor: Colors.orange, child: const Icon(Icons.image),
      ), 
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
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, AuthScreen.routeName);
        }, icon: const Icon(Icons.person))
      ],
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
