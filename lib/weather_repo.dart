import 'package:http/http.dart' as http;
import 'package:api_testing_weather/weather_model.dart';
import 'dart:convert';

class WeatherRepo{
  Future<WeatherModel> getWeather(String city) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=4388c036fb254e1d507b03439c3668ac';
    final result = await http.Client().get(url);
    if(result.statusCode != 200){
      print('error');
      throw Exception();
    }
    final jsonDecode = json.decode(result.body);
    final weatherJson = jsonDecode['main'];

    return WeatherModel.fromJson(weatherJson);
  }
}