import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lawazem/Account/AccountScreen.dart';
import 'package:lawazem/Cart/CartScreen.dart';
import 'package:lawazem/Models/ProductsModel.dart';
import 'package:lawazem/Models/UiModels/TabModel.dart';
import 'package:lawazem/Offers/OffersScreen.dart';
import 'package:lawazem/Products/ProductBloc.dart';
import 'package:lawazem/Products/ProductDetails.dart';
import 'package:lawazem/Products/ProductEvent.dart';
import 'package:lawazem/Products/ProductState.dart';
import 'package:lawazem/Products/ProductsRepo.dart';
import 'package:lawazem/Search/SearchScreen.dart';
import 'package:lawazem/Utils/AppConfig.dart';
import 'package:lawazem/Utils/Colors.dart';
import 'package:lawazem/Utils/Dimensions.dart';
import 'package:lawazem/Utils/ImagesPathes.dart';
import 'package:lawazem/Utils/Navigation.dart';
import 'package:lawazem/Utils/ResultStatusEnum.dart';
import 'package:lawazem/Utils/SharedPref.dart';
import 'package:lawazem/Utils/Styles.dart';
import 'package:lawazem/Utils/Widgets.dart';
import 'package:lawazem/favorites/favoriteScreen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late ProductBloc bloc;
  TextEditingController searchController = TextEditingController();
  PageController controller =
      PageController(viewportFraction: 0.8, keepPage: true);
  BehaviorSubject<int> rxTabIndex = BehaviorSubject();
  BehaviorSubject<bool> rxLikeProduct = BehaviorSubject();
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  var _bottomNavIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.shopping_cart,
    Icons.favorite,
    Icons.person,
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    rxTabIndex.close();
    rxLikeProduct.close();
    super.dispose();
  }

  List<TabModel> tabs = [];
  HomeTabs currentHomeTab = HomeTabs.recent;

  @override
  void initState() {
    // TODO: implement initState

    bloc = context.read<ProductBloc>();
    bloc.add(ProductEvent(currentHomeTab));
    rxTabIndex.sink.add(0);
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      TabModel(AppConfig.labels!.recent, 0),
      TabModel(AppConfig.labels!.top, 1),
    ];
    return Scaffold(
      backgroundColor: WHITE,
      body: SingleChildScrollView(
        child: getBody(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MAIN,
        onPressed: () {
          setState(() {
            _bottomNavIndex = 4;
          });
        },
        child: Image.asset(ImagePaths.ICON1),
        //params
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        activeColor: MAIN,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        inactiveColor: GREY_ICON,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          if (index == 1) {
            navigateTo(context, CartScreen());
          } else
            setState(() => _bottomNavIndex = index);
        },
        //other params
      ),
    );
  }

  Widget _buildProductItem(int index, ProductModel product) {
    ImageProvider image;

    if (product.images!.length > 0) {
      image = NetworkImage(product.images![0].src!);
    } else
      image = AssetImage(ImagePaths.NO_IMAGE);

    return GestureDetector(
      onTap: () {
        navigateTo(context, ProductDetailsScreen(product));
      },
      child: Stack(
        children: [
          Container(
              child: new Column(
            children: [
              Container(
                height: index.isEven
                    ? MyDimensions.screenHeight * .25
                    : MyDimensions.screenHeight * .17,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.fitHeight,
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
                    style: boldText(16.sp, Colors.black87),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                      child: Text(
                    product.price! + " " + AppConfig.labels!.sar,
                    style: boldText(16.sp, MAIN),
                  )),
                ],
              ),
            ],
          )),
          Positioned(
            top: 10,
            right: 10,
            child: StreamBuilder<bool>(
                stream: rxLikeProduct.stream,
                builder: (context, snapshot) {
                  return GestureDetector(
                    onTap: () {
                      likeThisProduct(product);
                    },
                    child: likedWidget(checkIfLiked(product)),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Container buildPageView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: MyDimensions.screenHeight * .2,
      child: PageView.builder(
        controller: controller,
        itemCount: 3,
        itemBuilder: (_, index) {
          return bannerPagerImages(index);
        },
      ),
    );
  }

  String? validate(String? text) {
    return null;
  }

  bannerPagerImages(int index) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            image: DecorationImage(
              image: AssetImage(AppConfig.bannerPhotos[index]),
              fit: BoxFit.fitWidth,
            )));
  }

  Widget tabItem(TabModel e) {
    return StreamBuilder<int>(
        stream: rxTabIndex.stream,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              rxTabIndex.sink.add(e.index);
              currentHomeTab = getHomeTabs(e.index);
              bloc.add(ProductEvent(currentHomeTab));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                e.name,
                style: normalText(
                    16.sp, snapshot.data == e.index ? WHITE : GREY_TEXT_COLOR),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: snapshot.data == e.index ? MAIN : GREY_BG),
            ),
          );
        });
  }

  HomeTabs getHomeTabs(int index) {
    switch (index) {
      case 0:
        return HomeTabs.recent;
      case 1:
        return HomeTabs.top;
      case 2:
        return HomeTabs.trending;
      default:
        return HomeTabs.recommendation;
    }
  }

  void addToCache(List<ProductModel> products) {
    AppConfig.cachedData[currentHomeTab] = products;
  }

  getBody() {
    switch (_bottomNavIndex) {
      case 0:
        return buildHomeScreen();
      case 2:
        return FavoriteScreen();
      case 3:
        return AccountScreen();
      case 4:
        return OffersScreen();
      default:
        return Container();
    }
  }

  buildHomeScreen() {
    return Column(
      children: [
        SizedBox(
          height: 90.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: myTextFormField(
              MyDimensions.screenWidth,
              MyDimensions.screenHeight * .07,
              GREY_BG,
              AppConfig.labels!.find_your_fav_product,
              searchController,
              validate,
              prefixIcon: Icon(
                Icons.search,
                color: GREY_COLOR,
              ),
              onClick: openSearchScreen),
        ),
        SizedBox(
          height: 10.h,
        ),
        buildPageView(),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: MAIN,
                  radius: 8,
                  spacing: 10,
                  dotHeight: 6,
                  dotWidth: 8,
                )),
          ],
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tabs.map((e) => tabItem(e)).toList(),
            )),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (c, state) {
            if (state.status == ResultStatus.Loading) {
              return buildSkeleton();
            } else if (state.status == ResultStatus.Success) {
              addToCache(state.model!.products);
              return Container(
                child: StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  itemCount: state.model!.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    var product = state.model!.products[index];
                    return _buildProductItem(index, product);
                  },
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, index.isEven ? 3.4 : 2.8),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 20.0,
                ),
              );
            } else
              return Container(
                alignment: Alignment.center,
                child: Text(state.errorMessage ?? ""),
              );
          },
        ),
      ],
    );
  }

  checkIfLiked(product) {
    if (AppConfig.likedItems.map((e) => e.id).toList().contains(product.id)) {
      return true;
    } else
      return false;
  }

  void likeThisProduct(ProductModel product) {
    if (!checkIfLiked(product)) {
      AppConfig.likedItems.add(product);
      rxLikeProduct.sink.add(true);
    } else {
      AppConfig.likedItems.removeWhere((element) => element.id == product.id);
      rxLikeProduct.sink.add(true);
    }
    SharedPref.saveLikes(AppConfig.likedItems);
  }

  openSearchScreen() {
    navigateTo(context, SearchScreen());
  }
}
