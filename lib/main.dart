import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherForecast(
        title: 'Forecast',
      ),
    ),
  );
}
