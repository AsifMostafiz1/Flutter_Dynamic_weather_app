import 'dart:convert';

import 'package:flutter_11_weather_app/model.dart';
import 'package:http/http.dart' as http;
class DataService{
  //http://api.openweathermap.org/data/2.5/weather?q=Pabna&appid=3b9a0e5e60c2f30f6af54e84222bd83f
  Future<WeatherResponse> getWeather(String city) async {
    final pathParameters ={
      'q': city,
      'appid':'3b9a0e5e60c2f30f6af54e84222bd83f',
      'units': 'imperial'
    };
    final uri = Uri.https("api.openweathermap.org","/data/2.5/weather",pathParameters);

    final response = await http.get(uri);

      print(response.body);
     final result = jsonDecode(response.body);

     return WeatherResponse.fromJson(result);
  }

}