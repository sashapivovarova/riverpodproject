import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Network {
  final String url;

  Network({
    required this.url,
  });

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      debugPrint('Exceptional Error"');
    }
  }
}
