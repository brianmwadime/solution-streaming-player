import '../controller/my_world_controller.dart';
import 'package:get/get.dart';

class MyWorldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyWorldController());
  }
}
