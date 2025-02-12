// Code de WeatherData 

class WeatherData {
  final String cityName;
  final String temperature;
  final String description;
  final String humidity;
  final String windSpeed;
  final String pressure;
  final String iconCode;
  String? cityImgUrl;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.iconCode,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['name'],
      temperature: json['main']['temp'].toString(),
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'].toString(),
      windSpeed: json['wind']['speed'].toString(),
      pressure: json['main']['pressure'].toString(),
      iconCode: json['weather'][0]['icon'].toString(),
    );
  }
}