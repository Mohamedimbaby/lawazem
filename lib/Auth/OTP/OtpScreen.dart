import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawazem/BaseModule/BaseScreen.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => OtpState();
}

class OtpState extends BaseState<OtpScreen> {
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
            buildOtpVerificationTitle(),
            buildOtpVerificationDesc(),
            buildOtpField(),
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

  buildOtpVerificationTitle() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.r),
      child: Text(
        AppConfig.labels!.otpVerification,
        style: semiBoldText(24.sp, BLACK_TEXT),
      ),
    );
  }

  buildOtpVerificationDesc() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 24.r),
      child: Text(
        AppConfig.labels!.otpVerificationDesc,
        style: semiBoldText(18.sp, kGrey400),
      ),
    );
  }

  buildOtpField() {
    return Container(
      margin: EdgeInsets.only(top: 62.r),
      child: PinCodeTextField(
        length: 4,
        animationType: AnimationType.fade,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: greyPinCode,
        onChanged: (newValue) {},
        appContext: context,
      ),
    );
  }

  buildContinueButton() {
    return Container(
      margin: EdgeInsets.only(top: 257.r),
      child: mainButton(AppConfig.labels!.continueVerify),
    );
  }
}
