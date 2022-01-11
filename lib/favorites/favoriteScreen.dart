import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Products/ProductDetails.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/SharedPref.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:rxdart/rxdart.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  BehaviorSubject<bool> rxUpdateChange = BehaviorSubject();
  @override
  void initState() {
    // TODO: implement initState
    rxUpdateChange.sink.add(true);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    rxUpdateChange.sink.add(false);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<bool>(
        stream: rxUpdateChange.stream,
        builder: (context, snapshot) {
          return Container(
            height: MyDimensions.screenHeight,
            width: MyDimensions.screenWidth,
            color: WHITE,
            child: AppConfig.likedItems.length > 0 ?
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    itemCount: AppConfig.likedItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      var product = AppConfig.likedItems[index];
                      return GestureDetector(
                          onTap: (){
                            navigateTo(context, ProductDetailsScreen(product));
                          },
                          child: _buildProductItem(index, product));
                    },
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 4.5 : 3.1),
                    mainAxisSpacing: 25.0,
                    crossAxisSpacing: 20.0,
                  ),
                ],
              ),
            ):
            EmptyFavoriteScreen()
          );
        }
    );
  }Widget _buildProductItem(int index, ProductModel product) {
    ImageProvider image;

    if (product.images!.length > 0) {
      image = NetworkImage(product.images![0].src!);
    } else
      image = AssetImage(ImagePaths.NO_IMAGE);

    return GestureDetector(
      onTap: (){
        navigateTo(context, ProductDetailsScreen(product));
      },
      child: Stack(
        children: [
          Container(
              child: new Column(
                children: [
                  Container(
                    height: index.isEven
                        ? MyDimensions.screenHeight * .32
                        : MyDimensions.screenHeight * .22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                          child: Text(
                            product.name!.trim(),
                            maxLines: 2,
                            style: boldText(18.sp, Colors.black87),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                          child: Text(
                            product.price!+" " + AppConfig.labels!.sar,
                            style: boldText(18.sp, MAIN),
                          )),
                    ],
                  ),
                ],
              )),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
                onTap: (){
                  deleteItemFromFavorite(product);
                },
                child: likedWidget(true)),),
        ],
      ),
    );
  }


  void deleteItemFromFavorite(ProductModel e) {
    showDialog(context: context, builder: (builder){
      return confirmationDialogWithOptions(AppConfig.labels!.alert, "Un Like ?" , context,(){
        AppConfig.likedItems.removeWhere((element) => element.id == e.id);
        SharedPref.saveLikes(AppConfig.likedItems);
        rxUpdateChange.sink.add(true);
      },
              (){
          Navigator.pop(context);
          }
      );

    });


  }
}
class EmptyFavoriteScreen extends StatelessWidget {
  const EmptyFavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WHITE,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImagePaths.FAV_BASKET),
          SizedBox(height: 12,),
          Text(AppConfig.labels!.empty_fav , style: boldText(28.sp, TEXT_COLOR),),
          SizedBox(height: 12,),
          Text(AppConfig.labels!.empty_fav_phrase, style: semiBoldText(18.sp, GREY_COLOR), textAlign: TextAlign.center,)

        ],
      ),
    );
  }
}
