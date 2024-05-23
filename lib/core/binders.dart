import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/signin_controller.dart';

class StateBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(SigninController());
  }
}
