import '../controller/purchase_controller.dart';
import 'package:get/get.dart';

class PurchaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PurchaseController());
  }
}
