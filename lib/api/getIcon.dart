import 'package:flutter/material.dart';

class WeatherIcons{
  static const  String baseURL = 'http://openweathermap.org/img/wn/';

  static getIcon(String iconCode) {
    return NetworkImage('$baseURL$iconCode@2x.png');
  }
}