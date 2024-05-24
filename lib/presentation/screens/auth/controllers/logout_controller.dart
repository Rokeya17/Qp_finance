import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/data/network_caller.dart';
import 'package:qp_finance/presentation/screens/data/network_response.dart';

class LogoutController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  final String _url = 'https://quantumpossibilities.eu:82/api/logout';

  bool get inProgress => _inProgress;

  String get message => _message;

  Future<bool> logout() async {
    _inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().postRequest(_url, {});
    _inProgress = false;
    update();

    if (response.responseJson!['status'] == 200) {
      _message = response.responseJson!['message'] ?? 'Logout successful';
      update();
      return true;
    } else {
      _message = response.responseJson!['message'] ?? 'An error occurred';
      update();
      return false;
    }
  }
}
