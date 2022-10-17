import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
