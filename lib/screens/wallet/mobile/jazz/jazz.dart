import 'package:flutter/material.dart';

class JazzTopUpScreen extends StatefulWidget {
  const JazzTopUpScreen({Key? key}) : super(key: key);

  @override
  State<JazzTopUpScreen> createState() => _JazzTopUpScreenState();
}

class _JazzTopUpScreenState extends State<JazzTopUpScreen> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState(){
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {

      });
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>  Scaffold(
    appBar: _buildAppBar(),
    body: _buildBody(),
  );

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.green,
      centerTitle: true,
      title:  Text('Jazz - ${controller.index + 1}'),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('./assets/images/jazz.png'),
          ),
        )
      ],
      bottom:  TabBar(
        controller: controller,
        tabs: const [
          Tab(text: 'Packages', icon: Icon(Icons.add)),
          Tab(text: 'PrePaid', icon: Icon(Icons.water_drop)),
          Tab(text: 'Load', icon: Icon(Icons.phone_iphone)),
        ],
      ),
    );
  }

  _buildBody() {
    return TabBarView(
        controller: controller,
        children: [_buildPackageLoad(), _buildPrePaidLoad(), _buildPaidLoad()]);
  }

  _buildPackageLoad() {
    return const Center(
      child: Text('Tab 1'),
    );
  }

  _buildPrePaidLoad() {
    return const Center(
      child: Text('Tab 2 content'),
    );
  }

  _buildPaidLoad() {
    return const Center(
      child: Text('Tab  content '),
    );
  }
}
