import 'package:flutter/material.dart';

navigateTo(BuildContext context , Widget newScreen){
  Navigator.push(context, MaterialPageRoute(
      builder:(co){
    return newScreen;
  }));

}
navigateOffTo(BuildContext context , Widget newScreen){
  Navigator.pushReplacement(context, MaterialPageRoute(
      builder:(co){
        return newScreen;
      }));
}

backTo(BuildContext context){
  Navigator.pop(context);
}