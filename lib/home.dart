// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/network/network.dart';
import 'package:weather_app/ui/bottom_view.dart';
import 'package:weather_app/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  final String title;
  const WeatherForecast({Key? key, required this.title}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "New York";
  @override
  void initState() {
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder:
                  ((context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      midView(snapshot),
                      bottomView(snapshot, context)
                    ],
                  );
                } else {
                  return Container(
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter City Name',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(
              FontAwesomeIcons.locationPin,
              color: Colors.red,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
          onChanged: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({required String cityName}) =>
      Network().getWeatherForecast(cityName: _cityName);
}
