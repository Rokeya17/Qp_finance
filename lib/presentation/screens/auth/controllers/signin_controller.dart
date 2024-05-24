import 'package:get/get.dart';
import 'package:qp_finance/model/signin_models.dart';
import 'package:qp_finance/presentation/screens/data/network_caller.dart';
import 'package:qp_finance/presentation/screens/data/network_response.dart';

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

    if (response.responseJson != null &&
        response.responseJson is Map<String, dynamic>) {
      final responseJson = response.responseJson as Map<String, dynamic>;

      if (responseJson['status'] == 200) {
        _signInModel = SignInModel.fromJson(responseJson);
        _message = responseJson['message'] ?? '';
        update();
        return true;
      } else {
        _message = responseJson['message'] ?? 'An error occurred';
        update();
        return false;
      }
    } else {
      _message = 'Invalid response from server';
      update();
      return false;
    }
  }
}
