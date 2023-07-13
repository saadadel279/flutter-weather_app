
import 'package:flutter/material.dart';

class WeatherModel{
   String? date;
   double? temp;
   double? maxTemp;
   double? minTemp;
   String? weatherStateName;


     // constructor  مش لازم المتغيرات تكوت nullable
     // علشان انا بخليها required 
     //فمضمون انها تكون موجودة

     
  WeatherModel({required this.date,required this.temp,required this.maxTemp,required this.minTemp,required this.weatherStateName});


      // Named constructor  لازم المتغيرات تكوت nullable
      // علشان انا اللي بديها القيمة بايدي
      // فممكن مترجعش


  // WeatherModel.fromjson(dynamic data){
  //   var jsonData=data['forecast']['forecastday'][0];
  //   date: data['location']['localtime'];
  //   temp: jsonData['avgtemp_c'];
  //   maxTemp: jsonData['maxtemp_f']; 
  //   minTemp:jsonData['mintemp_c']; 
  //   weatherStateName: jsonData['condition']['text'];
  // }


// Factory constructor
// هنا دمجت بين الاتنين 
//وهنا بيرجع opject من نفس الكونستراكتر العادي 
// فمضمون ان في بيانات راجعة 
//فمش لازم المتغيرات تكون nullable
  factory WeatherModel.fromjson(dynamic data){
    var jsonData=data['forecast']['forecastday'][0]['day'];
return WeatherModel(
  date: data['location']['localtime'],
  temp: jsonData['avgtemp_c'], 
  maxTemp: jsonData['maxtemp_f'],
  minTemp: jsonData['mintemp_c'],
  weatherStateName: jsonData['condition']['text']);

  }

  String getImage(){
    if(weatherStateName=="Clear"||weatherStateName=="Light Clear"){
      return "assets/images/clear.png";
    }else if(weatherStateName=="Sleet"||weatherStateName=="Hail"||weatherStateName=="Snow"){
      return "assets/images/snow.png";
    }else if(weatherStateName=="Heavy Cloud"){
      return "assets/images/cloudy.png";
    }else if(weatherStateName=="Light Rain"||weatherStateName=="Rainy"||weatherStateName=="Heavy Rain"||weatherStateName=="Showers"){
      return "assets/images/rainy.png";
    }else if(weatherStateName=="Thunder"||weatherStateName=="Thunderstom"){
      return "assets/images/thunderstorm.png";
    }else {
       return "assets/images/clear.png";
    }
   
  }

   MaterialColor getTheamColor(){
    if(weatherStateName=="Clear"||weatherStateName=="Light Clear"){
      return Colors.orange;
    }else if(weatherStateName=="Sleet"||weatherStateName=="Hail"||weatherStateName=="Snow"){
      return Colors.blue;
    }else if(weatherStateName=="Heavy Cloud"){
      return Colors.blueGrey ;
    }else if(weatherStateName=="Light Rain"||weatherStateName=="Rainy"||weatherStateName=="Heavy Rain"||weatherStateName=="Showers"){
      return Colors.blue ;
    }else if(weatherStateName=="Thunder"||weatherStateName=="Thunderstom"){
      return Colors.cyan;
    }else {
       return Colors.amber;
    }
   
  }

  @override
  // بتستدعى لوحدها لما اجي اطبع الكونستراكتر
  String toString() {
    // TODO: implement toString
    return 'date=$date temp=$temp maxTemp=$maxTemp minTemp=$minTemp weatherStateName=$weatherStateName ';
  }
}