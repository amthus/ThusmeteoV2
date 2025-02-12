// Code de l'API Service 

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ThusmeteoV2/app/modules/home/models/weather_data.dart';

class ApiService {
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String _apiKey = '5c49135b8258e6439153ab34eeb72d1e';

  static Future<WeatherData> getWeatherData(String city) async {
    final url = '$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData.toString());
        return WeatherData.fromJson(jsonData);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
