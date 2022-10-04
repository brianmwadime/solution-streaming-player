import '../controller/terms_conditions_controller.dart';
import 'package:get/get.dart';

class TermsConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsConditionsController());
  }
}
