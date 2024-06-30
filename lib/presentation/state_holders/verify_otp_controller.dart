
import 'package:ecommerce_app/data/models/network_response.dart';
import 'package:ecommerce_app/data/utility/urls.dart';
import 'package:ecommerce_app/network_caller/network_caller.dart';
import 'package:ecommerce_app/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.verifyOtp(email, otp),
        fromAuth: true
    );
    if (response.isSuccess) {
      await UserAuthController.saveUserToken(response.responseData['data']);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}