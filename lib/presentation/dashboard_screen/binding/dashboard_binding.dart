import 'package:get/get.dart';
import 'package:solution_ke/presentation/account_screen/controller/account_controller.dart';
import 'package:solution_ke/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:solution_ke/presentation/homepage_screen/controller/homepage_controller.dart';
import 'package:solution_ke/presentation/my_world_screen/controller/my_world_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomepageController());
    Get.lazyPut(() => MyWorldController());
    Get.lazyPut(() => AccountController());
  }
}
