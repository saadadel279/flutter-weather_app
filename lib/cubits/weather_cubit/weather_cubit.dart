import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/Weatheer_model.dart';
import 'package:weatherapp/Services/Weather_Services.dart';
import 'package:weatherapp/cubits/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(this.weatherServices): super(WeatherInitial());

  WeatherServices weatherServices;
  WeatherModel? weatherModel;
  String? cityName;

 void getWeather ({required String cityName})async{
    emit(WeatherLoading());
   try {
  weatherModel= await weatherServices.getWeather(cityName: cityName);
  emit(WeatherSuccess());
} on Exception {
  emit(WeatherFailuer());
}


  }
}