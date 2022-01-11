
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Orders/Models/OrderModel.dart';
import 'package:lawazem/Products/ProductsRepo.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/SharedPref.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppConfig {

  static Map<HomeTabs , List<ProductModel>> cachedData = {};
  static List<ProductModel> cartItems = [];
  static List<ProductModel> likedItems = [];
  static List<OrderModel> orders = [];
  static const Map<String, List<Map<String , String>>> onBoardingData  = {
    "onBoardingData": [
      { 'title': 'Latest Outfit',
        'image': 'assets/images/lawazem1.png',
        'desc': 'There are many outfits that make you cool '
      },
      {
        'title': 'Affordable Prices',
        'image': 'assets/images/lawazem2.png',
        'desc':
        'Goods at affordable prices that make you thrifity ' },
      {
        'title': 'Shop Safety',
        'image': 'assets/images/lawazem3.png',
        'desc': 'Shop in peace and safety without worry'
      }
    ],
  };
 static List<String>bannerPhotos = [
    ImagePaths.LAWAZEM_1,
    ImagePaths.LAWAZEM_2,
    ImagePaths.LAWAZEM_3,

  ];

  static BuildContext? applicationContext;
  static final navKey = new GlobalKey<NavigatorState>();
  static bool  isRefreshable = true;
  static String defaultImage = "assets/icon/ic_launcher.png";
  static Locality locality = setLocality();
  static AppLocalizations? labels;
  static Brightness myBrightness =  Brightness.dark;

  static setInitialValue (BuildContext context)async{
    labels = AppLocalizations.of(context);
    setLocality();
    setMyLocality();
  }
  static BehaviorSubject<bool> languageSubject  = BehaviorSubject();
  static initializeLocality (BuildContext context){
    switch (AppLocalizations.of(context)!.localeName){
      case 'en':
        locality = Locality.english;
        print("english");
        break;
      case 'ar':
        locality = Locality.arabic;
        print("arabic");
        break;
      case 'es':
        locality = Locality.spanish;
        break;
      case 'ur':
        locality = Locality.urdu;
        break;
    }
  }
  static setLocality (){
    switch (SharedPref.getLang()){
      case 'en':
        locality = Locality.english;
        break;
      case 'ar':
        locality = Locality.arabic;
        break;
      case 'es':
        locality = Locality.spanish;
        break;
      case 'ur':
        locality = Locality.urdu;
        break;
    }
  }
  static String my_locality = setMyLocality();
  static setMyLocality(){
    return AppConfig.locality == Locality.english ?  'en-us': 'ar';
  }
}
enum Locality {
  arabic , english ,spanish ,urdu
}
/*Future<bool> isChromeEnabled() async {
  try {
    var appEnabled = await AppAvailability.isAppEnabled("com.android.chrome");
    print(appEnabled);
    return appEnabled;
  } catch (e) {
    return true;
  }
}*/




