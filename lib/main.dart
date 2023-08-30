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
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: TextButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.pink,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SecondPage();
                },
              ),
            );
          },
          child: const Text(
            'Go to the second page',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: TextButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.pink,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Go to the first page',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
