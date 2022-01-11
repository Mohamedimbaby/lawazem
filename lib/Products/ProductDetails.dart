import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/SharedPref.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductModel model;

  ProductDetailsScreen(this.model);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  PageController controller =
      PageController(viewportFraction: 0.8, keepPage: true);
  BehaviorSubject<int> rxCount = BehaviorSubject();
  BehaviorSubject<bool> rxLikeProduct = BehaviorSubject();
  int itemCount =1 ;
  @override
  void initState() {
    rxCount.sink.add(1);
    rxLikeProduct.sink.add(checkIfLiked(widget.model));
    super.initState();
  }

  @override
  void dispose() {
    rxCount.close();
    rxLikeProduct.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MyDimensions.screenHeight * .6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    )),
                    child: buildPageView(),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        backTo(context);
                      },
                      child: Container(
                        width: 40.r,
                        height: 40.r,
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 15,
                          color: TEXT_COLOR,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                      likeThisProduct(widget.model);
                      },
                      child: StreamBuilder<bool>(
                        stream: rxLikeProduct,
                        builder: (context, snapshot) {
                          if(snapshot.hasData)
                          return likedWidget(snapshot.data!);
                        return Container();
                        }
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: MyDimensions.screenWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                              controller: controller,
                              count: widget.model.images!.length,
                              effect: const ExpandingDotsEffect(
                                activeDotColor: MAIN,
                                radius: 8,
                                spacing: 10,
                                dotHeight: 6,
                                dotWidth: 8,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    buildItemHeader(),
                    SizedBox(
                      height: 13.h,
                    ),
                    Text(
                      widget.model.description!,
                      style: normalText(14.sp, GREY_TEXT_COLOR),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: buildSubmitSection(),
            ),
          )
        ],
      ),
    );
  }

  Row buildSubmitSection() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            openCartSheet(cartSheetMode.add_to_cart);
          },
          child: Container(
            width: 64.r,
            height: 64.r,
            decoration: BoxDecoration(
              color: GREY_BG,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_cart,
              color: MAIN,
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(child: GestureDetector(
            onTap: (){
              openCartSheet(cartSheetMode.checkout);
            },
            child: mainButton(AppConfig.labels!.buy_now)))
      ],
    );
  }
  void likeThisProduct(ProductModel product) {
    if (!checkIfLiked(product)) {
      AppConfig.likedItems.add(product);
      rxLikeProduct.sink.add(true);

    }
    else {
      AppConfig.likedItems.removeWhere((element) => element.id == product.id);
      rxLikeProduct.sink.add(false);

    }
    SharedPref.saveLikes(AppConfig.likedItems);

  }
  Row buildItemHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.name!,
                style: boldText(20.sp, TEXT_COLOR),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                widget.model.shortDescription!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: semiBoldText(14.sp, GREY_COLOR),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.price!+" " + AppConfig.labels!.sar,
                style: boldText(22.sp, MAIN),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container buildPageView() {
    return Container(
      height: MyDimensions.screenHeight * .6,
      child: PageView.builder(
        controller: controller,
        itemCount: widget.model.images!.length,
        itemBuilder: (_, index) {
          return bannerPagerImages(index);
        },
      ),
    );
  }

  bannerPagerImages(int index) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            image: DecorationImage(
              image: NetworkImage(widget.model.images![index].src!),
              fit: BoxFit.cover,
            )));
  }

  void openCartSheet(cartSheetMode mode) {
    int stockQuantity = widget.model.stockQuantity ?? 4;
    showModalBottomSheet<void>(
      context: context,

      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: WHITE,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32), topLeft: Radius.circular(32))),
          height: MyDimensions.screenHeight * .4,
          child: StreamBuilder<int>(
              stream: rxCount.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                    itemCount = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: MyDimensions.screenHeight * .15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppConfig.labels!.total,
                            style: semiBoldText(14.sp, TEXT_COLOR),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          buildCountItem(
                              Icon(
                                Icons.remove,
                                color:
                                snapshot.data! > 1 ? MAIN : GREY_TEXT_COLOR,
                                size: 15.r,
                              ), () {
                                if(snapshot.data! > 1)
                            rxCount.sink.add((snapshot.data!) - 1);
                          }),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(snapshot.data!.toString(),
                              style: semiBoldText(14.sp, TEXT_COLOR)),
                          SizedBox(
                            width: 10.w,
                          ),
                          buildCountItem(
                              Icon(
                                Icons.add,
                                color: snapshot.data! < stockQuantity
                                    ? MAIN
                                    : GREY_TEXT_COLOR,
                                size: 15.r,
                              ), () {
                            if(snapshot.data! < stockQuantity)
                            rxCount.sink.add((snapshot.data!) + 1);
                          })
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const MySeparator(),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text( AppConfig.labels!.total_payment,
                            style: boldText(16.sp, TEXT_COLOR),
                          ),
                          Text(getTotalPay().toString()+" "+ AppConfig.labels!.sar,
                            style: boldText(16.sp, MAIN),
                          ),
                        ],
                      ),

                      GestureDetector(
                          onTap: (){
                            if(mode == cartSheetMode.add_to_cart ){
                              widget.model.cartItems = snapshot.data!;
                              AppConfig.cartItems.add(widget.model);
                              SharedPref.saveProduct(AppConfig.cartItems);
                              Navigator.pop(context);
                              showAddedItemDialog();
                            }
                          },
                          child: mainButton(mode == cartSheetMode.add_to_cart ? AppConfig.labels!.add_to_cart :AppConfig.labels!.check_out ))
                    ],
                  );
                }
                else
                  return Container();
              }),
        );
      },
    );
  }


  getTotalPay() {
    return itemCount * double.parse(widget.model.price!);
  }

  void showAddedItemDialog() {
    showDialog(builder: (BuildContext context) {
      return confirmAddedItem();
    }, context: context
    );
  }

  bool checkIfLiked(ProductModel model) {
    return AppConfig.likedItems.map((e) => e.id).toList().contains(widget.model.id);
  }
}
enum cartSheetMode {
  add_to_cart , checkout
}