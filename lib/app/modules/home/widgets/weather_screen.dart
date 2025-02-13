import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thusmeteo_v2/app/modules/home/models/weather_data.dart';
import 'package:thusmeteo_v2/app/modules/home/models/forecast.dart';
import 'dart:math';
import 'weather_details.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherData? weatherData;

  const WeatherScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherData? weatherData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeatherData();
  }

  Future<void> _loadWeatherData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulation du chargement
    if (mounted) { // Vérification si le widget est encore monté
      setState(() {
        weatherData = widget.weatherData;
        isLoading = false;
      });
    }
  }

  Color _getRandomDarkPastelColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      100 + random.nextInt(100),
      100 + random.nextInt(100),
      100 + random.nextInt(100),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (weatherData == null) {
      return const Scaffold(
        body: Center(child: Text("Données météo non disponibles", style: TextStyle(fontSize: 18))),
      );
    }

    final overlayColor = _getRandomDarkPastelColor();

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            weatherData!.cityImgUrl ?? 'https://via.placeholder.com/400',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey,
                alignment: Alignment.center,
                child: const Icon(Icons.broken_image, size: 100, color: Colors.white),
              );
            },
          ),
          Container(
            color: overlayColor.withOpacity(0.9),
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              _buildMainInfo(),
              WeatherDetails(
                pressure: weatherData!.pressure.toString(),
                windSpeed: weatherData!.windSpeed.toString(),
                humidity: weatherData!.humidity.toString(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 128),
                  child: _buildForecast(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainInfo() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherData!.cityName,
            style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            '${weatherData!.temperature}°C',
            style: const TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.w200),
          ),
          Text(
            weatherData!.description,
            style: const TextStyle(fontSize: 20, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildForecast() {
    final List<Forecast> forecasts = weatherData!.forecast ?? [];

    if (forecasts.isEmpty) {
      return const Center(
        child: Text(
          'Aucune prévision disponible',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    print(weatherData!.forecast);
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: forecasts.length,
      itemBuilder: (context, index) {
        final forecast = forecasts[index];
        return Card(
          color: Colors.white.withOpacity(0.7),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListTile(
            title: Text(DateFormat('yyyy-MM-dd').format(forecast.date)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temp: ${forecast.temperature}°C'),
                Text('Description: ${forecast.description}'),
              ],
            ),
          ),
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:thusmeteo_v2/app/modules/home/models/weather_data.dart';
// import 'package:thusmeteo_v2/app/modules/home/models/forecast.dart';
// import 'dart:math';
// import 'weather_details.dart';
// import 'package:intl/intl.dart';

// class WeatherScreen extends StatefulWidget {
//   final WeatherData? weatherData; // Peut être null avant le chargement

//   const WeatherScreen({Key? key, required this.weatherData}) : super(key: key);

//   @override
//   _WeatherScreenState createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   late WeatherData? weatherData;

//   @override
//   void initState() {
//     super.initState();
//     weatherData = widget.weatherData;
//   }

//   Color _getRandomDarkPastelColor() {
//     final Random random = Random();
//     return Color.fromARGB(
//       255,
//       100 + random.nextInt(100), // Valeurs plus claires (100-199)
//       100 + random.nextInt(100),
//       100 + random.nextInt(100),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (weatherData == null) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()), // Indicateur de chargement
//       );
//     }

//     final overlayColor = _getRandomDarkPastelColor();

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Image de fond avec gestion d'erreur
//           Image.network(
//             weatherData!.cityImgUrl ?? 'https://via.placeholder.com/400',
//             fit: BoxFit.cover,
//             height: double.infinity,
//             width: double.infinity,
//             errorBuilder: (context, error, stackTrace) {
//               return Container(
//                 color: Colors.grey,
//                 alignment: Alignment.center,
//                 child: const Icon(Icons.broken_image, size: 100, color: Colors.white),
//               );
//             },
//           ),
//           // Color Overlay
//           Container(
//             color: overlayColor.withOpacity(0.9),
//           ),
//           // Contenu
//           Column(
//             children: [
//               const SizedBox(height: 30),
//               _buildMainInfo(),
//               WeatherDetails(
//                 pressure: weatherData!.pressure.toString(),
//                 windSpeed: weatherData!.windSpeed.toString(),
//                 humidity: weatherData!.humidity.toString(),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 128),
//                   child: _buildForecast(),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMainInfo() {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             weatherData!.cityName,
//             style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             '${weatherData!.temperature}°C',
//             style: const TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.w200),
//           ),
//           Text(
//             weatherData!.description,
//             style: const TextStyle(fontSize: 20, color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildForecast() {
//     final List<Forecast> forecasts = weatherData!.forecast ?? [];

//     if (forecasts.isEmpty) {
//       return const Center(
//         child: Text(
//           'Aucune prévision disponible',
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//       );
//     }

//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       itemCount: forecasts.length,
//       itemBuilder: (context, index) {
//         final forecast = forecasts[index];
//         return Card(
//           color: Colors.white.withOpacity(0.7),
//           margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: ListTile(
//             title: Text(DateFormat('yyyy-MM-dd').format(forecast.date)),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Temp: ${forecast.temperature}°C'),
//                 Text('Description: ${forecast.description}'),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
