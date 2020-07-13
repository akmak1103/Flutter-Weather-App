import 'package:flutter/material.dart';
import './screens/splashScreen.dart';
import 'package:provider/provider.dart';

import './Model/weatherModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider<WeatherModel>(
      create: (context) => WeatherModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: SplashScreen(),
      ),
    ));
}