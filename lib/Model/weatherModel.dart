import 'package:flutter/material.dart';
import './weather.dart';
import '../api/getIcon.dart';

class WeatherModel extends ChangeNotifier {
  Weather weather = Weather();

  setWeather (weatherInfo){
    print("set weather");
    weather = Weather(
        time: weatherInfo['dt'],
        sunrise: weatherInfo['sunrise'],
        sunset: weatherInfo['sunset'],
        temperature: weatherInfo['temp'],
        feelsLike: weatherInfo['feels_like'],
        pressure: weatherInfo['pressure'],
        humidity: weatherInfo['humidity'],
        description: weatherInfo['weather'][0]['description'],
        icon: WeatherIcons.getIcon(weatherInfo['weather'][0]['icon']),
        main: weatherInfo['weather'][0]['main']
    );
    notifyListeners();
  }

}