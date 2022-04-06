import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lawazem/BaseModule/BaseScreen.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';

class SearchScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchScreenState();
}

class SearchScreenState extends BaseState<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  List<String> recentSearch = [
    AppConfig.labels!.jacket,
    AppConfig.labels!.handBag,
    AppConfig.labels!.gloves,
    AppConfig.labels!.spectacle,
    AppConfig.labels!.kimono,
  ];

  List<CategoryModel> categories = [
    CategoryModel(ImagePaths.CATEGORY_ONE, AppConfig.labels!.blazer),
    CategoryModel(ImagePaths.CATEGORY_TWO, AppConfig.labels!.hat),
    CategoryModel(ImagePaths.CATEGORY_FOUR, AppConfig.labels!.suits),
    CategoryModel(ImagePaths.CATEGORY_THREE, AppConfig.labels!.dress),
    CategoryModel(ImagePaths.CATEGORY_FIVE, AppConfig.labels!.blazer),
    CategoryModel(ImagePaths.CATEGORY_SIX, AppConfig.labels!.blazer),
  ];

  @override
  Widget getScreenBody(BuildContext context) {
    return Container(
      color: WHITE,
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(start: 28.r, end: 28.r, top: 85.r),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSearchBar(),
          buildRecentList(),
          buildCategoriesList(),
        ],
      ),
    );
  }

  buildSearchBar() {
    return Flexible(
      flex: 1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          myTextFormField(280.r, 55.r, GREY_BG, AppConfig.labels!.search,
              searchController, validate,
              prefixIcon: Image.asset(ImagePaths.SEARCH_ICON)),
          Text(
            AppConfig.labels!.cancel,
            style: normalText(15.sp, GREY_TEXT_COLOR),
          )
        ],
      ),
    );
  }

  String? validate(String? text) {
    return null;
  }

  buildRecentList() {
    return Container(
      margin: EdgeInsets.only(top: 24.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConfig.labels!.recent,
            style: boldText(18.sp, BLACK_TEXT),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: recentSearch
                .map<Widget>((recentItem) => buildRecentSearchItem(recentItem))
                .toList(),
          )
        ],
      ),
    );
  }

  buildRecentSearchItem(String recentItem) {
    return Container(
      width: 100.r,
      height: 40.r,
      margin: EdgeInsetsDirectional.only(top: 13.r, end: 12.r),
      decoration: BoxDecoration(
          color: PINK_GG_COLOR,
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            recentItem,
            style: normalText(14.sp, MAIN),
          ),
          Icon(
            Icons.close,
            color: MAIN,
            size: 10.r,
          )
        ],
      ),
    );
  }

  buildCategoriesList() {
    return Flexible(
        flex: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.0.r),
              child: Text(
                AppConfig.labels!.categories,
                style: boldText(18.sp, BLACK_TEXT),
              ),
            ),
            Expanded(
                child: StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    itemCount: categories.length,
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 2.4 : 1.8),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 20.0,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(categories[index].image),
                                fit: BoxFit.fill),
                            color: BLACK_WITH_OPACITY,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: BLACK_WITH_OPACITY,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              categories[index].name,
                              style: normalText(18.sp, WHITE),
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}

class CategoryModel {
  String image, name;
  CategoryModel(this.image, this.name);
}
