// // Code de HomeView 


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thusmeteo_v2/app/modules/home/widgets/weather_screen.dart';
import 'package:thusmeteo_v2/app/controllers/app_controller.dart';
import 'package:thusmeteo_v2/app/routes/app_pages.dart';

class HomeView extends GetView<AppController> {
  // URL d'une image de fond en ligne (provenant de Pexels)
  final String backgroundImageUrl =
      'https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            // Image de fond en ligne
            Image.network(
              backgroundImageUrl,
              fit: BoxFit.cover, // Ajuster l'image à l'écran
              width: double.infinity,
              height: double.infinity,
            ),

            // Contenu principal
            PageView.builder(
              controller: PageController(initialPage: controller.currentPage.value),
              itemCount: controller.addedCities.length,
              onPageChanged: controller.changePage,
              itemBuilder: (context, index) {
                final cityName = controller.addedCities[index]!;
                final cityWeatherData = controller.getWeatherDataForCity(cityName)!;
                return WeatherScreen(weatherData: cityWeatherData);
              },
            ),

            // Barre supérieure
            SafeArea(
              child: Column(
                children: [
                  _buildStaticTopBar(),
                  Spacer(),
                  _buildPageIndicator(),
                ],
              ),
            ),

            // Message centré au milieu (visible uniquement si aucune ville n'est ajoutée)
            if (controller.addedCities.isEmpty)
              Center(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click, // Curseur au survol
                  child: Obx(() {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300), // Animation fluide
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: controller.isHovered.value
                            ? Colors.white.withOpacity(0.8) // Fond au survol
                            : Colors.black.withOpacity(0.5), // Fond par défaut
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Bienvenue sur Thusmeteo App',
                            style: TextStyle(
                              color: controller.isHovered.value
                                  ? Colors.black // Texte au survol
                                  : Colors.white, // Texte par défaut
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10), // Espacement
                          Text(
                            'Instructions :\n \n'
                            '1. Cliquez sur le bouton "+" pour ajouter une ville.\n \n'
                            '2. Explorez les prévisions météo pour chaque ville.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: controller.isHovered.value
                                  ? Colors.black // Texte au survol
                                  : Colors.white, // Texte par défaut
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  onEnter: (_) {
                    // Effet au survol
                    controller.updateHoverState(true);
                  },
                  onExit: (_) {
                    // Effet à la sortie du survol
                    controller.updateHoverState(false);
                  },
                ),
              ),
          ],
        );
      }),
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
            ),
          ),
          Text(
            'Thusmeteo App',
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            onPressed: () => {Get.toNamed(Routes.ABOUT)},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
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