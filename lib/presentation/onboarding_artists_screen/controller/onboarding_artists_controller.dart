import '/core/app_export.dart';
import 'package:solution_ke/presentation/onboarding_artists_screen/models/onboarding_artists_model.dart';

class OnboardingArtistsController extends GetxController {
  Rx<OnboardingArtistsModel> onboardingArtistsModelObj =
      OnboardingArtistsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
