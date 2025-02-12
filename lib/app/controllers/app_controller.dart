// Code du contr�leur principal 

import 'package:get/get.dart';
import 'package:ThusmeteoV2/app/services/api_service.dart';
import 'package:ThusmeteoV2/app/modules/home/models/weather_data.dart';

class AppController extends GetxController {
  final currentPage = 0.obs;
  final _weatherData = <String, WeatherData>{}.obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  void fetchWeatherData(String city, String imgUrl) async {
    try {
      final data = await ApiService.getWeatherData(city);
      data.cityImgUrl = imgUrl;
      _weatherData[city] = data;
      print("api success");
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch weather data for $city');
      print("api failure");
      print(e);
    }
  }

  WeatherData? getWeatherDataForCity(String city) {
    return _weatherData[city];
  }

  List<String> get addedCities => _weatherData.keys.toList();
}