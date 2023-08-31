import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigator',
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

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      done: const Text('Done'),
      onDone: () {
        Navigator.pushNamed(context, '/home');
      },
      next: const Icon(Icons.arrow_forward),
      pages: [
        PageViewModel(
          title: 'Home',
          body: 'You can look everyting',
        ),
        PageViewModel(
          title: 'Search',
          body: 'You can search everyting',
        ),
        PageViewModel(
          title: 'Shopping card',
          body: 'You can buy everyting',
        ),
      ],
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Main Screen',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Go to onboarding screen.'),
            ),
          ],
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
        automaticallyImplyLeading: false,
        title: const Text('Search'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.home_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Shopping cart'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.home_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
