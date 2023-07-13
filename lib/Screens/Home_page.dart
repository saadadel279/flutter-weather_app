import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weather_provider.dart';

import 'Search_page.dart';

class HomePage extends StatelessWidget {

   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic weatherData=Provider.of<WeatherProvider>(context).weatherData;
    
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
      body:weatherData==null ?Center(
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
      ):
      
       Container( 

       decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            weatherData!.getTheamColor(),
             weatherData!.getTheamColor()[300],
             weatherData!.getTheamColor()[100],

          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          )
       ),
        
        child: Column(
      
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Spacer(
            flex: 2,
          ),
         Text(
          Provider.of<WeatherProvider>(context).cityName?? " No city entered ",
        style: const TextStyle(fontSize: 30 ,
        fontWeight: FontWeight.bold)
        ),
           Text("updated at: ${weatherData!.date}",
        style: const TextStyle(fontSize: 18),
        ),
        const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
            Image.asset(weatherData!.getImage()),
             Text('${weatherData!.temp.toInt()}', style: const TextStyle(fontSize: 30
             ),
            ),
            Column(children:  [
               Text("Max:${weatherData!.maxTemp.toInt()}",
        style: const TextStyle(fontSize: 13 ,
        )
        ),
          Text("Min:${weatherData!.minTemp.toInt()}",
        style: const TextStyle(fontSize: 13),
        ),
            ],)

          ],),
          const Spacer(),
             Text(weatherData!.weatherStateName,
        style: const TextStyle(fontSize: 30,
          fontWeight: FontWeight.bold),
        ),
        const Spacer(
          flex: 5,
        )

        
      

      ]),
      ) ,
    );
  }
}
