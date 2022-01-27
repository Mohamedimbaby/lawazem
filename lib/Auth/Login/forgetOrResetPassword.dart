import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawazem/BaseModule/BaseScreen.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';

class ForgetOrResetPasswordScreen extends BaseStatefulWidget {
  final title;
  final description;
  final isResetPassword;

  ForgetOrResetPasswordScreen(
      this.title, this.description, this.isResetPassword);
  @override
  State<StatefulWidget> createState() => ForgetOrResetPasswordState();
}

class ForgetOrResetPasswordState
    extends BaseState<ForgetOrResetPasswordScreen> {
  late String _title;
  late String _desc;
  TextEditingController _numberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  initState() {
    super.initState();
    _title = widget.title;
    _desc = widget.description;
  }

  @override
  Widget getScreenBody(BuildContext context) {
    return Container(
      color: WHITE,
      margin: EdgeInsetsDirectional.only(start: 28.r, end: 28.r, top: 66.59.r),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBackIcon(),
            buildForgetOrResetTitle(_title),
            buildForgetOrResetDesc(_desc),
            widget.isResetPassword
                ? buildResetPasswordField()
                : buildForgetPasswordField(),
            buildContinueButton()
          ],
        ),
      ),
    );
  }

  buildBackIcon() {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 17.26.r),
      child: Image.asset(ImagePaths.BACK_ARROW),
    );
  }

  buildForgetOrResetTitle(String title) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.r),
      child: Text(
        title,
        style: semiBoldText(24.sp, BLACK_TEXT),
      ),
    );
  }

  buildForgetOrResetDesc(String desc) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 24.r),
      child: Text(
        desc,
        style: semiBoldText(18.sp, kGrey400),
      ),
    );
  }

  buildResetPasswordField() {
    return Container(
      margin: EdgeInsets.only(top: 42.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConfig.labels!.newPassword,
            style: normalText(14.sp, BLACK_TEXT),
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
                ),
                obscure: true),
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

  buildForgetPasswordField() {
    return Container(
      margin: EdgeInsets.only(top: 42.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConfig.labels!.mobile_number,
            style: normalText(14.sp, BLACK_TEXT),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0.r),
            child: myTextFormField(
              MyDimensions.screenWidth,
              MyDimensions.screenHeight * .08,
              GREY_BG,
              "",
              _numberController,
              numberValidate,
            ),
          ),
        ],
      ),
    );
  }

  buildContinueButton() {
    return Container(
      margin: EdgeInsets.only(top: 256.r),
      child: InkWell(
          onTap: () => continueMethod(),
          child: mainButton(AppConfig.labels!.continueVerify)),
    );
  }

  continueMethod() {
    if (!widget.isResetPassword) {
      Navigator.push(context, MaterialPageRoute(builder: (co) {
        return ForgetOrResetPasswordScreen(AppConfig.labels!.resetPassword,
            AppConfig.labels!.resetPasswordDesc, true);
      }));
    }
  }
}
