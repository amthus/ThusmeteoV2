// Code de WeatherScreen 

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'weather_details.dart';
import 'package:ThusmeteoV2/app/modules/home/models/weather_data.dart';


class WeatherScreen extends StatelessWidget {
  final WeatherData weatherData;


  WeatherScreen(
      {
        required this.weatherData,
      }
      );

  Color _generateRandomPastelColor() {
    final random = Random();
    final baseColor = Color.fromRGBO(
      255,
      166 + random.nextInt(30),
      158 + random.nextInt(40),
      1,
    );
    return baseColor;
  }

  Color _getRandomPastelColor() {
    final Random random = Random();
    final int r = 200 + random.nextInt(56);
    final int g = 200 + random.nextInt(56);
    final int b = 200 + random.nextInt(56);
    return Color.fromARGB(255, r, g, b);
  }

  Color _getRandomDarkPastelColor() {
    final Random random = Random();
    final int r = random.nextInt(128);
    final int g = random.nextInt(128);
    final int b = random.nextInt(128);
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    // final overlayColor = _generateRandomPastelColor();
    final overlayColor = _getRandomDarkPastelColor();

    return Stack(
      children: [
        // Background Image
        Image.network(
          weatherData.cityImgUrl!,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        // Color Overlay
        Container(
          color: overlayColor.withOpacity(0.9),
        ),
        // Content
        Column(
          children: [
            _buildMainInfo(),
            WeatherDetails(
              pressure: weatherData.pressure.toString(),
              windSpeed: weatherData.windSpeed.toString(),
              humidity: weatherData.humidity.toString(),
            ),
            // HourlyForecast(),
          ],
        ).paddingOnly(bottom: 128),
      ],
    );
  }

  Widget _buildMainInfo() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherData.cityName,
            style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            weatherData.temperature.toString() + '°C',
            style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.w200),
          ),
          Text(
            weatherData.description,
            style: TextStyle(fontSize: 20, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}