
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
