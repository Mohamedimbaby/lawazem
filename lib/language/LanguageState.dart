import 'package:flutter/material.dart';
import 'package:lawazem/BaseModule/BaseBlocState.dart';
class LanguageState extends BaseBlocState{
    Locale? locale ;
    List<Object> get props => [locale!];

    LanguageState(status,{this.locale,}) : super(status);
}