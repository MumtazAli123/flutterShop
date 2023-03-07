import 'package:flutter/material.dart';
import 'package:nodejs/features/auth/auth_screen.dart';
import 'package:nodejs/screens/home/home.dart';
import 'package:nodejs/screens/home/post_screen.dart';
import 'package:nodejs/screens/wallet/agent.dart';
import 'package:nodejs/screens/wallet/banking/banking.dart';
import 'package:nodejs/screens/wallet/banking/internet.dart';
import 'package:nodejs/screens/wallet/banking/utilaty_bill.dart';
import 'package:nodejs/screens/wallet/mobile/mobile_topup.dart';
import 'package:nodejs/screens/wallet/schools/schools.dart';
import 'package:nodejs/screens/wallet/send_money/wallet_topup.dart';
import 'package:nodejs/screens/wallet/wallet.dart';
import 'package:nodejs/screens/wallet/wallet_history.dart';
import '../screens/wallet/banking/nolcard.dart';
import '../screens/wallet/input4digit.dart';
import '../screens/wallet/send_money/send_money.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ("/"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MyHomeScreen());
    case ("/wallet"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ScreenInput4Digit());
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case ("/wallet1"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const WalletScreen());
    case ("/agent"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AgentMapScreen());
    case ("/mobile"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MobileTopUpScreen());
    case ("/wallet_topUp"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const WalletToUpScreen());
    case ("/wallet_history"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const WalletHistoryScreen());
    case ("/nolCard"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const NolCardScreen());
    case ("/banking"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BankingScreen());
    case ("/send_money"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SendMoneyScreen());
    case ("/utility"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const UtilitiesScreen());
    case ("/internet"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const InternetScreen());
    case ("/schools"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SchoolsScreen());
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
