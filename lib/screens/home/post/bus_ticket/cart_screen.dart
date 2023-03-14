import 'package:flutter/material.dart';
import 'package:nodejs/models/data/expensive_data.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../utils/utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ExpensiveDataModel>(context);
    return  Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: badges.Badge(
                  badgeContent: Consumer<ExpensiveDataModel>(
                    builder: (context, value, child) {
                      return  Text(
                        value.getCounter().toString(),
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                  child: const Icon(Icons.shopping_bag)),
            ),
          )
        ],
        title: Text(Utils.dayTime(DateTime.now())),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot snapshot){
                if (snapshot.hasData){
                  return Expanded(child: ListView.builder(
                      itemBuilder: (context, index){
                        return const Card(
                          child: Column(
                            children: [],
                          ),
                        );
                      }));

                }else {
                  return const Text('data');
                }

              })
        ],
      ),
    );
  }
}
