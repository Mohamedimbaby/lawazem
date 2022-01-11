import 'package:flutter/material.dart';
import 'package:lawazem/BaseModule/BaseBlocState.dart';
import 'package:lawazem/Models/ProductsModel.dart';
class ProductState extends BaseBlocState{
    ProductsList? model;
    String? errorMessage ;
    ProductState(status,{this.model,this.errorMessage}) : super(status);
}