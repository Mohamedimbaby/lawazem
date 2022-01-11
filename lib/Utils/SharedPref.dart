import 'dart:convert';

import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
class SharedPref {
  static SharedPreferences? prefs ;

  static  saveIsFirst(){
    prefs!.setBool("isFirst",true);
    debugPrint("isFirst saved successfully ");
  }
  static bool? getIsFirst(){
    return prefs!.getBool("isFirst");
  }


  static  saveLang( String lang){
    prefs!.setString("lang",lang);
    debugPrint("lang saved "+ lang);
  }
  static initShared()async{
    SharedPref.prefs = await SharedPreferences.getInstance();
  }
  static String? getLang(){
    return prefs!.getString("lang");
  }

  static  saveProduct(List<ProductModel> products ){
    prefs!.setString("productsCart",toJson(products));
    debugPrint("products added ");
  }
  static List<ProductModel>?  getProduct( ){
    var encodedList = prefs!.getString("productsCart");
    if(encodedList != null&& encodedList != "") {
      Map<String, dynamic> decodedList = jsonDecode(encodedList);
      var productsList = ProductsList.fromListJson(decodedList["cart"]);
      AppConfig.cartItems = productsList.products;
      return productsList.products;
    }
    return null;
  }

  static  saveLikes(List<ProductModel> products ){
    prefs!.setString("productsLiked",toJson(products));
    debugPrint("products added ");
  }
  static List<ProductModel>?  getLikes( ){
    var encodedList = prefs!.getString("productsLiked");
    if(encodedList != null&& encodedList != "") {
      Map<String, dynamic> decodedList = jsonDecode(encodedList);
      var productsList = ProductsList.fromListJson(decodedList["cart"]);
      AppConfig.likedItems = productsList.products;
      return productsList.products;
    }
    return null;
  }




  static  setLoggedIn( ){
    prefs!.setBool("isLoggedIn",true);
    debugPrint("first time");
  }
  static  getLoggedIn( ){
    return prefs!.getBool("isLoggedIn");
  }
  static  saveContext( BuildContext context){
    prefs!.setString("context",context.toString());
    debugPrint("first time");
  }
  static BuildContext getContext(){
    var string = prefs!.getString("context");
    return string as BuildContext;
  }

  static toJson(List<ProductModel> products){
    List<Map<String, dynamic>> myList = [];
    for (var item in products ){
      myList.add(item.toJson());
    }
    Map<String , dynamic > cart = {"cart":myList};
    return jsonEncode(cart);
  }
}