import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:path/path.dart';

class ScreenMasonryGrid extends StatelessWidget {
  const ScreenMasonryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('GridView'),
    );
  }
  _buildBody(){
    return MasonryGridView.builder(
      itemCount: 6,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ), itemBuilder: (context, index)=>Padding(padding: const EdgeInsets.all(4.0),
    child: Container(
      height: 200,
      color: Colors.blue,
      child: Image.asset('./assets/images/dart${index + 1}.jpeg', fit: BoxFit.fill,),
    ),
    ));
  }
  _buildMasonryGrid(){}
}
