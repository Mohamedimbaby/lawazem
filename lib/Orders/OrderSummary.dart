import 'package:flutter/material.dart';
import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Orders/Models/UiAddressModel.dart';
import 'package:lawazem/Payment/PaymentMethodScreen.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrderSummary extends StatefulWidget {
  UiAddressModel addressModel ;
  PaymentMethodModel paymentMethodModel ;
  OrderSummary(this.addressModel ,this.paymentMethodModel, {Key? key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: customAppBar(AppConfig.labels!.order,context ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppConfig.labels!.address, style: boldText(16.sp , TEXT_COLOR),),
                    SizedBox(height: 14.h,),
                    Container(
                      width: MyDimensions.screenWidth,
                      height: 100.h,
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      decoration: BoxDecoration(
                        color: GREY_BG,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Username" ,style: boldText(14.sp , TEXT_COLOR), maxLines: 1,overflow: TextOverflow.ellipsis, ),
                          Text(widget.addressModel.address ,style:normalText(14.sp , TEXT_COLOR), maxLines: 2,overflow: TextOverflow.ellipsis, ),
                          Text(widget.addressModel.phoneNumber ,style: normalText(14.sp , TEXT_COLOR), maxLines: 1,overflow: TextOverflow.ellipsis, ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    Text(AppConfig.labels!.items, style: boldText(16.sp , TEXT_COLOR),),
                    SizedBox(height: 14.h,),
                    SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: AppConfig.cartItems.map((e) => buildCartItem(e)).toList(),
                        )

                    ),
                    SizedBox(height: 24.h,),
                    Text(AppConfig.labels!.paymentMethod, style: boldText(16.sp , TEXT_COLOR),),
                    SizedBox(height: 14.h,),
                    _buildPaymentMethodItem(widget.paymentMethodModel),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: mainButton(AppConfig.labels!.continued),
            )
          ],
        ));
  }
  Widget _buildPaymentMethodItem( PaymentMethodModel item) {
    return Container(
            width: 100.w,
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
            decoration: BoxDecoration(
              color: GREY_LOWEST,
              borderRadius: BorderRadius.circular(16),
            ),
            child: item.image2 == null ? Image.asset(item.image): Row(mainAxisAlignment :  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Image.asset(item.image) ,SizedBox(width: 8,),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Image.asset(item.image2!),
                )],),
          );

  }
  Widget buildCartItem(ProductModel e) {
    int quantity =  e.stockQuantity ?? 4;
    return Container(
      decoration: BoxDecoration(
        color: WHITE,
      ),
      height: 120.h,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      width: MyDimensions.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 85.h,
                width: 80.h,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(e.images![0].src!)),

                )
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: Text(e.name! , maxLines: 1 , overflow: TextOverflow.ellipsis,style: boldText(12.sp, TEXT_COLOR),)),
                Flexible(child: Text(e.shortDescription!  == "" ? "temp description":e.shortDescription! , maxLines: 1 , overflow: TextOverflow.ellipsis,style: semiBoldText(12.sp, GREY_COLOR),)),
                Flexible(child: Text(AppConfig.labels!.sar+" "+e.price! , maxLines: 1 , overflow: TextOverflow.ellipsis,style: boldText(12.sp, MAIN),)),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Icon(
                    Icons.close,
                    color:  GREY_TEXT_COLOR,
                    size: 15.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(e.cartItems!.toString(),
                      style: semiBoldText(14.sp, GREY_TEXT_COLOR)),

                ],
              ))
        ],
      ),
    );
  }
}
