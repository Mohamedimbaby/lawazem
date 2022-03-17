import 'package:lawazem/Auth/Login/model/User.dart';
import 'package:lawazem/Services/ApiNetwork.dart';

class LoginRepo {
  static Future<User> login(String username, String password) async {
    var response = await ApiNetworkService.networkRequest(
        ApiMethod.POST, "/wp-json/woo-jwt/v1/login",
        parameter: "?username=$username&password=$password");
    try {
      return User.fromJson(response["data"]);
    } catch (ex) {
      return User(null, response["message"], null, null, null, null);
    }
  }
}
