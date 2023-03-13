import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  const PanelWidget({Key? key, required  this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
      controller: controller,
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        const SizedBox(height: 20,),
        buildAboutText(),
        const SizedBox(height: 20,),

      ],
    );
  }

 Widget buildAboutText() {
    return  SizedBox(
      height: 300,
      child: Column(
        children: [
          AppBar(
            title: const Text('Mobile'),
          ),

        ],
      ),
    );
 }
}
