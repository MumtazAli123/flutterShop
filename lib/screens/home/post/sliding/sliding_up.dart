import 'package:flutter/material.dart';
import 'package:nodejs/widgets/main_image.dart';

class SlidingUpFolding extends StatelessWidget {
  const SlidingUpFolding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar() ,
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Sliding'),
      elevation: 0,
      // backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }
  _buildBody(){
    return  const MainImageWidget(
    );
  }
}
