import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weather_provider.dart';

import 'Screens/Home_page.dart';

void main(List<String> args) {
  runApp( ChangeNotifierProvider(create: (BuildContext context) { 
    return WeatherProvider();

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
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData==null? Colors.blue :Provider.of<WeatherProvider>(context).weatherData!.getTheamColor()
      ),
      
      home: const HomePage(),
      
    );
  }
}
