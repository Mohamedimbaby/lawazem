import 'package:flutter/material.dart';
import 'package:lawazem/Orders/Models/UiAddressModel.dart';
import 'package:lawazem/Payment/PaymentMethodScreen.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController companyController = TextEditingController();
  TextEditingController crController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: customAppBar(AppConfig.labels!.my_account,context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 16.0),
        child: Stack  (
          children: [
            ListView(
              children: [
                buildHeaderSection(),
                Divider(thickness: 1,color: GREY,indent: 5,endIndent: 5,),
                SizedBox(height: 10.h,),
                Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text (AppConfig.labels!.company , style: boldText(14.sp, TEXT_COLOR),),
                          SizedBox(height: 5.h,),
                          myTextFormField(MyDimensions.screenWidth, MyDimensions.screenHeight*.08, GREY_BG, "", companyController, companyValidate),
                          SizedBox(height: 20.h,),
                          Text (AppConfig.labels!.cr_number , style: boldText(14.sp, TEXT_COLOR),),
                          SizedBox(height: 5.h,),
                          myTextFormField(MyDimensions.screenWidth, MyDimensions.screenHeight*.08, GREY_BG, "", crController, CRValidate),
                          SizedBox(height: 20.h,),
                          Text (AppConfig.labels!.mobile_number , style: boldText(14.sp, TEXT_COLOR),),
                          SizedBox(height: 5.h,),
                          myTextFormField(MyDimensions.screenWidth, MyDimensions.screenHeight*.08, GREY_BG, "", MobileNumberController, mobileNumberValidate),
                          SizedBox(height: 20.h,),
                        ],
                      ),
                    )),



              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:GestureDetector(
                  onTap: (){
                    if(formKey.currentState!.validate()){

                    }
                  },
                  child: mainButton(AppConfig.labels!.update_account,)) ,
            )
          ],
        ),
      ),
    );
  }



  buildHeaderSection  () {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.r,
          height: 100.r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              image: DecorationImage(
                  image: AssetImage(ImagePaths.LOGO),
                  fit: BoxFit.fill
              )
          ),
        ),
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text("Username", style: boldText(20.sp, TEXT_COLOR),),
            SizedBox(height: 5,),
            Text("Username@gmail.com", style: boldText(16.sp, kGrey400),),

          ],
        )
      ],
    );

  }
  String? companyValidate(String? text) {
    if(text!.length > 3){
      return null;
    }
    else return AppConfig.labels!.please_enter_valid + " "+ AppConfig.labels!.company;
  }

  String? CRValidate(String? text)   {
    if( text!.length == 11 ){
      return null;
    }
    else return AppConfig.labels!.please_enter_valid +" "+AppConfig.labels!.cr_number;
  }

  String? mobileNumberValidate(String? text) {
    Pattern pattern =
        r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
    RegExp regex = new RegExp(pattern.toString());
    if (text!.length < 10)
      return AppConfig.labels!.please_enter_valid_number;
    else
      return null;
  }

}

