import 'package:lawazem/Auth/Regitration/model/registration_user.dart';
import 'package:lawazem/BaseModule/BaseBlocState.dart';
import 'package:lawazem/Utils/ResultStatusEnum.dart';

class RegistrationState extends BaseBlocState {
  RegistrationUser? user;
  String? errorMsg;
  RegistrationState(ResultStatus status, {this.user, this.errorMsg})
      : super(status);
}
