import 'package:flutter/material.dart';
import 'package:weather_app/weather_detail_screen.dart';
import 'package:weather_app/weather_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        WeatherListScreen.screenName: (context) => WeatherDetailScreen(),
        WeatherDetailScreen.screenName: (context) => WeatherDetailScreen()
      },
      home: const WeatherListScreen(),
    );
  }
}
