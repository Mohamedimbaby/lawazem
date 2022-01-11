import 'package:flutter/material.dart';
import 'package:lawazem/Orders/Models/UiAddressModel.dart';
import 'package:lawazem/Payment/PaymentMethodScreen.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrderInfo extends StatefulWidget {
  const OrderInfo({Key? key}) : super(key: key);

  @override
  _OrderInfoState createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  TextEditingController deliveryAddressController = TextEditingController();
  TextEditingController googleMapsUrlController = TextEditingController();
  TextEditingController recipientMobileNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: customAppBar(AppConfig.labels!.delivery_address,context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 16.0),
        child: Stack  (
          children: [
            ListView(
              children: [
                SizedBox(height: 10.h,),
                Form(
                  key: formKey,
                    child: SingleChildScrollView(
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text (AppConfig.labels!.delivery_address , style: boldText(14.sp, TEXT_COLOR),),
                          SizedBox(height: 5.h,),
                          myTextFormField(MyDimensions.screenWidth, MyDimensions.screenHeight*.08, GREY_BG, "", deliveryAddressController, deliveryAddressValidate),
                          SizedBox(height: 20.h,),
                            Text (AppConfig.labels!.google_maps_url , style: boldText(14.sp, TEXT_COLOR),),
                          SizedBox(height: 5.h,),
                          myTextFormField(MyDimensions.screenWidth, MyDimensions.screenHeight*.08, GREY_BG, "", googleMapsUrlController, googleMapsValidate),
                          SizedBox(height: 20.h,),
                            Text (AppConfig.labels!.recipient_mobile_number , style: boldText(14.sp, TEXT_COLOR),),
                          SizedBox(height: 5.h,),
                          myTextFormField(MyDimensions.screenWidth, MyDimensions.screenHeight*.08, GREY_BG, "", recipientMobileNumberController, mobileNumberValidate),
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
                      UiAddressModel addressModel = UiAddressModel(deliveryAddressController.text, googleMapsUrlController.text, recipientMobileNumberController.text);
                      navigateTo(context, PaymentMethodScreen(addressModel));
                    }
                  },
                  child: mainButton(AppConfig.labels!.order_now,)) ,
            )
          ],
        ),
      ),
    );
  }




  String? deliveryAddressValidate(String? text) {
    if(text!.length > 3){
      return null;
    }
    else return AppConfig.labels!.please_enter_valid_address;
  }

  String? googleMapsValidate(String? text)   {
    if( Uri.parse(text!).isAbsolute){
      return null;
    }
    else return AppConfig.labels!.please_enter_valid_url;
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

