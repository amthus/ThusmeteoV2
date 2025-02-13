// // Code de WeatherScreen 

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:math';
// import 'weather_details.dart';
// import 'package:thusmeteo_v2/app/modules/home/models/weather_data.dart';
// import 'forecast.dart'; 


// class WeatherScreen extends StatelessWidget {
//   final WeatherData weatherData;


//   WeatherScreen(
//       {
//         required this.weatherData,
//       }
//       );

//   Color _generateRandomPastelColor() {
//     final random = Random();
//     final baseColor = Color.fromRGBO(
//       255,
//       166 + random.nextInt(30),
//       158 + random.nextInt(40),
//       1,
//     );
//     return baseColor;
//   }

//   Color _getRandomPastelColor() {
//     final Random random = Random();
//     final int r = 200 + random.nextInt(56);
//     final int g = 200 + random.nextInt(56);
//     final int b = 200 + random.nextInt(56);
//     return Color.fromARGB(255, r, g, b);
//   }

//   Color _getRandomDarkPastelColor() {
//     final Random random = Random();
//     final int r = random.nextInt(128);
//     final int g = random.nextInt(128);
//     final int b = random.nextInt(128);
//     return Color.fromARGB(255, r, g, b);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final overlayColor = _generateRandomPastelColor();
//     final overlayColor = _getRandomDarkPastelColor();

//     return Stack(
//       children: [
//         // Background Image
//         Image.network(
//           weatherData.cityImgUrl!,
//           fit: BoxFit.cover,
//           height: double.infinity,
//           width: double.infinity,
//         ),
//         // Color Overlay
//         Container(
//           color: overlayColor.withOpacity(0.9),
//         ),
//         // Content
//         Column(
//           children: [
//             _buildMainInfo(),
//             WeatherDetails(
//               pressure: weatherData.pressure.toString(),
//               windSpeed: weatherData.windSpeed.toString(),
//               humidity: weatherData.humidity.toString(),
//             ),
//             // HourlyForecast(),
//           ],
//         ).paddingOnly(bottom: 128),
//       ],
//     );
//   }

//   Widget _buildMainInfo() {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             weatherData.cityName,
//             style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             weatherData.temperature.toString() + '°C',
//             style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.w200),
//           ),
//           Text(
//             weatherData.description,
//             style: TextStyle(fontSize: 20, color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'weather_details.dart';
import 'package:thusmeteo_v2/app/modules/home/models/weather_data.dart';
import 'package:thusmeteo_v2/app/modules/home/models/forecast.dart';
import 'package:intl/intl.dart';  // Importation du package intl pour formater les dates

class WeatherScreen extends StatelessWidget {
  final WeatherData weatherData;

  // Constructeur pour accepter les données météorologiques
  WeatherScreen({required this.weatherData});

  // Méthodes pour générer des couleurs aléatoires
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
    final overlayColor = _getRandomDarkPastelColor();

    return Stack(
      children: [
        // Image de fond
        Image.network(
          weatherData.cityImgUrl!,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        // Overlay de couleur
        Container(
          color: overlayColor.withOpacity(0.9),
        ),
        // Contenu principal
        Column(
          children: [
            _buildMainInfo(),
            WeatherDetails(
              pressure: weatherData.pressure.toString(),
              windSpeed: weatherData.windSpeed.toString(),
              humidity: weatherData.humidity.toString(),
            ),
            _buildForecasts(), // Afficher les prévisions ici
          ],
        ).paddingOnly(bottom: 128),
      ],
    );
  }

  // Afficher les informations principales comme la température, description...
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

  // Afficher les prévisions
  Widget _buildForecasts() {
    // Vérifier si les prévisions existent
    if (weatherData.forecasts != null && weatherData.forecasts!.isNotEmpty) {
      // Liste des prévisions sous forme de widgets
      return Expanded(
        child: ListView.builder(
          itemCount: weatherData.forecasts!.length,
          itemBuilder: (context, index) {
            final forecast = weatherData.forecasts![index];
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

  // Construire chaque élément de prévision
  Widget _buildForecastItem(Forecast forecast) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(
          DateFormat('MMMM d, y').format(forecast.date),  // Formater et afficher la date
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${forecast.temperature}°C - ${forecast.description}',
          style: TextStyle(fontSize: 16),
        ),
        leading: Icon(Icons.cloud),  // Remplacer par une icône de prévision si nécessaire
      ),
    );
  }
}
