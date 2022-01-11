import 'package:flutter/material.dart';
import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Orders/OrderInfo.dart';
import 'package:lawazem/Payment/PaymentMethodScreen.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/SharedPref.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  BehaviorSubject<bool> rxUpdateChange = BehaviorSubject();
  @override
  void initState() {
    // TODO: implement initState
    rxUpdateChange.sink.add(true);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    rxUpdateChange.sink.add(false);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<bool>(
      stream: rxUpdateChange.stream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: customAppBar(AppConfig.labels!.cart, context),
          body: Container(
              height: MyDimensions.screenHeight,
              width: MyDimensions.screenWidth,
              color: WHITE,
              child: AppConfig.cartItems.length > 0 ?
              Stack(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: AppConfig.cartItems.map((e) => buildCartItem(e)).toList(),
                        )

                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 220,
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          MySeparator(),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppConfig.labels!.total_payment ,style: semiBoldText(18.sp, TEXT_COLOR),),
                              Column(
                                children: [
                                  Text(AppConfig.labels!.sar +" "+getTotalPrice(),style: semiBoldText(18.sp, MAIN),),
                                  Text(AppConfig.labels!.sar +" "+getTotalPrice()+" "+AppConfig.labels!.without_vat,style: semiBoldText(8.sp, GREY_TEXT_COLOR),),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 15,),
                          GestureDetector(
                              onTap: (){
                                navigateTo(context, OrderInfo());
                              },
                              child: mainButton(AppConfig.labels!.check_out))

                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),

                      ),
                    ),
                  )

                ],
              ):
              EmptyCartScreen()
            ),
        );
      }
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
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap:(){
                    deleteItemFromCart(e);
                  },
                  child: Icon(Icons.close, color: MAIN,size: 20,))
            ],
          ),
        ),
        SizedBox(width: 10,),
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
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: Text(e.name! , maxLines: 1 , overflow: TextOverflow.ellipsis,style: boldText(12.sp, TEXT_COLOR),)),
                Flexible(child: Text(e.shortDescription! , maxLines: 1 , overflow: TextOverflow.ellipsis,style: semiBoldText(12.sp, GREY_COLOR),)),
                Flexible(child: Text(AppConfig.labels!.sar+" "+e.price! , maxLines: 1 , overflow: TextOverflow.ellipsis,style: boldText(12.sp, MAIN),)),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                 buildCountItem(
                  Icon(
                    Icons.remove,
                    color: e.cartItems! > 1 ? MAIN : GREY_TEXT_COLOR,
                    size: 15.r,
                  ), () {

              }),
              SizedBox(
                width: 10.w,
              ),
              Text(e.cartItems!.toString(),
                  style: semiBoldText(14.sp, TEXT_COLOR)),
              SizedBox(
                width: 10.w,
              ),
              buildCountItem(
                  Icon(
                    Icons.add,
                    color:
                    e.cartItems! < quantity ? MAIN : GREY_TEXT_COLOR,
                    size: 15.r,
                  ), () {

             })
            ],
          ))
        ],
      ),
    );
  }

  void deleteItemFromCart(ProductModel e) {
    showDialog(context: context, builder: (builder){
      return confirmationDialogWithOptions(AppConfig.labels!.alert, AppConfig.labels!.are_you_sure_you_want_to_delete , context,(){
        AppConfig.cartItems.remove(e);
        SharedPref.saveProduct(AppConfig.cartItems);
        rxUpdateChange.sink.add(true);
            },
          (){
          }
      );

    });


  }

  String getTotalPrice() {
    double result = 0 ;
    for(var i in AppConfig.cartItems){
       result += double.parse(i.price!)*i.cartItems!;
    }
    return result.toString();
  }


}
class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WHITE,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImagePaths.EMPTY_BASKET),
          SizedBox(height: 12,),
          Text(AppConfig.labels!.empty_basket , style: boldText(28.sp, TEXT_COLOR),),
          SizedBox(height: 12,),
          Text(AppConfig.labels!.your_basket_is_empty, style: semiBoldText(18.sp, GREY_COLOR), textAlign: TextAlign.center,)

        ],
      ),
    );
  }
}

