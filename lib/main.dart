import 'package:flutter/material.dart';
import 'package:nodejs/api/router.dart';
import 'package:nodejs/constants/global_varaible.dart';
import 'package:nodejs/features/cart_provider.dart';
import 'package:nodejs/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'models/data/expensive_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("expense_database2");
  ChangeNotifierProvider(
    create: (BuildContext context) => CartProvider(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpensiveDataModel(),
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: ThemeMode.system,
          theme: ThemeData(
              primaryColor: GlobalVariable.secondaryColor,
              scaffoldBackgroundColor: GlobalVariable.backgroundColor,
              primarySwatch: Colors.blue,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
              useMaterial3: false,
              unselectedWidgetColor: Colors.teal),
          onGenerateRoute: ((settings) => generateRoute(settings)),
          home: const MyHomeScreen(),
        );
      }),
    );
  }
}
