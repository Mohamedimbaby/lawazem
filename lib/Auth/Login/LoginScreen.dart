import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawazem/Auth/Regitration/RegisterationScreen.dart';
import 'package:lawazem/BaseModule/BaseScreen.dart';
import 'package:lawazem/Home/HomeScreen.dart';
import 'package:lawazem/Products/ProductBloc.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';

import 'forgetOrResetPassword.dart';

class LoginScreen extends BaseStatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget getScreenBody(BuildContext context) {
    // TODO: implement getScreenBody
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: WHITE,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Image.asset(
              ImagePaths.LOGIN_LOGO,
              height: 100.r,
              width: 100.r,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              AppConfig.labels!.login + " " + AppConfig.labels!.in_to_lawazem,
              style: boldText(18.sp, TEXT_COLOR),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () => navigateToRegister(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppConfig.labels!.donothaveaccount + " ",
                    style: semiBoldText(14.sp, SECOND_TEXT_COLOR),
                  ),
                  Text(
                    AppConfig.labels!.signup + " ",
                    style: semiBoldText(14.sp, MAIN),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            drawLine,
            SizedBox(
              height: 20.h,
            ),
            _buildSignInForm()
          ],
        ),
      ),
    );
  }

  _buildSignInForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppConfig.labels!.mobile_number,
              style: boldText(14.sp, TEXT_COLOR)),
          SizedBox(
            height: 10.h,
          ),
          myTextFormField(
              MyDimensions.screenWidth,
              MyDimensions.screenHeight * .08,
              GREY_BG,
              "",
              numberController,
              numberValidate),
          SizedBox(
            height: 20.h,
          ),
          Text(AppConfig.labels!.password, style: boldText(14.sp, TEXT_COLOR)),
          SizedBox(
            height: 10.h,
          ),
          myTextFormField(
              MyDimensions.screenWidth,
              MyDimensions.screenHeight * .08,
              GREY_BG,
              "",
              passwordController,
              passwordValidate,
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: GREY_TEXT_COLOR,
              )),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () => goToForgetPasswordScreen(),
            child: Text(AppConfig.labels!.forgot_password,
                style: boldText(14.sp, GREY_TEXT_COLOR)),
          ),
          SizedBox(
            height: 40.h,
          ),
          mainButton(AppConfig.labels!.login),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    navigateTo(
                        context,
                        BlocProvider(
                            create: (c) => ProductBloc(), child: HomeScreen()));
                  },
                  child: Text(AppConfig.labels!.explore_as_guest,
                      style: semiBoldText(14.sp, MAIN))),
            ],
          ),
        ],
      ),
    );
  }

  String? numberValidate(String? text) {
    if (text!.length > 11) return null;
    return "error";
  }

  String? passwordValidate(String? text) {
    if (text!.length > 8) return null;
    return "error";
  }

  navigateToRegister() {
    Navigator.push(context, MaterialPageRoute(builder: (co) {
      return RegistrationScreen();
    }));
  }

  goToForgetPasswordScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (co) {
      return ForgetOrResetPasswordScreen(AppConfig.labels!.forgot_password,
          AppConfig.labels!.forgetPasswordDesc, false);
    }));
  }
}
