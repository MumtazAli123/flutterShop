import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../utils/utils.dart';

class ScreenAirlineGrid extends StatefulWidget {
  const ScreenAirlineGrid({Key? key}) : super(key: key);

  @override
  State<ScreenAirlineGrid> createState() => _ScreenAirlineGridState();
}

class _ScreenAirlineGridState extends State<ScreenAirlineGrid> {
  List<String> airLineName = [' Qatar airline ' , 'Oman airline' , 'Saudi airline' , 'Emirates airline' , 'Fly Dubai AirLine' ,'PIA airline',] ;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar(){
    return AppBar(
      title:  Text(Utils.dayTime(DateTime.now())),
    );
  }

  _buildBody(){
    return MasonryGridView.builder(
        itemCount: 6,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ), itemBuilder: (context, index)=>Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 200, color: Colors.lightBlue,
        child: Stack(
          children: [
            SizedBox(
              height: 200,
                child: Image.asset('./assets/airline/airline${index + 1}.jpeg', fit: BoxFit.fill,)),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(airLineName[index].toString(), style: const TextStyle(backgroundColor: Colors.red, color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    ));
  }

  _buildGridView(){}
}
