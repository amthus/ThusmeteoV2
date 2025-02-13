// // lib/app/modules/home/models/forecast.dart

// class Forecast {
//   final String date;
//   final String temperature;
//   final String description;
//   final String humidity;
//   final String windSpeed;
//   final String pressure;
//   final String iconCode;

//   Forecast({
//     required this.date,
//     required this.temperature,
//     required this.description,
//     required this.humidity,
//     required this.windSpeed,
//     required this.pressure,
//     required this.iconCode,
//   });

//   // Méthode de construction à partir d'une réponse JSON
//   factory Forecast.fromJson(Map<String, dynamic> json) {
//     return Forecast(
//       date: json['dt_txt'], // Exemple de date, adapter selon la réponse de l'API
//       temperature: json['main']['temp'].toString(),
//       description: json['weather'][0]['description'],
//       humidity: json['main']['humidity'].toString(),
//       windSpeed: json['wind']['speed'].toString(),
//       pressure: json['main']['pressure'].toString(),
//       iconCode: json['weather'][0]['icon'].toString(),
//     );
//   }
// }


// // forecast.dart
// class Forecast {
//   final DateTime date;
//   final double temperature;
//   final String description;

//   Forecast({
//     required this.date,
//     required this.temperature,
//     required this.description,
//   });

//   factory Forecast.fromJson(Map<String, dynamic> json) {
//     return Forecast(
//       date: DateTime.parse(json['dt_txt']), // Conversion de la chaîne en DateTime
//       temperature: json['main']['temp'].toDouble(),
//       description: json['weather'][0]['description'],
//     );
//   }
// }

class Forecast {
  final DateTime date;
  final double temperature;
  final String description;
  final String icon;

  Forecast({
    required this.date,
    required this.temperature,
    required this.description,
    required this.icon,  // Ajout de l'icône
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.parse(json['dt_txt']), // Conversion de la chaîne en DateTime
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'], // Récupération de l'icône
    );
  }
}

class ForecastResponse {
  final List<Forecast> forecast;

  ForecastResponse({required this.forecast});

  factory ForecastResponse.fromJson(Map<String, dynamic> json) {
    return ForecastResponse(
      forecast: (json['list'] as List)
          .map((item) => Forecast.fromJson(item))
          .toList(),  // On mappe chaque élément de 'list' en un objet Forecast
    );
  }
}
