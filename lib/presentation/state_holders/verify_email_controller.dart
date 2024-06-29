import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/utility/urls.dart';
import '../../network_caller/network_caller.dart';

class VerifyEmailController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> verifyEmail(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.verifyEmail(email),
    );
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}