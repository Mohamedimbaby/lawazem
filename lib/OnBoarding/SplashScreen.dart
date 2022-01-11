import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawazem/Auth/Login/LoginScreen.dart';
import 'package:lawazem/BaseModule/BaseScreen.dart';

import 'package:lawazem/OnBoarding/OnBoardingWidget.dart';
import 'package:lawazem/Orders/Models/OrderModel.dart';
import 'package:lawazem/Orders/OrdersRepo.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Navigation.dart';

import 'package:lawazem/Utils/SharedPref.dart';

class MySplashScreen extends BaseStatefulWidget {
  @override
  BaseState<MySplashScreen> createState() {
    // TODO: implement createState
    return _MySplashScreen();
  }
}

class _MySplashScreen extends BaseState<MySplashScreen> {
  bool? isFirstTime;
getOrders()async{
 AppConfig.orders =  await OrderRepository.getMyOrders(1);
}
@override
  void initState() {
      checkIfIsItFirstTime();
      SharedPref.getProduct();
      SharedPref.getLikes();
      getOrders();
      Future.delayed(Duration(seconds: 5),(){
        if(isFirstTime!){
          SharedPref.saveIsFirst();
          navigateTo(context, OnBoardingWidget());
        }else {
          navigateTo(context, LoginScreen());
        }

      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig.setInitialValue( context);


    return Scaffold(

        backgroundColor:WHITE ,
        body: Container(
          width: MyDimensions.screenWidth,
          height: MyDimensions.screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MyDimensions.screenHeight * .2,),
          Image.asset(ImagePaths.LOGO),
        ],
      ),
    ));
  }

  void checkIfIsItFirstTime() {
    if (SharedPref.getIsFirst() == null ) {
      isFirstTime = true;
    } else {
      isFirstTime = false;
    }
  }

  @override
  Widget getScreenBody(BuildContext context) {
    // TODO: implement getScreenBody
    return build(context);
  }
}
