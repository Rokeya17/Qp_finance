import 'dart:math';

import 'package:get/get.dart';
import 'package:qp_finance/model/wallet_model.dart'; // Import the WalletSummaryModel
import 'package:qp_finance/presentation/screens/data/network_caller.dart';
import 'package:qp_finance/presentation/screens/data/network_response.dart';


class WalletController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  WalletSummaryModel _walletSummaryModel = WalletSummaryModel();
  final String _url = 'https://quantumpossibilities.eu:82/api/wallet/getting-wallet-summary';

  bool get inprogress => _inProgress;
  String get message => _message;
  WalletSummaryModel get walletSummaryModel => _walletSummaryModel;

  Future<bool> fetchWalletSummary() async {
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(_url);

    _inProgress = false;
    update();
    
    if (response.statusCode == 200) {
      _walletSummaryModel = WalletSummaryModel.fromJson(response.responseJson!);
      _message = response.responseJson!['message'] ?? '';
      update();
      return true;
    } else {
      _message = response.responseJson!['message'] ?? 'An error occurred';
      update();
      return false;
    }
  }
}
