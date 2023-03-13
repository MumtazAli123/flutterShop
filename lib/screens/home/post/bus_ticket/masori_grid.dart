import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nodejs/models/cart_models.dart';
import 'package:nodejs/sqlflite/data/db_helper.dart';
import '../../../../models/data/expensive_data.dart';
import '../../../../models/data/hive_database.dart';
import '../../../../utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class ScreenMasGrid extends StatefulWidget {
  const ScreenMasGrid({Key? key}) : super(key: key);

  @override
  State<ScreenMasGrid> createState() => _ScreenMasGridState();
}

class _ScreenMasGridState extends State<ScreenMasGrid> {
  DBHelper? dbHelper = DBHelper();
  HiveDataBase? db = HiveDataBase();
  List<String> productName = [
    ' Daewoo Express  ',
    'Faisal Movers  ',
    'A K G Movers',
    'Sky Express',
    'A K C EXPRESS',
    'KAINAT TRAVELS',
  ];

  List<int> productPrice = [200, 330, 990, 1100, 1200, 600];

  void onSave(BuildContext context, index) {
    final cart = Provider.of<ExpensiveDataModel>(context, listen: false);
    cart.addCounter(double.parse(productPrice[index].toString()));
    cart.addCounter(double as double );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, '/cart');
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
    );
  }

  _buildBody() {
    return MasonryGridView.builder(
        itemCount: 6,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    color: Colors.lightBlue,
                    child: Image.asset('./assets/airline/bus${index + 1}.jpeg',
                        fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productName[index].toString(),
                      style: const TextStyle(
                          backgroundColor: Colors.red,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    right: 1,
                    bottom: double.minPositive,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          db?.insert(Cart(
                                  id: index,
                                  productId: index.toString(),
                                  productName: productName[index].toString(),
                                  initialPrice: productPrice[index],
                                  productPrice: productPrice[index],
                                  quantity: 1,
                                  unitTag: AutofillHints.newUsername,
                                  image: AutofillHints.addressCity))
                              .then((value) {
                            Utils.snackBar('Product added', context);
                            onSave(context, index);
                          }).onError((error, stackTrace) {
                            Utils.flushBarErrorMessage(
                                error.toString(), context);
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 65,
                          color: Colors.green,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
