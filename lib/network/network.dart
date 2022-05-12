import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/model/weather_forecast_model.dart';

import '../util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast(
      {required String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=" +
        cityName +
        "&units=metric&appid=" +
        Util.appId +
        "";

    final response = await get(Uri.parse(finalUrl));

    debugPrint('URL: ${Uri.parse(finalUrl)}');

    if (response.statusCode == 200) {
      debugPrint('weather data: ${response.body}');
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting weather forecast');
    }
  }
}
