import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Weather {
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset('assets/Cloud-Lightning.svg');
    } else if (condition < 500) {
      return SvgPicture.asset('assets/Cloud-Rain.svg');
    } else if (condition < 600) {
      return SvgPicture.asset('assets/Cloud-Snow.svg');
    } else if (condition == 800) {
      return SvgPicture.asset('assets/Sun.svg');
    } else if (condition <= 804) {
      return SvgPicture.asset('assets/Cloud.svg');
    } else {
      return SvgPicture.asset('assets/Moon.svg');
    }
  }
}
