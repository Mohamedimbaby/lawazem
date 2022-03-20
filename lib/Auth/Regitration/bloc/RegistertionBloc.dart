import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawazem/Auth/Regitration/bloc/RegistrationEvent.dart';
import 'package:lawazem/Auth/Regitration/bloc/RegistrationState.dart';
import 'package:lawazem/Auth/Regitration/repo/RegitrationRepo.dart';
import 'package:lawazem/Utils/ResultStatusEnum.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState(ResultStatus.Empty));

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    yield RegistrationState(ResultStatus.Loading);
    var registrationUser = await RegistrationRepo.register(event);
    if (registrationUser.customer != null) {
      yield (RegistrationState(ResultStatus.Success, user: registrationUser));
    } else {
      yield (RegistrationState(ResultStatus.Error,
          errorMsg: "An undefined error happened"));
    }
  }
}
