import 'package:flutter/material.dart';
import 'package:riverpodproject/model/my_location.dart';
import 'package:riverpodproject/model/network.dart';
import 'home_page.dart';
import 'search_page.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Weather'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const MyPage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
          icon: const Icon(
            Icons.home_outlined,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const SecondPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'City name',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Temperature',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
