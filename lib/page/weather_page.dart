import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'home_page.dart';
import 'search_page.dart';

class WeatherPage extends StatefulWidget {
  final parseWeatherData;
  const WeatherPage({super.key, this.parseWeatherData});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String? cityName;
  int? temperature;
  String? formattedDate;

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
  }

  String getTime() {
    DateTime datetime2 = DateTime.now();
    String dateStr = datetime2.toString();
    DateTime dateTime = DateTime.parse(dateStr);

    String twoDigits(int n) {
      if (n >= 10) {
        return '$n';
      } else {
        return '0$n';
      }
    }

    return formattedDate =
        '${dateTime.year}-${twoDigits(dateTime.month)}-${twoDigits(dateTime.day)} ${twoDigits(dateTime.hour)}:${twoDigits(dateTime.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
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
            onPressed: () {},
            icon: const Icon(
              Icons.near_me_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.location_on_rounded,
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Text(
                  '$cityName',
                  style: GoogleFonts.lato(
                    fontSize: 30,
                  ),
                ),
                Text(
                  '$formattedDate',
                  style: GoogleFonts.lato(
                    fontSize: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
