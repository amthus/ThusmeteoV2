// Code de HomeView 

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thusmeteo_v2/app/modules/home/widgets/weather_screen.dart';
import 'package:thusmeteo_v2/app/controllers/app_controller.dart';
import 'package:thusmeteo_v2/app/routes/app_pages.dart';

class HomeView extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          () {
           return Stack(
              children: [
                PageView.builder(
                  controller:
                  PageController(initialPage: controller.currentPage.value),
                  itemCount: controller.addedCities.length,
                  onPageChanged: controller.changePage,
                  itemBuilder: (context, index) {
                    final cityName = controller.addedCities[index]!;
                    final cityWeatherData = controller.getWeatherDataForCity(cityName)!;
                    return WeatherScreen(weatherData: cityWeatherData,);
                  },
                ),
                SafeArea(
                  child: Column(
                    children: [
                      _buildStaticTopBar(),
                      Spacer(),
                      _buildPageIndicator(),
                    ],
                  ),
                ),
              ],
            );
          }
      ),
    );
  }

  Widget _buildStaticTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => {Get.toNamed(Routes.ADD_PLACE)},
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
              )),
          Text('Thusmeteo App', style: TextStyle(color: Colors.white)),
          IconButton(
              onPressed: () => {Get.toNamed(Routes.ABOUT)},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.addedCities.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentPage.value == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ));
  }
}