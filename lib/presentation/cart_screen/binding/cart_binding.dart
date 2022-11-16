import 'package:get/get.dart';
import 'package:solution_ke/presentation/cart_screen/controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
