import 'package:flutter/material.dart';

class Weather{
  var time;
  var sunrise;
  var sunset;
  var temperature;
  var feelsLike;
  var pressure;
  var humidity;

  String description;
  NetworkImage icon;
  String main;

  Weather(
  {this.time,
      this.sunrise,
      this.sunset,
      this.temperature,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.description,
      this.icon,
      this.main});

  @override
  String toString() {
    return 'Weather{time: $time, sunrise: $sunrise, sunset: $sunset, temperature: $temperature, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, description: $description, icon: $icon, main: $main}';
  }
}