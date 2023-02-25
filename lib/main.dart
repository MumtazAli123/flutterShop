import 'package:flutter/material.dart';
import 'package:nodejs/api/router.dart';
import 'package:nodejs/constants/global_varaible.dart';
import 'package:nodejs/features/auth/auth_screen.dart';
import 'package:nodejs/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: GlobalVaraible.secondaryColor,
        scaffoldBackgroundColor: GlobalVaraible.backgroundColor,
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      onGenerateRoute: ((settings) => genrateRoute(settings)),
      home: const AuthScreen(),
    );
  }
}
