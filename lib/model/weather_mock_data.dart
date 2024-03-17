import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/weather_hourly_temperature.dart';

class WeatherMockData {
  static List<Weather> getWeatherList() {
    return [
      Weather(
          location: 'Hồ Chí Minh City',
          currentTime: const TimeOfDay(hour: 9, minute: 41),
          latitude: 10.82,
          longitude: 206.24,
          skyDescription: 'Soft light',
          temperature: 32,
          weatherDescription: 'Duststorm, sandstorm, drifting or blowing snow',
          humidity: 40,
          pm10level: 33.4,
          uvLevel: 2.2,
          windSpeed: 2,
          backgroundImageUrl: 'assets/images/bg_light.png',
          sunriseTime: const TimeOfDay(hour: 6, minute: 35),
          sunsetTime: const TimeOfDay(hour: 17, minute: 55),
          maxTemperature: 36.4,
          minTemperature: 22.1,
          weatherIconURL: 'assets/icons/daycloudylightning.svg',
          hourlyTemperature: List.generate(24, (index) {
            return HourlyTemperature(
                hour: index,
                iconUrl: (index < 5 || index > 18)
                    ? 'assets/icons/nightIcon.svg'
                    : 'assets/icons/dayIcon.svg',
                temperature: (index < 6)
                    ? (30 - index)
                    : (index < 13)
                        ? (20 + index)
                        : (45 - index));
          })),
      Weather(
          location: 'Ha Noi City',
          currentTime: const TimeOfDay(hour: 9, minute: 41),
          latitude: 21.02,
          longitude: 105.80,
          skyDescription: 'Sunny thunderstorm',
          temperature: 26,
          weatherDescription: 'Duststorm, sandstorm, drifting or blowing snow',
          humidity: 40,
          pm10level: 33.4,
          uvLevel: 2.2,
          windSpeed: 2,
          backgroundImageUrl: 'assets/images/bg_light.png',
          sunriseTime: const TimeOfDay(hour: 6, minute: 35),
          sunsetTime: const TimeOfDay(hour: 17, minute: 55),
          maxTemperature: 36.4,
          minTemperature: 22.1,
          weatherIconURL: 'assets/icons/daycloudylightning.svg',
          hourlyTemperature: List.generate(24, (index) {
            return HourlyTemperature(
                hour: index,
                iconUrl: (index < 5 || index > 18)
                    ? 'assets/icons/nightIcon.svg'
                    : 'assets/icons/dayIcon.svg',
                temperature: (index < 6)
                    ? (30 - index)
                    : (index < 13)
                        ? (20 + index)
                        : (45 - index));
          })),
      Weather(
          location: 'New York',
          currentTime: const TimeOfDay(hour: 21, minute: 41),
          latitude: 21.02,
          longitude: 105.80,
          skyDescription: 'Peacful Night',
          temperature: 12,
          weatherDescription: 'Duststorm, sandstorm, drifting or blowing snow',
          humidity: 40,
          pm10level: 33.4,
          uvLevel: 2.2,
          windSpeed: 2,
          backgroundImageUrl: 'assets/images/bg_night.png',
          sunriseTime: const TimeOfDay(hour: 6, minute: 35),
          sunsetTime: const TimeOfDay(hour: 17, minute: 55),
          maxTemperature: 36.4,
          minTemperature: 22.1,
          weatherIconURL: 'assets/icons/nightcloudysnowing.svg',
          hourlyTemperature: List.generate(24, (index) {
            return HourlyTemperature(
                hour: index,
                iconUrl: (index < 5 || index > 18)
                    ? 'assets/icons/nightIcon.svg'
                    : 'assets/icons/dayIcon.svg',
                temperature: (index < 6)
                    ? (30 - index)
                    : (index < 13)
                        ? (20 + index)
                        : (45 - index));
          })),
      Weather(
          location: 'London',
          currentTime: const TimeOfDay(hour: 2, minute: 41),
          latitude: 21.02,
          longitude: 105.80,
          skyDescription: 'Peacful Night',
          temperature: 6,
          weatherDescription: 'Duststorm, sandstorm, drifting or blowing snow',
          humidity: 40,
          pm10level: 33.4,
          uvLevel: 2.2,
          windSpeed: 2,
          backgroundImageUrl: 'assets/images/bg_night.png',
          sunriseTime: const TimeOfDay(hour: 6, minute: 35),
          sunsetTime: const TimeOfDay(hour: 17, minute: 55),
          maxTemperature: 36.4,
          minTemperature: 22.1,
          weatherIconURL: 'assets/icons/nightcloudysnowing.svg',
          hourlyTemperature: List.generate(24, (index) {
            return HourlyTemperature(
                hour: index,
                iconUrl: (index < 5 || index > 18)
                    ? 'assets/icons/nightIcon.svg'
                    : 'assets/icons/dayIcon.svg',
                temperature: (index < 6)
                    ? (30 - index)
                    : (index < 13)
                        ? (20 + index)
                        : (45 - index));
          })),
      Weather(
          location: 'Seoul',
          currentTime: const TimeOfDay(hour: 11, minute: 41),
          latitude: 21.02,
          longitude: 105.80,
          skyDescription: 'Sunny thunderstorm',
          temperature: 21,
          weatherDescription: 'Duststorm, sandstorm, drifting or blowing snow',
          humidity: 40,
          pm10level: 33.4,
          uvLevel: 2.2,
          windSpeed: 2,
          backgroundImageUrl: 'assets/images/bg_light.png',
          sunriseTime: const TimeOfDay(hour: 6, minute: 35),
          sunsetTime: const TimeOfDay(hour: 17, minute: 55),
          maxTemperature: 36.4,
          minTemperature: 22.1,
          weatherIconURL: 'assets/icons/daycloudylightning.svg',
          hourlyTemperature: List.generate(24, (index) {
            return HourlyTemperature(
                hour: index,
                iconUrl: (index < 5 || index > 18)
                    ? 'assets/icons/nightIcon.svg'
                    : 'assets/icons/dayIcon.svg',
                temperature: (index < 6)
                    ? (30 - index)
                    : (index < 13)
                        ? (20 + index)
                        : (45 - index));
          })),
      Weather(
          location: 'Paris',
          currentTime: const TimeOfDay(hour: 3, minute: 41),
          latitude: 21.02,
          longitude: 105.80,
          skyDescription: 'Peacful Night',
          temperature: 7,
          weatherDescription: 'Duststorm, sandstorm, drifting or blowing snow',
          humidity: 40,
          pm10level: 33.4,
          uvLevel: 2.2,
          windSpeed: 2,
          backgroundImageUrl: 'assets/images/bg_night.png',
          sunriseTime: const TimeOfDay(hour: 6, minute: 35),
          sunsetTime: const TimeOfDay(hour: 17, minute: 55),
          maxTemperature: 36.4,
          minTemperature: 22.1,
          weatherIconURL: 'assets/icons/nightcloudysnowing.svg',
          hourlyTemperature: List.generate(24, (index) {
            return HourlyTemperature(
                hour: index,
                iconUrl: (index < 5 || index > 18)
                    ? 'assets/icons/nightIcon.svg'
                    : 'assets/icons/dayIcon.svg',
                temperature: (index < 6)
                    ? (30 - index)
                    : (index < 13)
                        ? (20 + index)
                        : (45 - index));
          })),
    ];
  }
}
