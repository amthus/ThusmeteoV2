// Code des routes de l'application 

import 'package:get/get.dart';
import 'package:ThusmeteoV2/app/modules/about/about_screen.dart';
import 'package:ThusmeteoV2/app/modules/home/bindings/home_binding.dart';
import 'package:ThusmeteoV2/app/modules/location_search/bindings/add_place_binding.dart';
import 'package:ThusmeteoV2/app/modules/location_search/views/add_place_view.dart';
import 'package:ThusmeteoV2/app/modules/home/views/home_view.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PLACE,
      page: () => AddPlaceView(),
      binding: AddPlaceBinding(),
    ),
    GetPage(name: _Paths.ABOUT, page: () => AboutScreen())
  ];
}

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ADD_PLACE = _Paths.ADD_PLACE;
  static const ABOUT = _Paths.ABOUT;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ADD_PLACE = '/add-place';
  static const ABOUT = '/about';
}