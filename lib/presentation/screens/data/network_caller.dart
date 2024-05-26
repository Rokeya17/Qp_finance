import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart' as getCont;
import 'package:http/http.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/signin_controller.dart';
import 'package:qp_finance/presentation/screens/data/auth_controller.dart';

import 'network_response.dart';

class NetworkCaller {
  final String accessToken;

  NetworkCaller()
      : accessToken = getCont.Get.find<SigninController>()
      .signInModel
      .accessToken
      .toString();

  Future<NetworkResponse> getRequest(String url) async {
    try {
      log('Bearer $accessToken');

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      if (accessToken != null && accessToken.isNotEmpty) {
        headers['Authorization'] = 'Bearer $accessToken';
      }

      Response response = await get(
        Uri.parse(url),
        headers: headers,
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