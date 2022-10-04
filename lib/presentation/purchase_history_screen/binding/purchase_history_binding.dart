import '../controller/purchase_history_controller.dart';
import 'package:get/get.dart';

class PurchaseHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PurchaseHistoryController());
  }
}
