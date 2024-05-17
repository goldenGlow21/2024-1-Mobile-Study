import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'service.dart';
import 'model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String apikey = "8d07692881fc60aba98e0fd0163838ad";
String cityName = "kor";
String apiCall = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey";
final dio = Dio();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String weatherInfo =
      "기온 : No Data~\n"
      "습도 : No Data~\n"
      "기압 : No Data~\n"
      "풍속 : No Data~";

  void getWeatherInfo() async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    Model model = await WeatherService(dio).getWeather(cityName, apikey);
    try {
      setState(() {
        weatherInfo =
            "기온 : ${model.main.temp} \n"
            "습도 : ${model.main.humidity} \n"
            "기압 : ${model.main.pressure} \n"
            "풍속 : ${model.wind.speed}";
      });
    } catch (e) {
      setState(() {
        weatherInfo = "No Data~";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GDSC 모바일 스터디"),
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: getWeatherInfo,
                child: const Text("날씨 API 받기!!"),
              ),
              //SizedBox(height: 20),
              Text(weatherInfo),
            ],
          ),
        ),
      ),
    );
  }
}