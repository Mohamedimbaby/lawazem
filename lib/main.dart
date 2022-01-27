import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawazem/Services/ApiNetwork.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/SharedPref.dart';
import 'package:lawazem/language/LangaugeBloc.dart';
import 'package:lawazem/language/LanguageState.dart';

import 'OnBoarding/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initShared();
  ApiNetworkService.setAppFlavour(AppFlavour.staging);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool kReleaseMode = false;
  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;
    return BlocProvider(
        create: (c) => LanguageBloc(),
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(  statusBarColor: MAIN_COLOR,statusBarBrightness: Brightness.light));
            debugPrint(
                state.locale != null ? state.locale!.languageCode : "en");
            if (SharedPref.getLang() == null || state.locale != null) {
              SharedPref.saveLang(
                  state.locale != null ? state.locale!.languageCode : "en");
            }

            //SharedPref.saveContext(context);
            return ScreenUtilInit(
                designSize: Size(375, 812),
                builder: () => MaterialApp(
                        //navigatorKey: AppConfig.navKey,
                        localizationsDelegates: [
                          // ... app-specific localization delegate[s] here
                          // TODO: uncomment the line below after codegen
                          AppLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                        ],
                        supportedLocales: [
                          const Locale('ar', ''), // Arabic, no country code
                          const Locale('en', ''), // English, no country code
                          const Locale('es', ''), // English, no country code
                          const Locale('ur', ''), // English, no country code
                          // ... other locales the app supports
                        ],
                        locale:
                            state.locale ?? Locale(SharedPref.getLang()!, ""),
                        theme: ThemeData(
                          primaryColor: MAIN,
                        ).copyWith(
                          pageTransitionsTheme: const PageTransitionsTheme(
                            builders: <TargetPlatform, PageTransitionsBuilder>{
                              TargetPlatform.android:
                                  ZoomPageTransitionsBuilder(),
                            },
                          ),
                        ),
                        debugShowCheckedModeBanner: false,
                        home: PageTransitionSwitcher(
                            transitionBuilder: (
                              Widget child,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                            ) {
                              return FadeThroughTransition(
                                animation: animation,
                                secondaryAnimation: secondaryAnimation,
                                child: child,
                              );
                            },
                            child: MySplashScreen())));
          },
        )

        // Wrap your app
        );
  }
}
