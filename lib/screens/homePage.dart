import 'package:flutter/material.dart';
import '../Model/weather.dart';
import 'package:provider/provider.dart';
import '../api/weatherClient.dart';
import '../Model/weatherModel.dart';
import 'package:location/location.dart';
import 'dart:convert' as json;
import 'dart:core';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather weather = Weather();

  @override
  initState() {
    _getWeather();
    super.initState();
  }

  Future locationFuture;

  _getWeather() {
    print("get weather");
    _getLocation().then((locationData) {
      WeatherClient.getWeatherData(
              locationData.latitude, locationData.longitude)
          .then((value) {
        (Provider.of<WeatherModel>(context, listen: false))
            .setWeather(json.jsonDecode(value.body)["current"]);
        //return _toModel(json.jsonDecode(value.body)["current"]);
      });
    });
  }

  _getLocation() async {
    print("get location");
    Location location = Location();
    dynamic exactLocation = await location.getLocation();
    return exactLocation;
  }

  @override
  Widget build(BuildContext context) {
    weather = (Provider.of<WeatherModel>(context, listen: false)).weather;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Flutter Weather',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: _getWeather,
              icon: Icon(Icons.refresh),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            //Color(0xff16d9e3),
            Color(0xff30c7ec),
            Colors.blue
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter
                  //background-image: radial-gradient(circle 248px at center, #16d9e3 0%, #30c7ec 47%, #46aef7 100%);
                  )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Consumer<WeatherModel>(
                builder: (context, weatherModel, _) {
                  Weather weather = weatherModel.weather;
                  if (weather.icon == null) {
                    return CircularProgressIndicator();
                  } else
                    return Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(weather.main.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 50)),
                            Image(image: weather.icon),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        SizedBox(height: 30),
                        Text("Feels Like",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        Row(
                          children: <Widget>[
                            Text(
                              (weather.feelsLike.toString()),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 100,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "\u00b0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Actual Temp",
                            style: TextStyle(color: Colors.white)),
                        Row(
                          children: <Widget>[
                            Text(
                              (weather.temperature.toString()),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "\u00b0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Sunrise: " + DateTime.fromMillisecondsSinceEpoch(weather.sunrise*1000).toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sunset: " + DateTime.fromMillisecondsSinceEpoch(weather.sunset*1000).toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Pressure: " + weather.pressure.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Humidity: " + weather.humidity.toString(),
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
