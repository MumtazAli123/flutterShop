import 'package:flutter/material.dart';
import 'package:nodejs/screens/wallet/send_money/widget/panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // IconsAvatarScreen db = const IconsAvatarScreen();
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Send Money'),
    );
  }
  _buildBody(){
    return BottomAppBar(
      child: SlidingUpPanel(
        body: const Column(
          children: [
          ],
        ),
        panelBuilder: (controller)=>PanelWidget(
          controller: controller,
        ),
      ),
    );
  }
}


