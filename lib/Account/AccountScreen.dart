
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawazem/Account/AccountEdit.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawazem/language/LangaugeBloc.dart';
import 'package:lawazem/language/LanguageEvent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController searchController = TextEditingController();
  LanguageBloc? _bloc;
  String _radioValue = AppConfig.locality == Locality.english
      ? "en"
      : AppConfig.locality == Locality.arabic
      ? "ar"
      : AppConfig.locality == Locality.spanish
      ? "es"
      : "ur"; //Initial definition of radio button value
  String? choice;

  void radioButtonChanges(String? value) {
    Navigator.pop(context);
    setState(() {
      _radioValue = value!;
      switch (value) {
        case 'en':
          choice = value;
          break;
        case 'ar':
          choice = value;
          break;
        case 'es':
          choice = value;
          break;
        case 'ur':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
    //      Strings.isEnglish = value;

    if (choice == "en") {
      _bloc!.add(LanguageEvent( locale: Locale("en", "")));
    } else if (choice == "ar") {
      _bloc!.add(LanguageEvent( locale: Locale("ar", "")));
    }
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        AppConfig.labels = AppLocalizations.of(context);
        AppConfig.initializeLocality(context);
        AppConfig.my_locality =
        AppConfig.locality == Locality.english ? 'en-us' : 'ar';
      });
    });

    Future.delayed(Duration(milliseconds: 500)).then((value) {
      AppConfig.languageSubject.sink.add(true);
      print("sent");
    });
  }
@override
  void initState() {
  _bloc = BlocProvider.of<LanguageBloc>(context);

}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Column(
              children: [
                buildHeaderSection(),
                Divider(thickness: 1,color: GREY,indent: 5,endIndent: 5,),
                buildCountSection(),
                SizedBox(height: 20.h,),
                buildMyWallet(),
                SizedBox(height: 20.h,),
               GestureDetector(
                 child: buildListItem(AppConfig.labels!.my_account,iconData :Icons.person, ),
                   onTap: (){
                  navigateTo(context, EditAccount());
                   },
               ),
                GestureDetector(
                  child:  buildListItem(AppConfig.locality == Locality.arabic ? AppConfig.labels!.arabicLanguage:AppConfig.labels!.english , image: ImagePaths.LANG),
                  onTap: () {
                    print("tapped");
                    showDialog(
                        context: context,
                        builder: (c) {
                          return Directionality(
                            textDirection:
                            AppConfig.locality == Locality.arabic
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            child: AlertDialog(
                                title: Text(
                                  AppConfig.labels!.change_language,
                                  style: semiBoldText(14.sp, TEXT_COLOR),
                                ),
                                content: Container(
                                  alignment: Alignment.centerRight,
                                  height: 120.h,
                                  width: 200.w,
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            radioButtonChanges("en");
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 6,
                                                child: Text(
                                                  "English",
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Radio(
                                                  value: 'en',
                                                  groupValue: _radioValue,
                                                  onChanged: radioButtonChanges,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            radioButtonChanges("ar");
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 6,
                                                child: Text(
                                                  "اللغة العربية",
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Radio(
                                                  value: 'ar',
                                                  groupValue: _radioValue,
                                                  onChanged: radioButtonChanges,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ), /*
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                     children: <Widget>[
                                       Expanded(
                                         flex:6,
                                         child: Text(
                                           "Spanish",
                                         ),
                                       ),
                                       Expanded(
                                         flex:1,
                                         child: Radio(
                                           value: 'es',
                                           groupValue: _radioValue,
                                           onChanged: radioButtonChanges,
                                         ),
                                       ),

                                     ],
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                     children: <Widget>[
                                       Expanded(
                                         flex:6,
                                         child: Text(
                                           "اللغة الأردية",
                                         ),
                                       ),
                                       Expanded(
                                         flex:1,
                                         child: Radio(
                                           value: 'ur',
                                           groupValue: _radioValue,
                                           onChanged: radioButtonChanges,
                                         ),
                                       ),

                                     ],
                                   ),*/
                                      ]),
                                )),
                          );
                        });
                  },
                ),
                buildListItem(AppConfig.labels!.help , image: ImagePaths.HELP),
                buildListItem(AppConfig.labels!.logout , iconData: Icons.logout),
              ],
            )
          ],
        ),
      ),
    );
  }

  String? validate(String?  text) {
    return null;
  }

  Widget buildOfferItem() {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
      decoration: BoxDecoration(
        color: ORANGE_SHADED,
        borderRadius: BorderRadius.circular(16),

      ),
      child: Image.asset(ImagePaths.EMPTY_BASKET),
    );
  }

  buildHeaderSection  () {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.r,
          height: 100.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            image: DecorationImage(
              image: AssetImage(ImagePaths.LOGO),
              fit: BoxFit.fill
            )
          ),
        ),
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text("Username", style: boldText(20.sp, TEXT_COLOR),),
            SizedBox(height: 5,),
            Text("Username@gmail.com", style: boldText(16.sp, kGrey400),),

          ],
        )
      ],
    );

  }

  buildCountSection () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        itemCount(AppConfig.labels!.my_orders, Icons.shopping_cart,AppConfig.orders.length),
        itemCount(AppConfig.labels!.favorites, Icons.favorite_rounded,AppConfig.likedItems.length),
      ],
    );
  }

  itemCount(String title , IconData iconData , int count) {
    return Column(
      children: [
        SizedBox(height: 5  ,),
        Icon(iconData, color: MAIN,),
        SizedBox(height: 5  ,),
        Text(title,style: semiBoldText(14.sp, GREY_TEXT_COLOR),),
        SizedBox(height: 2  ,),
        Text(count.toString(),style: normalText(18.sp , TEXT_COLOR),)
      ],
    );
  }

  buildMyWallet() {
    return Container(
      alignment: Alignment.center,
      width: MyDimensions.screenWidth,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: MAIN
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("248 " + AppConfig.labels!.sar,style: boldText(28.sp, Colors.white),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
            AppConfig.labels!.my_wallet,
            style: boldText(14.sp, TEXT_COLOR),
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: WHITE),
          )
        ],
      ),
    );
  }

  buildListItem(title ,{IconData? iconData, String? image}  ) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          height: 60.h,
          width: 50.w,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: PINK_GG_COLOR
          ),
          child: iconData != null ? Icon(iconData,color: MAIN,): Image.asset(image!,width: 30,height: 30,),
          alignment: Alignment.center,
        ),
        SizedBox(width: 20.w,),
        Text(title , style: semiBoldText(14.sp, TEXT_COLOR),),
        Spacer(),
        Icon(Icons.arrow_forward_ios, size: 16,)

      ],
    );
  }
}
