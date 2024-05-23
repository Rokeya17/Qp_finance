import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/data/network_caller.dart';
import 'package:qp_finance/presentation/screens/data/network_response.dart';

class SigninController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  String _url = 'https://quantumpossibilities.eu:82/api/login';

  bool get inprogress => _inProgress;

  String get message => _message;

  Future<bool> userSignin(String email, String password) async {
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().postRequest(_url, {
      'email': email,
      'password': password,
    });
    _inProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
