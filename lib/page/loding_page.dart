import 'package:flutter/material.dart';
import 'package:riverpodproject/model/my_location.dart';
import 'package:riverpodproject/model/network.dart';
import 'package:riverpodproject/page/weather_page.dart';
import 'home_page.dart';
import 'search_page.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    String api = '0d0cc1131b44cd6ea0027e60e69dc007';
    String url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$latitude3&lon=$longitude3&appid=$api';
    Network network = Network(url: url);
    var weatherData = await network.getJsonData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const WeatherPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
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
      body: Builder(
        builder: (context) {
          return Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Get my location'),
            ),
          );
        },
      ),
    );
  }
}
