import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
    try {
      Response response = await dio.get(apiCall);
      setState(() {
        weatherInfo =
            "기온 : ${response.data['main']['temp']} \n"
            "습도 : ${response.data['main']['humidity']} \n"
            "기압 : ${response.data['main']['pressure']} \n"
            "풍속 : ${response.data['wind']['speed']}";
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