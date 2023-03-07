import 'package:flutter/material.dart';

class AgentMapScreen extends StatefulWidget {
  const AgentMapScreen({Key? key}) : super(key: key);

  @override
  State<AgentMapScreen> createState() => _AgentMapScreenState();
}

class _AgentMapScreenState extends State<AgentMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Nearest Agents '),
    );
  }

  _buildBody() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _buildGoogleMap(),
          Text(
            ' We are looking agent in your area',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  _buildGoogleMap() {
    // return const GoogleMaps();
  }
}
