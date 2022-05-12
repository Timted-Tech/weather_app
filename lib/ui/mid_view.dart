import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/util/convert_icon.dart';

import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data!.list;
  var city = snapshot.data!.city!.name;
  var country = snapshot.data!.city!.country;
  var formattedDate =
      DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
  var forecast = forecastList[0];
  Container midView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            '$city,$country',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWeatherIcon(
            forecastList[0].weather![0].main.toString(),
            Colors.pinkAccent,
            198,
          ),
        ),
        // const Icon(
        //   FontAwesomeIcons.cloud,
        //   size: 198,
        //   color: Colors.pinkAccent,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                forecast.temp!.day!.toStringAsFixed(0) + ' °F',
                style: const TextStyle(fontSize: 34),
              ),
              Text(
                forecast.weather![0].description!.toUpperCase(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      forecast.speed!.toStringAsFixed(1) + 'mi/h',
                    ),
                    const Icon(
                      FontAwesomeIcons.wind,
                      size: 20,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(forecast.humidity!.toStringAsFixed(0) + '%'),
                    const Icon(
                      FontAwesomeIcons.solidFaceGrinBeamSweat,
                      size: 20,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(forecast.temp!.max!.toStringAsFixed(0) + '°F'),
                    const Icon(
                      FontAwesomeIcons.temperatureHigh,
                      size: 20,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  return midView;
}
