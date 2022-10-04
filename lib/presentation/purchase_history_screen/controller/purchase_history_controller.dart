import '/core/app_export.dart';
import 'package:solution_ke/presentation/purchase_history_screen/models/purchase_history_model.dart';

class PurchaseHistoryController extends GetxController {
  Rx<PurchaseHistoryModel> purchaseHistoryModelObj = PurchaseHistoryModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
