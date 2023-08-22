import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Services/Weather_Services.dart';
import 'package:weatherapp/cubits/weather_cubit/weather_cubit.dart';

import 'Screens/Home_page.dart';

void main(List<String> args) {
  runApp(BlocProvider(
      create: (BuildContext context) {
        return WeatherCubit(WeatherServices());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel==null? Colors.blue :BlocProvider.of<WeatherCubit>(context).weatherModel!.getTheamColor()
          ),
      home:  HomePage(),
    );
  }
}
