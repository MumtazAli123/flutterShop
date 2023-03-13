import 'package:flutter/material.dart';
import 'package:nodejs/features/auth/auth_screen.dart';
import 'package:nodejs/screens/home/home.dart';
import 'package:nodejs/screens/home/post/airline/airline.dart';
import 'package:nodejs/screens/home/post/bus_ticket/cart_screen.dart';
import 'package:nodejs/screens/home/post/bus_ticket/masori_grid.dart';
import 'package:nodejs/screens/home/post/post_screen.dart';
import 'package:nodejs/screens/wallet/agent.dart';
import 'package:nodejs/screens/wallet/banking/banking.dart';
import 'package:nodejs/screens/wallet/banking/internet.dart';
import 'package:nodejs/screens/wallet/banking/utilaty_bill.dart';
import 'package:nodejs/screens/wallet/mobile/telenor/telenor_topup.dart';
import 'package:nodejs/screens/wallet/mobile/ufone/ufone.dart';
import 'package:nodejs/screens/wallet/mobile/zong/zong.dart';
import 'package:nodejs/screens/wallet/schools/schools.dart';
import 'package:nodejs/screens/wallet/send_money/wallet_topup.dart';
import 'package:nodejs/screens/wallet/wallet.dart';
import 'package:nodejs/screens/wallet/wallet_history.dart';
import '../screens/wallet/banking/nolcard.dart';
import '../screens/wallet/input4digit.dart';
import '../screens/wallet/mobile/jazz/jazz.dart';
import '../screens/wallet/send_money/send_money.dart';
import 'dart:async';
import 'dart:io';

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
    case ("/telenor"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  const TelenorTopUpScreen());
    case ("/jazz"):
      return MaterialPageRoute(builder: (_)=> const JazzTopUpScreen());
    case ("/ufone"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  const UfoneTopUpScreen());
    case ("/zong"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  const ZongTopUpScreen());
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
          settings: routeSettings, builder: (_) => const BookingScreen());
    case ("/post1"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ScreenMasGrid());

    case ("/cart"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const CartScreen());

    case ("/airline"):
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ScreenAirlineGrid());
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist!'),
                ),
              ));
  }
}
