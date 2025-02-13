// // Code de WeatherData


import 'forecast.dart';  // Import the Forecast class

class WeatherData {
  final String cityName;
  final String temperature;
  final String description;
  final String humidity;
  final String windSpeed;
  final String pressure;
  final String iconCode;
  final List<Forecast> forecast;  // List of Forecast objects
  String? cityImgUrl;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.iconCode,
    required this.forecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    List<Forecast> forecastList = [];
    
    if (json.containsKey('list') && json['list'] is List) {
      forecastList = (json['list'] as List)
          .map((item) => Forecast.fromJson(item))
          .toList();
    }

    return WeatherData(
      cityName: json['name'] ?? 'Unknown City', // Handle missing key
      temperature: (json['main']?['temp'] ?? 0).toString(),
      description: (json['weather'] != null && json['weather'].isNotEmpty)
          ? json['weather'][0]['description']
          : 'No description',
      humidity: (json['main']?['humidity'] ?? 0).toString(),
      windSpeed: (json['wind']?['speed'] ?? 0).toString(),
      pressure: (json['main']?['pressure'] ?? 0).toString(),
      iconCode: (json['weather'] != null && json['weather'].isNotEmpty)
          ? json['weather'][0]['icon'].toString()
          : 'Unknown',
      forecast: forecastList,
    );
  }
}
