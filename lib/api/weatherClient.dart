import './api_key.dart';
import 'package:http/http.dart' as http;

class WeatherClient{
  static const String baseURL = 'https://api.openweathermap.org/data/2.5/onecall?units=metric&exclude=hourly,daily';

  static getWeatherData(lat,long) async{
    print("server call");
    final fetchURL = '$baseURL&lat=$lat&lon=$long&appid=${ApiKey.apiKEY}';
    http.Response response = await http.get(fetchURL);
    return response;
  }
}