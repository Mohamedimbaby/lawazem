import 'package:flutter/material.dart';
import 'package:lawazem/Products/ProductsRepo.dart';
class ProductEvent{
  HomeTabs mode;
    ProductEvent(this.mode);
}
enum ProductsEventMode {
  details , recentList
}
