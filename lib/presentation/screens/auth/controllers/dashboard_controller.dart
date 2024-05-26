import 'package:get/get.dart';
import 'package:qp_finance/model/local/dashboard_model.dart';
import 'package:qp_finance/presentation/screens/data/network_caller.dart';
import 'package:qp_finance/presentation/screens/data/network_response.dart';

class DashboardController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  DashboardModel _dashboardModel = DashboardModel();
  String _url =
      'https://quantumpossibilities.eu:82/api/wallet/getting-wallet-summary';

  bool get inprogress => _inProgress;

  String get message => _message;

  DashboardModel get dashboardModel => _dashboardModel;

  Future<bool> getDahBoardData() async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(_url);

    _inProgress = false;
    update();

    if (response.responseJson!['status'] == 200) {
      _dashboardModel = DashboardModel.fromJson(response.responseJson!);
      _message = 'Success';
      update();
      return true;
    } else {
      _message = 'Failed';
      update();
      return false;
    }
  }
}
