import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Services/ApiNetwork.dart';

enum HomeTabs { recent, trending, top, recommendation }

class ProductsRepo {
  static Future<ProductsList> getProductList(HomeTabs homeTab) async {
    String endPoint = getEndPointForTab(homeTab);
    var response =
        await ApiNetworkService.networkRequest(ApiMethod.GET, endPoint);
    return ProductsList.fromListJson(response);
  }

  static String getEndPointForTab(HomeTabs homeTab) {
    switch (homeTab) {
      case HomeTabs.recent:
        return "/wp-json/wc/v3/products?recent";
      case HomeTabs.top:
        return "/wp-json/wc/v3/products?featured=true";
      default:
        return "";
    }
  }
}
