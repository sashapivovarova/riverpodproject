import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      appBar: AppBar(
        title: const Text('Toast Message'),
      ),
      body: Center(
        child: TextButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.pink,
            ),
          ),
          onPressed: () {
            flutterToast();
          },
          child: const Text(
            'Click',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
    msg: 'Thank you ❤️',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.teal,
    fontSize: 20,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
