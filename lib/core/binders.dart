import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/logout_controller.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/signin_controller.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/signup_controller.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/weather_controller.dart';

class StateBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(SigninController());
    Get.put(SignupController());
    Get.put(WeatherController());
    Get.put(LogoutController());
  }
}
