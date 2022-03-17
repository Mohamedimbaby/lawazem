import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawazem/Auth/Login/bloc/LoginEvent.dart';
import 'package:lawazem/Auth/Login/bloc/LoginState.dart';
import 'package:lawazem/Auth/Login/repo/LoginRepo.dart';
import 'package:lawazem/Utils/ResultStatusEnum.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(ResultStatus.Empty));
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield LoginState(ResultStatus.Loading);
    var user = await LoginRepo.login(event.userName, event.password);
    if (user.id == null) {
      yield LoginState(ResultStatus.Error,
          user: null, errorMsg: user.accessToken);
    } else {
      yield LoginState(ResultStatus.Success, user: user);
    }
  }
}
