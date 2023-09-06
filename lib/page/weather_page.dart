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
  String? status;

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
  }

  String getTime() {
    var now = DateTime.now();
    return formattedDate = DateFormat('h:mm a - EEE, d MMM').format(now);
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
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
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$temperature℃',
                      style: GoogleFonts.lato(
                        fontSize: 50,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/Cloud.svg',
                          width: 100,
                          height: 100,
                        ),
                        Text(
                          '$status',
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Divider(
                      height: 15,
                      thickness: 2,
                      color: Colors.white30,
                    ),
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
