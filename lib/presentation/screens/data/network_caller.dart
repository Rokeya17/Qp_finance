import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:qp_finance/presentation/screens/data/auth_controller.dart';

import 'network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      log('Bearer ${AuthController.accessToken}');
      Response response = await get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AuthController.accessToken}',
        },
      );
      log(response.statusCode.toString());

      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else {
        return NetworkResponse(false, response.statusCode, {'': ''});
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(
      false,
      -1,
      {'': ''},
    );
  }

  Future<NetworkResponse> postRequest(
      String url,
      Map<String, dynamic> body,
      ) async {
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AuthController.accessToken}',
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(false, response.statusCode, {'': ''});
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, {'': ''});
  }
}
