// // Code de WeatherScreen 


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';  // Pour formater les dates
import 'package:thusmeteo_v2/app/modules/home/models/weather_data.dart';
import 'package:thusmeteo_v2/app/modules/home/models/forecast.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherData weatherData;

  WeatherScreen({required this.weatherData});

  Color _getRandomDarkPastelColor() {
    final Random random = Random();
    final int r = random.nextInt(128);
    final int g = random.nextInt(128);
    final int b = random.nextInt(128);
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    final overlayColor = _getRandomDarkPastelColor();

    return Stack(
      children: [
        Image.network(
          weatherData.cityImgUrl!,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          color: overlayColor.withOpacity(0.9),
        ),
        Column(
          children: [
            _buildMainInfo(),
            WeatherDetails(
              pressure: weatherData.pressure.toString(),
              windSpeed: weatherData.windSpeed.toString(),
              humidity: weatherData.humidity.toString(),
            ),
            _buildForecasts(),
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
            '${weatherData.temperature}°C',
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

  Widget _buildForecasts() {
    if (weatherData.forecast.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          itemCount: weatherData.forecast.length,
          itemBuilder: (context, index) {
            final forecast = weatherData.forecast[index];
            return _buildForecastItem(forecast);
          },
        ),
      );
    } else {
      return Center(
        child: Text(
          'No forecasts available',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }
  }

  Widget _buildForecastItem(Forecast forecast) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(
          DateFormat('MMMM d, y').format(forecast.date),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${forecast.temperature}°C - ${forecast.description}',
          style: TextStyle(fontSize: 16),
        ),
        leading: Icon(Icons.cloud),
      ),
    );
  }
}