import '/core/app_export.dart';
import 'package:solution_ke/presentation/about_screen/models/about_model.dart';

class AboutController extends GetxController {
  Rx<AboutModel> aboutModelObj = AboutModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
