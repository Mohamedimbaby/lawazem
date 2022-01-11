import 'package:flutter/material.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Widgets.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: myTextFormField(
                MyDimensions.screenWidth,
                MyDimensions.screenHeight * .07,
                GREY_BG,
                AppConfig.labels!.search,
                searchController,
                validate,
                prefixIcon: Icon(
                  Icons.search,
                  color: GREY_COLOR,
                )),
          ),
          Column(
            children: [1,2,3,4].map((e) => buildOfferItem()).toList(),
          )
        ],
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
}
