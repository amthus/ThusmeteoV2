// import 'package:flutter/material.dart';
// import 'package:thusmeteo_v2/app/modules/home/models/weather_data.dart';
// import 'package:thusmeteo_v2/app/modules/home/models/forecast.dart';  // Import Forecast
// import 'package:get/get.dart';

// class ForecastScreen extends StatelessWidget {
//   final List<Forecast> forecastData;

//   ForecastScreen({
//     required this.forecastData,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Prévisions Météo'),
//       ),
//       body: ListView.builder(
//         itemCount: forecastData.length,
//         itemBuilder: (context, index) {
//           final forecast = forecastData[index];
//           return ListTile(
//             title: Text(forecast.date),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Temp: ${forecast.temperature}°C'),
//                 Text('Description: ${forecast.description}'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:thusmeteo_v2/app/modules/home/models/forecast.dart'; // Import Forecast
import 'package:intl/intl.dart';  // Import DateFormat for date formatting

class ForecastScreen extends StatelessWidget {
  final List<Forecast> forecastData;

  // Constructeur pour accepter les données de prévisions
  ForecastScreen({required this.forecastData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prévisions Météo'), // Titre de la barre d'applications
      ),
      body: ListView.builder(
        itemCount: forecastData.length, // Nombre d'éléments dans la liste
        itemBuilder: (context, index) {
          final forecast = forecastData[index]; // Données de la prévision actuelle

          return ListTile(
            title: Text(
              DateFormat('MMMM d, y').format(forecast.date),  // Formater et afficher la date
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte à gauche
              children: [
                Text('Temp: ${forecast.temperature}°C'),  // Afficher la température
                Text('Description: ${forecast.description}'),  // Afficher la description
              ],
            ),
          );
        },
      ),
    );
  }
}
