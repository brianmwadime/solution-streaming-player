import '../controller/onboarding_category_controller.dart';
import 'package:get/get.dart';

class OnboardingCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingCategoryController());
  }
}
