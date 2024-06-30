
import 'package:ecommerce_app/data/models/network_response.dart';
import 'package:ecommerce_app/data/models/product.dart';
import 'package:ecommerce_app/data/models/product_list_model.dart';
import 'package:ecommerce_app/data/utility/urls.dart';
import 'package:ecommerce_app/network_caller/network_caller.dart';
import 'package:get/get.dart';

class PopularProductListController extends GetxController {
  bool _popularProductInProgress = false;

  List<Product> _productList = [];

  String _errorMessage = '';

  bool get popularProductInProgress => _popularProductInProgress;

  List<Product> get productList => _productList;

  String get errorMessage => _errorMessage;

  Future<bool> getPopularProductList() async {
    bool isSuccess = false;
    _popularProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productListByRemark('Popular'));
    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _popularProductInProgress = false;
    update();
    return isSuccess;
  }
}