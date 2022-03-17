import 'package:lawazem/Auth/Login/model/User.dart';
import 'package:lawazem/BaseModule/BaseBlocState.dart';

class LoginState extends BaseBlocState {
  User? user;
  String? errorMsg;
  LoginState(status, {this.user, this.errorMsg}) : super(status);
}
