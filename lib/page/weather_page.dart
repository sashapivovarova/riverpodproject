import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:riverpodproject/model/weather.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'login_page.dart';

class WeatherPage extends StatefulWidget {
  final parseWeatherData;
  const WeatherPage({super.key, this.parseWeatherData});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather weather = Weather();
  String? cityName;
  int? temperature;
  String? formattedDate;
  String? status;
  int? sunrise;
  int? sunset;
  int? condition;
  Widget? icon;

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
    getTime();
  }

  void updateData(dynamic weatherData) {
    String cityName2 = weatherData['timezone'];
    int startIndex = cityName2.indexOf('/') + 1;
    cityName = cityName2.substring(startIndex).replaceAll('_', ' ');
    double temperature2 = weatherData['current']['temp'];
    temperature = temperature2.toInt();
    status = weatherData['current']['weather'][0]['main'];
    condition = weatherData['current']['weather'][0]['id'];
    icon = weather.getWeatherIcon(condition!);
  }

  String getTime() {
    var now = DateTime.now();
    return formattedDate = DateFormat('h:mm a - EEE, d MMM').format(now);
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
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const ThirdPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$cityName',
                    style: GoogleFonts.lato(
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    '$formattedDate',
                    style: GoogleFonts.lato(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$temperature℃',
                    style: GoogleFonts.lato(
                      fontSize: 80,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      icon!,
                      Text(
                        '$status',
                        style: GoogleFonts.lato(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
