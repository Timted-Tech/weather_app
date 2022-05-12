import 'package:flutter/material.dart';

import '../model/weather_forecast_model.dart';
import 'forecast_card.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data!.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '7-Days weather Forecast'.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      Container(
        height: 170,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 160,
                  child: forecastCard(snapshot, index),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff9661c3),
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              )),
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
          itemCount: forecastList!.length,
        ),
      ),
    ],
  );
}
