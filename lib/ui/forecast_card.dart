import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/util/convert_icon.dart';

import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data!.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getFormattedDate(date);
  var forecast = forecastList[index];
  dayOfWeek = fullDate.split(',')[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
              forecastList[index].weather![0].main.toString(),
              Colors.pinkAccent,
              70,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  'Win:' + forecast.speed!.toStringAsFixed(1) + 'mi/h',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child:
                    Text('Hum:' + forecast.humidity!.toStringAsFixed(0) + '%'),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(forecast.temp!.max!.toStringAsFixed(0) + '°F'),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
