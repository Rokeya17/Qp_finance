import 'package:get/get.dart';
import 'package:qp_finance/model/weather_model.dart';
import 'package:qp_finance/presentation/screens/data/network_caller.dart';
import 'package:qp_finance/presentation/screens/data/network_response.dart';

class WeatherController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  final String _url =
      'https://api.openweathermap.org/data/2.5/weather?q=dhaka&appid=0dadc0ec41869d72cab605ebf70d5c96';

  bool get inprogress => _inProgress;

  String get message => _message;
  WeatherModel _weatherModel = WeatherModel();

  WeatherModel get weatherModel => _weatherModel;

  Future<bool> getWeather() async {
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(_url);
    _inProgress = false;
    update();

    if (response.isSuccess) {
      _weatherModel = WeatherModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'An error occurred';
      update();
      return false;
    }
  }
}
