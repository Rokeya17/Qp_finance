import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/data/network_caller.dart';
import 'package:qp_finance/presentation/screens/data/network_response.dart';

class SignupController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  String _url = 'https://quantumpossibilities.eu:82/api/signup';
  bool get inProgress => _inProgress;
  String get message => _message;
 Future<bool> userSignup(
      String firstName,
      String lastName,
      String email,
      String phoneNumber,
      String password,
      String gender,
      String day,
      String month,
      String year,
      ) async {
    _inProgress = true;
    _message = ''; // Clear previous message
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(_url, {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phoneNumber,
      'password': password,
      'user_role': 1,
      'gender': gender,
      'day': day,
      'month': month,
      'year': year,
    });

    _inProgress = false;
    update();

    if (response.isSuccess) {
      _message = response.responseJson!['message'] ?? '';
      return true;
    } else {
      if (response.responseJson != null) {
        _message = response.responseJson!['error'] ?? 'Unknown error occurred';
      } else {
        _message = 'Network error occurred';
      }
      return false;
    }
  }}
