import 'package:connectivity/connectivity.dart';import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:lawazem/BaseModule/BaseModel.dart';import 'package:lawazem/Services/Connectivity.dart';import 'package:lawazem/Utils/Colors.dart';import 'package:lawazem/Utils/Dimensions.dart';abstract class BaseStatefulWidget extends StatefulWidget {}abstract class BaseStatelessWidget extends StatelessWidget {  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();  @override  Widget build(BuildContext context) {    // TODO: implement build    return Scaffold(        key: scaffoldKey,        body: GestureDetector(          child: Container(            width: MyDimensions.screenWidth,            height: MyDimensions.screenHeight,            child: getScreenBody(context),          ),        ));  }  Widget getScreenBody(BuildContext context);}abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();  refresh(BaseModel viewModel) {    return null;  }  refreshList(List<BaseModel> viewModel) {    return null;  }  List<List<BaseModel>> results = [];  List<Function> functions = [];  @override  void initState() {    // TODO: implement initState    ConnectivityService.subscription.onConnectivityChanged.listen((event) {      if (event != ConnectivityResult.none) {        debugPrint("connected again");        if (results != null) {          for (int i = 0; i < results.length; i++) {            if (results[i] != null && results[i].isEmpty) {              functions[i]();              functions.removeAt(i);            }          }        } else          debugPrint("data already ");      } else        debugPrint("connection missing");    });    super.initState();    // checkDeepLink();  }  void getWhenConnection(List<BaseModel> results, Function function) {    this.results.add(results);    this.functions.add(function);  }  @override  void dispose() {    // TODO: implement dispose    super.dispose();    disposeScreen();  }  @override  Widget build(BuildContext context) {    return AnnotatedRegion(        value: SystemUiOverlayStyle.dark.copyWith(          statusBarColor: MAIN,          statusBarIconBrightness: Brightness.light,        ),        child: Scaffold(          appBar: null,          key: scaffoldKey,          body: Container(            color: WHITE,            width: MyDimensions.screenWidth,            height: MyDimensions.screenHeight,            child: getScreenBody(context),          ),          // appBar: getAppBar(),          drawer: getDrawer(),          endDrawer: getEndDrawer(),          // bottomNavigationBar: getBottomNavigationBar(),        ));  }  Widget getScreenBody(BuildContext context);  Widget getBottomNavigationBar() {    return Opacity(opacity: 0, child: Container());  }  disposeScreen() {}/*  PreferredSizeWidget? getAppBar(){    return PreferredSizeWidget();  }*/  Widget getDrawer() {    return Opacity(opacity: 0, child: Container());  }  Widget getEndDrawer() {    return Opacity(opacity: 0, child: Container());  }/*  void checkDeepLink  () async{    FirebaseDynamicLinks.instance.onLink(        onSuccess: (c)async{          int id =int.parse(DynamicLinkService.handleDeepLink(c));          if (id !=null) {            debugPrint("hiiiiiiiiiiiiiiiiiiiiiii $id");         await Future.delayed(Duration(seconds : 3),(){             Navigator.push(context, MaterialPageRoute(               builder: (context) {                 return MultiBlocProvider(                   providers: [                     BlocProvider(                       create: (c) => TripBloc(TripListRepository()),                     ),                     BlocProvider(                       create: (c)=> FavoriteBloc(FavoriteRepository()),                     )                   ],                   child: TripDetailsScreen(id),                 );               },             ));           });          }        },        onError: (error)async{          debugPrint("dynamic date failed $error");        }    );  }*/}