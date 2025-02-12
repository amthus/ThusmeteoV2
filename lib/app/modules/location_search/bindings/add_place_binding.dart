// Code de AddPlaceBinding 
import 'package:get/get.dart';
import 'package:ThusmeteoV2/app/controllers/app_controller.dart';  


class AddPlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(
        () => AppController()
    );
  }
}