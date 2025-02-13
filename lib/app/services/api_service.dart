// Code de l'API Service 

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thusmeteo_v2/app/modules/home/models/weather_data.dart';

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

    // Récupère les prévisions météorologiques pour plusieurs jours
  static Future<WeatherData> getForecastData(String city) async {
    final url = '$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);  // Pour vérifier la réponse brute

        // Vérifie si les données nécessaires existent avant de les utiliser
        if (jsonData['city'] != null && jsonData['list'] != null) {
          return WeatherData.fromJson(jsonData);
        } else {
          throw Exception('Missing city or forecast data in response');
        }
      } else {
        throw Exception('Failed to load forecast data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load forecast data: $e');
    }
  }
}


// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:thusmeteo_v2/app/modules/home/models/weather_data.dart';

// class ApiService {
//   static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';
//   static const String _apiKey = 'b4c2d842c4b81b8d6922cd0d702c09e8';

//   // Récupère la météo actuelle
//   static Future<WeatherData> getWeatherData(String city) async {
//     final url = '$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         print(jsonData);  // Pour vérifier la réponse brute

//         // Vérifie si 'name' et d'autres clés existent avant de les utiliser
//         if (jsonData['name'] != null) {
//           return WeatherData.fromJson(jsonData);
//         } else {
//           throw Exception('City name not found in response');
//         }
//       } else {
//         throw Exception('Failed to load weather data. Status Code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load weather data: $e');
//     }
//   }

//   // Récupère les prévisions météorologiques pour plusieurs jours
//   static Future<WeatherData> getForecastData(String city) async {
//     final url = '$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         print(jsonData);  // Pour vérifier la réponse brute

//         // Vérifie si les données nécessaires existent avant de les utiliser
//         if (jsonData['city'] != null && jsonData['list'] != null) {
//           return WeatherData.fromJson(jsonData);
//         } else {
//           throw Exception('Missing city or forecast data in response');
//         }
//       } else {
//         throw Exception('Failed to load forecast data. Status Code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load forecast data: $e');
//     }
//   }
// }

