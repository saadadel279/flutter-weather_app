import 'package:flutter/material.dart';
import 'package:weatherapp/Models/Weatheer_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherData;
  String? cityName;

  set weatherData(WeatherModel? weather){
    _weatherData=weather;
    notifyListeners();
  }

  WeatherModel? get weatherData =>_weatherData;

  
}