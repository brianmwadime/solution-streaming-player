import '../controller/change_bio_controller.dart';
import 'package:get/get.dart';

class ChangeBioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeBioController());
  }
}
