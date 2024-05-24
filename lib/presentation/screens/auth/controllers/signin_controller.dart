import 'package:get/get.dart';
import 'package:qp_finance/model/signin_model.dart';
import 'package:qp_finance/presentation/screens/data/network_caller.dart';
import 'package:qp_finance/presentation/screens/data/network_response.dart';
import 'package:qp_finance/presentation/screens/data/auth_controller.dart'; // Import the AuthController

class SigninController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  SignInModel _signInModel = SignInModel();
  String _url = 'https://quantumpossibilities.eu:82/api/login';

  bool get inprogress => _inProgress;
  String get message => _message;
  SignInModel get signInModel => _signInModel;

  Future<bool> userSignin(String email, String password) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(_url, {
      'email': email,
      'password': password,
    });

    _inProgress = false;
    update();

    if (response.statusCode == 200) {
      _signInModel = SignInModel.fromJson(response.responseJson!);
      _message = response.responseJson!['message'] ?? '';

      // Extract and store the token
      String? token = response.responseJson!['token'];
      if (token != null) {
        AuthController.accessToken = token;
      }

      update();
      return true;
    } else {
      _message = response.responseJson!['message'] ?? 'An error occurred';
      update();
      return false;
    }
  }
}
