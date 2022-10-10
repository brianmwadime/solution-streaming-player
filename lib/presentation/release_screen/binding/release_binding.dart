import 'package:solution_ke/presentation/release_screen/controller/release_controller.dart';

import 'package:get/get.dart';

class ReleaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReleaseController());
  }
}
