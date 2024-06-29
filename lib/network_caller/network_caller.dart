import 'dart:convert';
import 'package:ecommerce_app/presentation/screens/email_verification_screen.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';
import '../data/models/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String  url}) async {
    try {
      print(url);
      final Response response = await get(Uri.parse(url));
      print(response.statusCode.toString());
      print(response.body.toString());

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            responseCode: response.statusCode,
            isSuccess: true,
            responseData: decodedData);
      } else if (response.statusCode == 401) {
        _goToSignInScreen();
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      print(e.toString());
      return NetworkResponse(
          responseCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      print(url);
      final Response response = await post(Uri.parse(url),
          headers: {'accept': 'application/json'}, body: jsonEncode(body));
      print(response.statusCode.toString());
      print(response.body.toString());

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            responseCode: response.statusCode,
            isSuccess: true,
            responseData: decodedData);
      } else if (response.statusCode == 401) {
        _goToSignInScreen();
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      print(e.toString());
      return NetworkResponse(
          responseCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }

  static void _goToSignInScreen() {
    // Navigator.push(
    //   CraftyBay.navigationKey.currentState!.context,
    //   MaterialPageRoute(
    //     builder: (context) => const EmailVerificationScreen(),
    //   ),
    // );
    getx.Get.to(() => const EmailVerificationScreen());
  }
}
