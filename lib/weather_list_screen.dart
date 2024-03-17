import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/weather_mock_data.dart';
import 'package:weather_app/weather_detail_screen.dart';
import 'package:intl/intl.dart';

class WeatherListScreen extends StatelessWidget {
  static String screenName = '/WeatherListScreen';
  static List<Weather> mockData = WeatherMockData.getWeatherList();
  const WeatherListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 36, 16, 36),
          child: Column(
            children: List.generate(mockData.length, (index) {
              return _buildListTile(context, mockData[index]);
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, Weather mockData) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, WeatherDetailScreen.screenName,
          arguments: mockData),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: AssetImage(mockData.backgroundImageUrl),
                opacity: 0.9,
                fit: BoxFit.fitWidth)),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mockData.location,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatTimeOfDay(mockData.currentTime),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      mockData.skyDescription,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  mockData.weatherIconURL,
                  height: 48,
                  width: 48,
                ),
                Text(
                  '${mockData.temperature.toString()}°C',
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); // Use 'h:mm a' for AM/PM format.
    return format.format(dt);
  }
}
