import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BankingScreen extends StatefulWidget {
  const BankingScreen({Key? key}) : super(key: key);

  @override
  State<BankingScreen> createState() => _BankingScreenState();
}


class _BankingScreenState extends State<BankingScreen> {
  final String _message = '';
  final String baseUrl = "http://localhost:3000"; // Replace with your server URL

  Future fetchData() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data');
    }
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
      title: const Text('Node.js + Express + Flutter'),
    );
  }

  _buildBody(){
    return  Center(
      child: Column(
        children: [
          const Text('data'),
          ListTile(
            title: Text(fetchData() as String)
          )

        ],
      ),
    );
  }
}
