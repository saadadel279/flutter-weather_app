import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/Models/Weatheer_model.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '5fd3ed98f7bd42549d504919231604';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3");
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather =WeatherModel.fromjson(data);

    return weather;
}
}