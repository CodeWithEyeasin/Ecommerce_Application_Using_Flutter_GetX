import 'package:get/get.dart';

import '../../data/models/cart_model.dart';
import '../../data/models/network_response.dart';
import '../../data/utility/urls.dart';
import '../../network_caller/network_caller.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> addToCart(CartModel cartModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.addToCart,
      body: cartModel.toJson(),
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