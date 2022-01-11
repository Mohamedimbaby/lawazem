import 'package:connectivity/connectivity.dart';

 class ConnectivityService {
 static Connectivity subscription = Connectivity();

static Future <bool> checkConnectivity ()async{
   var checkConnectivity =await subscription.checkConnectivity();
   if (checkConnectivity != ConnectivityResult.none){
     return true ;
   }
   else return false;
}

}