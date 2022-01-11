import 'package:lawazem/Orders/Models/OrderModel.dart';
import 'package:lawazem/Services/ApiNetwork.dart';
import 'package:lawazem/Services/EndPoints.dart';

class OrderRepository {
  static getMyOrders (int customerId)async{
     var response =  await ApiNetworkService.networkRequest(ApiMethod.GET, EndPoints.orderList,parameter: customerId);
     List<OrderModel> orders = [] ;
     for(var item in response as List)
     orders.add( OrderModel.fromJson(item));
     return orders;
  }
}