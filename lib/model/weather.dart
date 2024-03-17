// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weather_app/model/weather_hourly_temperature.dart';

class Weather {
  String location;
  TimeOfDay currentTime;
  double latitude;
  double longitude;
  String skyDescription;
  int temperature;
  String weatherDescription;
  int humidity;
  double pm10level;
  double uvLevel;
  int windSpeed;
  TimeOfDay sunriseTime;
  TimeOfDay sunsetTime;
  double maxTemperature;
  double minTemperature;
  String backgroundImageUrl;
  String weatherIconURL;
  List<HourlyTemperature> hourlyTemperature;
  Weather({
    required this.location,
    required this.currentTime,
    required this.latitude,
    required this.longitude,
    required this.skyDescription,
    required this.temperature,
    required this.weatherDescription,
    required this.humidity,
    required this.pm10level,
    required this.uvLevel,
    required this.windSpeed,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.maxTemperature,
    required this.minTemperature,
    required this.weatherIconURL,
    required this.backgroundImageUrl,
    required this.hourlyTemperature,
  });
}
