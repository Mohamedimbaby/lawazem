import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lawazem/Orders/Models/UiAddressModel.dart';
import 'package:lawazem/Orders/OrderSummary.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';
class PaymentMethodScreen extends StatefulWidget {
  UiAddressModel addressModel;
   PaymentMethodScreen(this.addressModel , {Key? key}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  List<PaymentMethodModel > paymentMethods = [
    PaymentMethodModel(1, ImagePaths.VISA,image2:ImagePaths.MASTER ),
    PaymentMethodModel(2, ImagePaths.APPLE_PAY ,image2:ImagePaths.PAY  ),
    PaymentMethodModel(3, ImagePaths.CASH_PAY),
  ];
  BehaviorSubject<int> rxPaymentMethod = BehaviorSubject();
  late PaymentMethodModel selectedPaymentMethod ;
  @override
  void initState() {
    selectedPaymentMethod = paymentMethods[0];
    // TODO: implement initState
    rxPaymentMethod.sink.add(1);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    rxPaymentMethod.drain();
    rxPaymentMethod.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: customAppBar(AppConfig.labels!.payment,context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text (AppConfig.labels!.paymentMethod , style: boldText(16.sp, TEXT_COLOR),),
            SizedBox(height: 15.h,),
             StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  itemCount: paymentMethods.length,
                  itemBuilder: (BuildContext context, int index) {
                    var product = paymentMethods[index];
                    selectedPaymentMethod = product;
                    return GestureDetector(
                        onTap: (){
                          rxPaymentMethod.sink.add(product.id);
                          selectedPaymentMethod = product;
                        },
                        child: _buildPaymentMethodItem(index, product));
                  },
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2,  0.8),
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 20.0,
                ),
            Spacer(),
            GestureDetector(
                onTap: (){
                  navigateTo(context, OrderSummary(widget.addressModel , selectedPaymentMethod));
                },
                child: mainButton(AppConfig.labels!.order_now,))
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodItem(int index, PaymentMethodModel item) {
    return StreamBuilder<int>(
        stream: rxPaymentMethod.stream,
        builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
          decoration: BoxDecoration(
            color:snapshot.hasData && snapshot.data == item.id ?MAIN : GREY_LOWEST,
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
    );
  }
}

class PaymentMethodModel {
  int id ;
  String image ;
  String? image2 ;

  PaymentMethodModel(this.id, this.image, { this.image2});
}
