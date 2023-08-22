import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Models/Weatheer_model.dart';
import 'package:weatherapp/cubits/weather_cubit/weather_state.dart';

import '../cubits/weather_cubit/weather_cubit.dart';
import 'Search_page.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text("Weather App"),
      ),

      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
             weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return  SuccessBody(weatherData: weatherData,);
          } else if (state is WeatherFailuer) {
            return const FailureBody();
          } else {
            return const DefultBody();
          }
        },
      ),
      // body:true ?
      // :

      //
    );
  }
}

class FailureBody extends StatelessWidget {
  const FailureBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something went wrong please try again',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}

class DefultBody extends StatelessWidget {
  const DefultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Ther is No Location 😞",
            style: TextStyle(fontSize: 22),
          ),
          Text("Start Searching now 🔍", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
   const SuccessBody({
    super.key,
    this.weatherData
    
  });
final WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData!.getTheamColor(),
          weatherData!.getTheamColor()[300]!,
          weatherData!.getTheamColor()[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(
          flex: 2,
        ),
        Text(
            BlocProvider.of<WeatherCubit>(context).cityName ??
                " No city entered ",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
         Text(
          "updated at:${weatherData!.date}",
          style: const TextStyle(fontSize: 18),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(weatherData!.getImage()),
            const Text(
              '',
              style: TextStyle(fontSize: 30),
            ),
            Column(
              children:  [
                Text("Max: ${weatherData!.maxTemp}",
                    style: const TextStyle(
                      fontSize: 13,
                    )),
                Text(
                  "Min: ${weatherData!.minTemp}",
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
         Text(
          "${weatherData!.weatherStateName}",
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(
          flex: 5,
        )
      ]),
    );
  }
}
