import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/weather.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_hourly_temperature.dart';

class WeatherDetailScreen extends StatelessWidget {
  static String screenName = '/WeatherDetailScreen';
  WeatherDetailScreen({super.key});

  final mySizedBox = const SizedBox(
    height: 12,
  );
  late Weather weatherData;
  @override
  Widget build(BuildContext context) {
    try {
      weatherData = ModalRoute.of(context)!.settings.arguments as Weather;
    } catch (e) {
      print(e.toString());
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_light.png'),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: mainBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> mainBody() {
    List<Widget> widgets = [];
    widgets.add(mySizedBox);
    widgets.add(optionBarSection(
        latitude: weatherData.latitude, longitude: weatherData.longitude));
    widgets.add(mySizedBox);
    widgets.addAll(generalWeatherSection(
        location: weatherData.location,
        weatherIconUrl: weatherData.weatherIconURL,
        skyDescription: weatherData.skyDescription,
        temperature: weatherData.temperature,
        weatherDescription: weatherData.weatherDescription));
    widgets.add(mySizedBox);
    widgets.add(detailWeatherSection(
        humidity: weatherData.humidity,
        pm10Level: weatherData.pm10level,
        uvLevel: weatherData.uvLevel,
        windSpeed: weatherData.windSpeed,
        sunriseTime: weatherData.sunriseTime,
        sunsetTime: weatherData.sunsetTime));
    widgets.add(mySizedBox);
    widgets.add(forecastSection(
        maxTemperature: weatherData.maxTemperature,
        minTemperature: weatherData.minTemperature,
        hourlyTemperature: weatherData.hourlyTemperature));

    return widgets;
  }

  Padding optionBarSection(
      {required double latitude, required double longitude}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          width: 24,
        ),
        Text(
          '$latitude, $longitude',
          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),
        ),
        const Icon(
          Icons.menu,
          color: Colors.white,
        )
      ]),
    );
  }

  List<Widget> generalWeatherSection(
      {required String location,
      required String weatherIconUrl,
      required String skyDescription,
      required int temperature,
      required String weatherDescription}) {
    return [
      Text(
        location,
        style: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      mySizedBox,
      SvgPicture.asset(
        weatherIconUrl,
        height: 115,
        width: 115,
      ),
      mySizedBox,
      Text(
        skyDescription,
        style: TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.7)),
      ),
      mySizedBox,
      Text(
        '$temperature°C',
        style: const TextStyle(
            fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      mySizedBox,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Text(
          weatherDescription,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
        ),
      )
    ];
  }

  Widget detailWeatherSection({
    required int humidity,
    required double pm10Level,
    required double uvLevel,
    required int windSpeed,
    required TimeOfDay sunriseTime,
    required TimeOfDay sunsetTime,
  }) {
    const detailSizedBox = SizedBox(
      height: 20,
    );

    const textStyle = TextStyle(color: Colors.white, fontSize: 20);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Humidity: $humidity%',
                style: textStyle,
              ),
              detailSizedBox,
              Text(
                'PM10 $pm10Levelμg/m3',
                style: textStyle,
              ),
              detailSizedBox,
              Text(
                'UV $uvLevel',
                style: textStyle,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Wind ${windSpeed}km/h',
                style: textStyle,
              ),
              detailSizedBox,
              Text(
                'Sunrise ${formatTimeOfDay(sunriseTime)}',
                style: textStyle,
              ),
              detailSizedBox,
              Text(
                'Sunset ${formatTimeOfDay(sunsetTime)}',
                style: textStyle,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget forecastSection(
      {required double maxTemperature,
      required double minTemperature,
      required List<HourlyTemperature> hourlyTemperature}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.3)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/sunny.svg',
                width: 17,
                height: 17,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Forecast',
                style: TextStyle(
                    fontSize: 16, color: Colors.white.withOpacity(0.6)),
              )
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Max: $maxTemperature°C',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Min: $minTemperature°C',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: weatherPerHour(hourlyTemperature: hourlyTemperature),
            ),
          )
        ],
      ),
    );
  }

  Widget weatherPerHour({required List<HourlyTemperature> hourlyTemperature}) {
    return Row(
      children: List.generate(hourlyTemperature.length, (index) {
        var info = hourlyTemperature[index];
        String hour =
            "${(index == 0) ? 0 : (index == 12) ? 12 : index % 12} ${index < 12 ? 'AM' : 'PM'}";
        return Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Text(
              hour,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SvgPicture.asset(
              info.iconUrl,
              height: 24,
              width: 24,
            ),
            Text(
              '${info.temperature}°C',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ]),
        );
      }),
    );
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); // Use 'h:mm a' for AM/PM format.
    return format.format(dt);
  }
}
