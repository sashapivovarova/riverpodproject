import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toast Message',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 10,
          ),
          padding: const EdgeInsets.all(
            40,
          ),
          color: Colors.white,
          child: const Text('Container'),
        ),
      ),
    );
  }
}
