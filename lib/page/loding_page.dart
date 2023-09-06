import 'package:flutter/material.dart';
import 'package:riverpodproject/model/my_location.dart';
import 'package:riverpodproject/model/network.dart';
import 'package:riverpodproject/page/weather_page.dart';

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
        'https://api.openweathermap.org/data/3.0/onecall?lat=$latitude3&lon=$longitude3&appid=$api&units=metric';
    Network network = Network(url: url);
    var weatherData = await network.getJsonData();

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) =>
            WeatherPage(parseWeatherData: weatherData),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
