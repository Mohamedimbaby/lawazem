import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Services/ApiNetwork.dart';
enum HomeTabs {
  recent , trending , top , recommendation
}
class ProductsRepo{
  static Future<ProductsList> getProductList(HomeTabs homeTab)async{
    String endPoint = getEndPointForTab(homeTab);
     var response = await ApiNetworkService.networkRequest(ApiMethod.GET, endPoint);
     return ProductsList.fromListJson(response);
  }

  static String getEndPointForTab(HomeTabs homeTab) {
    switch(homeTab){
      case HomeTabs.recent:
        return "products?recent";
      case HomeTabs.top:
        return "products?featured=true";
      default:
        return "";
    }
  }
}