// Code de HomeBinding 

import 'package:get/get.dart';
import 'package:thusmeteo_v2/app/controllers/app_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(
          () => AppController(),
    );
  }
}