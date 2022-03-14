import 'package:flutter/material.dart';
import 'package:submission_v2/common/navigation.dart';
import 'package:submission_v2/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'dKaffein',
        navigatorKey: navigatorKey,
        initialRoute: SplashScreenPage.routeName,
        routes: {
          SplashScreenPage.routeName: (context) => SplashScreenPage(),
          MainPage.routeName: (context) => MainPage(),
          RestaurantPage.routeName: (context) => RestaurantPage(),
          DetailPage.routeName: (context) => DetailPage(id: ModalRoute.of(context)?.settings.arguments as String),
          SettingPage.routeName: (context) => SettingPage(),
          SearchPage.routeName: (context) => SearchPage(),
          FavoritePage .routeName:(context) => FavoritePage(),
          ReviewPage.routeName: (context) => ReviewPage(id: ModalRoute.of(context)?.settings.arguments as String),

        }
        // DetailScreen.routeName: (context) => DetailScreen(
        //   restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        // ),
        // FavoriteScreen.routeName: (context) => FavoriteScreen(),
        );
  }
}
