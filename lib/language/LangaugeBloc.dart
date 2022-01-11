import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawazem/language/LanguageEvent.dart';
import 'package:lawazem/language/LanguageState.dart';
import 'package:lawazem/Utils/ResultStatusEnum.dart';
import 'package:lawazem/Products/ProductEvent.dart';
import 'package:lawazem/Products/ProductState.dart';
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  /// {@macro counter_bloc}
  LanguageBloc() : super(LanguageState(ResultStatus.Empty));

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
        yield LanguageState(ResultStatus.Success , locale: event.locale);

  }
}