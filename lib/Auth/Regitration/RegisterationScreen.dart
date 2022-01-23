import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawazem/Auth/Login/LoginScreen.dart';
import 'package:lawazem/BaseModule/BaseScreen.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';

class RegistrationScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => RegistrationState();
}

class RegistrationState extends BaseState<RegistrationScreen> {
  TextEditingController _companyController = TextEditingController();
  TextEditingController _crNumberController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget getScreenBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.r),
      color: WHITE,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRegisterLogo(),
            _buildRegisterTitle(),
            _biuldRegisterDescription(),
            Padding(
              padding: EdgeInsets.only(top: 47.r),
              child: drawLine,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.r),
              child: _buildRegisterForm(),
            )
          ],
        ),
      ),
    );
  }

  _buildRegisterLogo() {
    return Padding(
      padding: EdgeInsets.only(top: 52.0.r),
      child: Center(
        child: Image.asset(
          ImagePaths.LOGIN_LOGO,
          height: 100.r,
          width: 100.r,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  _buildRegisterTitle() {
    return Container(
      margin: EdgeInsets.only(top: 80.r),
      alignment: Alignment.center,
      child: Text(
        AppConfig.labels!.registerSentence,
        style: boldText(18.sp, BLACK_TEXT),
      ),
    );
  }

  _biuldRegisterDescription() {
    return Padding(
      padding: EdgeInsets.only(top: 14.r),
      child: InkWell(
        onTap: () => navigateToLoginScreen(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppConfig.labels!.alreadyHaveAccount + " ",
              style: semiBoldText(14.sp, SECOND_TEXT_COLOR),
            ),
            Text(
              AppConfig.labels!.signin + " ",
              style: semiBoldText(14.sp, MAIN),
            ),
          ],
        ),
      ),
    );
  }

  navigateToLoginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (co) {
      return LoginScreen();
    }));
  }

  _buildRegisterForm() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12.r),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppConfig.labels!.registerCompany,
                  style: semiBoldText(14.sp, BLACK_TEXT),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 60.0.r),
                  child: Text(
                    AppConfig.labels!.cr_number,
                    style: semiBoldText(14.sp, BLACK_TEXT),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myTextFormField(156.w, MyDimensions.screenHeight * .08, GREY_BG,
                  "", _companyController, (validator) {}),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 7.r),
                  child: myTextFormField(156.w, MyDimensions.screenHeight * .08,
                      GREY_BG, "", _crNumberController, (validator) {}),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.r),
            child: Text(
              AppConfig.labels!.mobile_number,
              style: semiBoldText(14.sp, BLACK_TEXT),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0.r),
            child: myTextFormField(
                MyDimensions.screenWidth,
                MyDimensions.screenHeight * .08,
                GREY_BG,
                "",
                _numberController,
                numberValidate),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.r),
            child: Text(
              AppConfig.labels!.password,
              style: semiBoldText(14.sp, BLACK_TEXT),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0.r),
            child: myTextFormField(
                MyDimensions.screenWidth,
                MyDimensions.screenHeight * .08,
                GREY_BG,
                "",
                _passwordController,
                passwordValidate,
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: GREY_TEXT_COLOR,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 42.r),
            child: mainButton(AppConfig.labels!.register),
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
}
