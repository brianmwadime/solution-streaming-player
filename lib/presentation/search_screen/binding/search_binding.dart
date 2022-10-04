import 'package:get/get.dart';
import 'package:solution_ke/presentation/search_screen/controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
