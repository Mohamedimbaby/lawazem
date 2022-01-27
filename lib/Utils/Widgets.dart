import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/Skelton.dart';
import 'package:lawazem/Utils/Styles.dart';

Widget drawLine = Row(children: <Widget>[
  Expanded(child: Divider()),
  Text(
    "  " + AppConfig.labels!.or + "  ",
    style: normalText(14.sp, GREY_TEXT_COLOR),
  ),
  Expanded(child: Divider()),
]);

Widget myTextFormField(
    double width,
    double height,
    Color color,
    String hintText,
    TextEditingController controller,
    String? Function(String? text) validate,
    {Icon? suffixIcon,
    Icon? prefixIcon,
    bool? obscure}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: color,
    ),
    child: TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Colors.black,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          prefixText: "      ",
          suffixIconConstraints: BoxConstraints(
            minHeight: 70,
            minWidth: 70,
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: 70,
            minWidth: 70,
          ),
          suffixIcon: suffixIcon ?? null,
          prefixIcon: prefixIcon ?? null,
          hintText: hintText,
          hintStyle: semiBoldText(14.sp, GREY_COLOR)),
      validator: validate,
    ),
  );
}

Widget mainButton(String text, {width}) {
  return Container(
    height: MyDimensions.screenHeight * .09,
    alignment: Alignment.center,
    width: width ?? MyDimensions.screenWidth,
    padding: const EdgeInsetsDirectional.only(
        start: 20, end: 20, top: 20, bottom: 20),
    margin: const EdgeInsets.all(10),
    decoration:
        BoxDecoration(color: MAIN, borderRadius: BorderRadius.circular(32)),
    child: Text(
      text,
      style: const TextStyle(
          color: Colors.white,
          letterSpacing: 1,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    ),
  );
}

Widget likedWidget(bool isLiked) {
  return Container(
    width: 40.r,
    height: 40.r,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: getIcon(isLiked),
  );
}

Widget buildSkeleton() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 16.0,
      right: 16.0,
      bottom: 24.0,
      top: 12.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(
              height: 200,
              width: MyDimensions.screenWidth * .5 - 20,
            ),
            Skeleton(
              height: 200,
              width: MyDimensions.screenWidth * .5 - 20,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(width: MyDimensions.screenWidth * .5 - 20),
            Skeleton(width: MyDimensions.screenWidth * .5 - 20),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(width: MyDimensions.screenWidth * .5 - 60),
            Skeleton(width: MyDimensions.screenWidth * .5 - 60),
          ],
        ),
      ],
    ),
  );
}

Widget confirmationDialogWithOptions(
    String title,
    String description,
    BuildContext context,
    Function onTapFirstAction,
    Function onTapSecondAction) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    //this right here
    backgroundColor: Colors.white,
    child: Container(
      width: 310.w,
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 31.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: boldText(14.sp, MAIN),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: normalText(
              12.sp,
              TEXT_COLOR,
            ),
          ),
          SizedBox(
            height: 27.h,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    onTapFirstAction();
                  },
                  child: Container(
                    height: 45.h,
                    width: 137.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: MAIN, borderRadius: BorderRadius.circular(5)),
                    child: Text(AppConfig.labels!.confirm,
                        style: normalText(
                          16.sp,
                          Colors.white,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onTapSecondAction();
                  },
                  child: Container(
                      height: 45.h,
                      width: 137.w,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xfff8f8fa),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        AppConfig.labels!.cancel,
                        style: normalText(
                          16.sp,
                          Color(0xff7e8eaa),
                        ),
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
        ],
      ),
    ),
  );
}

getIcon(bool isLiked) {
  return !isLiked
      ? Icon(
          Icons.favorite_border_outlined,
          color: GREY_COLOR,
        )
      : Icon(
          Icons.favorite,
          color: RED,
        );
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = GREY_ICON});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

AlertDialog confirmAddedItem() {
  return AlertDialog(
    backgroundColor: GREY_BG,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    content: Container(
      height: MyDimensions.screenHeight * .3,
      color: GREY_BG,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagePaths.CART_IMAGE,
            height: 150.h,
            width: 100,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            AppConfig.labels!.items_added_to_cart,
            style: boldText(16.sp, TEXT_COLOR),
          )
        ],
      ),
    ),
  );
}

buildCountItem(Icon icon, Function onPress) {
  return Container(
    width: 25.r,
    height: 25.r,
    padding: EdgeInsets.all(2),
    alignment: Alignment.center,
    child: GestureDetector(
        onTap: () {
          onPress();
        },
        child: icon),
    decoration: BoxDecoration(
        border: Border.all(color: GREY_BG), shape: BoxShape.rectangle),
  );
}

// ignore: must_be_immutable

AppBar customAppBar(String title, BuildContext context) {
  return AppBar(
    leading: InkWell(
        onTap: () {
          backTo(context);
        },
        child: Icon(
          Icons.arrow_back_ios_outlined,
          color: TEXT_COLOR,
        )),
    backgroundColor: WHITE,
    title: Text(
      title,
      style: semiBoldText(16.sp, TEXT_COLOR),
    ),
    centerTitle: true,
    elevation: 0,
  );
}
