import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Products/ProductsRepo.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/ResultStatusEnum.dart';
import 'package:lawazem/Products/ProductEvent.dart';
import 'package:lawazem/Products/ProductState.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  /// {@macro counter_bloc}
  ProductBloc() : super(ProductState(ResultStatus.Empty));

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    yield ProductState(ResultStatus.Loading);
    try{
      if(AppConfig.cachedData[event.mode]!= null){
        yield ProductState(ResultStatus.Success,model: ProductsList(AppConfig.cachedData[event.mode]!) );
      }
      var productsList = await ProductsRepo.getProductList(event.mode);
      yield ProductState(ResultStatus.Success,model: productsList );

    }catch(e){
      yield ProductState(ResultStatus.Error,errorMessage: e.toString() );

    }
  }
}
