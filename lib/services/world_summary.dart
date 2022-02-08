import 'package:flutter/material.dart';
import 'package:wetter_app/services/color_selector.dart';
import 'package:wetter_app/services/world_weather.dart';
import 'package:wetter_app/services/world_time.dart';

class WorldSummary {
  String location;
  String url;
  String lan;
  String name;

  late String locationName;
  late String temp;
  late String time;
  late String main;
  late String description;
  late String lon;
  late String lat;
  late String icon;
  late String wind;
  late String hum;
  late LinearGradient dynamicGradient;
  late Color dynamicColor;
  late Color dynamicBorderColor;
  late bool negativeTemp;

  WorldSummary({required this.location, required this.url, required this.lan, required this.name});

  Future<void> getWorldSummary() async {
    WorldTime timeInstance = WorldTime(url: url);
    WorldWeather weatherInstance = WorldWeather(location: location, lan: lan);

    await timeInstance.getTime();

    await weatherInstance.getWeather();

    locationName = weatherInstance.locationName;
    temp = weatherInstance.temp;


    time = timeInstance.time;

    main = weatherInstance.main;
    description = weatherInstance.description;
    icon = weatherInstance.icon;
    lon = weatherInstance.lon.toString();
    lat = weatherInstance.lat.toString();
    wind = weatherInstance.wind;
    hum = weatherInstance.hum;
    negativeTemp = weatherInstance.negativeTemp;

    dynamicGradient = getGradient(icon);
    dynamicColor = getColor(icon);
    dynamicBorderColor = getBorderColor(icon);











  }

}