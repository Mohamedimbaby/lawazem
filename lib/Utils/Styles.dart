import 'package:flutter/cupertino.dart';

TextStyle boldText(double fontSize , Color textColor ){
  return TextStyle(fontWeight: FontWeight.bold ,fontSize: fontSize,color: textColor,fontFamily: "AirbnbBold" );
}
TextStyle normalText(double fontSize , Color textColor ){
  return TextStyle(fontWeight: FontWeight.normal ,fontSize: fontSize,color: textColor,fontFamily: "AirbnbNormal" );
}
TextStyle semiBoldText(double fontSize , Color textColor ){
  return TextStyle(fontWeight: FontWeight.w500 ,fontSize: fontSize,color: textColor ,fontFamily: "AirbnbSemi");
}