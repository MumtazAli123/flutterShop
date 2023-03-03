import 'package:flutter/material.dart';
import 'package:nodejs/features/auth/auth_screen.dart';
import 'package:nodejs/screens/home/home.dart';
import 'package:nodejs/screens/home/post_screen.dart';

import '../screens/wallet/wallet.dart';

Route<dynamic> ganrateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ("/"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MyHomeScreen());
    case ("/wallet"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const WalletScreen());
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case ("/post"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MyPostScreen());

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist!'),
                ),
              ));
  }
}
