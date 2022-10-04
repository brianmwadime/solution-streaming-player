import '../controller/confirm_purchase_controller.dart';
import 'package:get/get.dart';

class ConfirmPurchaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmPurchaseController());
  }
}
