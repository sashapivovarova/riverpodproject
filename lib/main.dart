import 'package:flutter/material.dart';
import 'package:riverpodproject/page/onboarding_page.dart';
import 'package:riverpodproject/page/home_page.dart';
import 'package:riverpodproject/page/search_page.dart';
import 'package:riverpodproject/page/login_page.dart';

void main() {
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
      },
    );
  }
}
