import '../controller/onboarding_artists_controller.dart';
import 'package:get/get.dart';

class OnboardingArtistsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingArtistsController());
  }
}
