import 'model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'service.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET('/weather?q={cityName}&appid={apiKey}')
  Future<Model> getWeather(
    @Path() String cityName,
    @Path() String apiKey,
  );
}