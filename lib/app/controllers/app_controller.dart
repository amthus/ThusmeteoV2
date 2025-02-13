

import 'package:get/get.dart';
import 'package:thusmeteo_v2/app/services/api_service.dart';
import 'package:thusmeteo_v2/app/modules/home/models/weather_data.dart';
import 'package:thusmeteo_v2/app/modules/home/models/forecast.dart';

class AppController extends GetxController {
  

  final RxBool isHovered = false.obs;

  void updateHoverState(bool isHovered) {
    this.isHovered.value = isHovered;
  }
  final currentPage = 0.obs;

  // Stockage des données météo et prévisions sous forme de RxMap
  final RxMap<String, WeatherData> _weatherData = <String, WeatherData>{}.obs;
  final RxMap<String, List<Forecast>> _forecastData = <String, List<Forecast>>{}.obs;

  // Récupérer les données météo d'une ville
  WeatherData? getWeatherDataForCity(String city) => _weatherData[city];

  // Récupérer les prévisions météo d'une ville
  List<Forecast> getForecastDataForCity(String city) => _forecastData[city] ?? [];

  // Liste des villes ajoutées
  List<String> get addedCities => _weatherData.keys.toList();

  // Changer de page
  void changePage(int index) {
    currentPage.value = index;
  }

  // Récupérer les données météo
  void fetchWeatherData(String city, String imgUrl) async {
    try {
      final data = await ApiService.getWeatherData(city);
      data.cityImgUrl = imgUrl;

      _weatherData[city] = data;  
      _weatherData.refresh();  

      print("Météo récupérée avec succès pour $city");
    } catch (e) {
      Get.snackbar('Erreur', 'Impossible de récupérer la météo pour $city');
      print("Échec de récupération météo : $e");
    }
  }

  // Récupérer les prévisions météo
void fetchForecastData(String city) async {
  try {
    final forecastResponse = await ApiService.getForecastData(city);

    // Met à jour les prévisions dans le Map
    _forecastData[city] = forecastResponse.forecast;

    _forecastData.refresh();  // Forcer la mise à jour en Web
    print(" Prévisions récupérées avec succès pour $city");
  } catch (e) {
    Get.snackbar('Erreur', 'Impossible de récupérer les prévisions pour $city');
    print(" Échec récupération des prévisions : $e");
  }
}

}
