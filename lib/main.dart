import 'dart:io';
import 'package:flutter/material.dart';
import 'package:riverpodproject/page/onboarding_page.dart';
import 'package:riverpodproject/page/home_page.dart';
import 'package:riverpodproject/page/search_page.dart';
import 'package:riverpodproject/page/login_page.dart';
import 'package:riverpodproject/page/shopping_cart.dart';
import 'package:riverpodproject/page/weather_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrition',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingPage(),
        '/home': (context) => const MyPage(),
        '/second': (context) => const SecondPage(),
        '/third': (context) => const ThirdPage(),
        '/forth': (context) => const ForthPage(),
        '/fifth': (context) => const FifthPage(),
      },
    );
  }
}
