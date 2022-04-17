import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawazem/Auth/Login/LoginScreen.dart';
import 'package:lawazem/BaseModule/BaseScreen.dart';
import 'package:lawazem/Home/HomeScreen.dart';
import 'package:lawazem/Products/ProductBloc.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/SharedPref.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingWidget extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OnBoardingState();
  }
}

class OnBoardingState extends BaseState<OnBoardingWidget> {
  int page = 0;
  PageController controller =
      PageController(viewportFraction: 1.0, keepPage: true);
  BehaviorSubject<int> rxPageViewer = BehaviorSubject();
  bool isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    rxPageViewer.sink.add(page);
    checkIfItIsLoggedIn();
    super.initState();
  }

  @override
  Widget getScreenBody(BuildContext context) {
    // TODO: implement getScreenBody
    return getSlides(AppConfig.onBoardingData["onBoardingData"]!);
  }

  Widget getSlides(List<Map<String, String>> data) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MyDimensions.screenHeight * .75,
              child: PageView.builder(
                controller: controller,
                itemCount: 3,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                        height: MyDimensions.screenHeight * .8,
                        child: onBoardingItem(data[index])),
                  );
                },
                onPageChanged: (index) {
                  page = index;
                  rxPageViewer.sink.add(index);
                },
              ),
            ),
            SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: MAIN,
                  radius: 8,
                  spacing: 10,
                  dotHeight: 12,
                  dotWidth: 12,
                )),
            StreamBuilder<int>(
                stream: rxPageViewer.stream,
                builder: (context, pageNumber) {
                  if (pageNumber.hasData)
                    return GestureDetector(
                      onTap: () {
                        if (pageNumber.data == data.length - 1) {
                          onTapDone();
                        } else {
                          controller.jumpToPage((pageNumber.data!) + 1);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MyDimensions.screenWidth,
                        padding: const EdgeInsetsDirectional.only(
                            start: 20, end: 20, top: 20, bottom: 20),
                        margin: const EdgeInsets.all(50),
                        decoration: BoxDecoration(
                            color: MAIN, borderRadius: BorderRadius.circular(32)),
                        child: Text(
                          getButtonText(page),
                          style: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  else
                    return Container();
                }),
          ],
        ),
      ),
    );
  }

  Widget onBoardingItem(data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MyDimensions.screenHeight * .1,
        ),
        Container(
            width: MyDimensions.screenWidth,
            height: MyDimensions.screenHeight * .4,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    data['image'],
                  )),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          data['title'],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            height: 1.1,
            color: kHeadLine,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          data['desc'],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
            color: kGrey400,
          ),
        ),
      ],
    );
  }

  void onTapDone() {
    if(isLoggedIn){
      navigateTo(context, BlocProvider(
          create: (c)=>ProductBloc(),
          child: LoginScreen()));
    }else{
      navigateTo(context, BlocProvider(
          create: (c)=>ProductBloc(),
          child: LoginScreen()));
    }
  }

  @override
  void dispose() {
    rxPageViewer.close();
    super.dispose();
  }

  String getButtonText(int? pageNumber) {
    if (pageNumber! == 2) {
      return AppConfig.labels!.getStarted;
    }
    return AppConfig.labels!.next;
  }

  void checkIfItIsLoggedIn() {
    if (SharedPref.getLoggedIn()!=null && SharedPref.getLoggedIn()) {
      isLoggedIn = true;
    }
  }
}
