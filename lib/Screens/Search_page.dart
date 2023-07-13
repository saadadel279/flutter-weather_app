import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/Weatheer_model.dart';
import 'package:weatherapp/Providers/weather_provider.dart';

import '../Services/Weather_Services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices services = WeatherServices();
             WeatherModel weather
             = await services.getWeather(cityName: cityName!);
                
                Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;
                Navigator.pop(context);
        
            },
            decoration:  const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              hintText: "Enter City Name",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              labelText: "Search",
            ),
          ),
        ),
      ),
    );
  }
}
