// ignore_for_file: use_build_context_synchronously

import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:coffee_script_app/controller/cart_controller.dart';
// import 'package:coffee_script_app/controller/controller.dart';
import 'package:coffee_script_app/controller/product_controller.dart';
import 'package:coffee_script_app/controller/timeline_controller.dart';
import 'package:coffee_script_app/controller/user_controller.dart';
import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/auth/login_page.dart';
import 'package:coffee_script_app/pages/main_layout.dart';
import 'package:coffee_script_app/pages/onboarding/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future.delayed(const Duration(milliseconds: 200)).then((val) async {
    Get.put(ProductController());
    Get.put(CartController());
    Get.put(TimelineController());
    Get.put(UserController());
    configLoading();
    runApp(const MyApp());
  }, onError: (error) {});
}

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return GetMaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Coffee Script App',
      theme: ThemeData(

          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      builder: EasyLoading.init(),
      home: FlutterSplashScreen.fadeIn(
        backgroundImage: Image.asset(
            'assets/backgroundPicture/splash_screen.png',
            fit: BoxFit.cover),
        childWidget: Image.asset(
          'assets/logo/coffeescript_logo.png',
          fit: BoxFit.fitHeight,
          height: height100 * 1.57,
        ),
        asyncNavigationCallback: () async {
          Future.delayed(const Duration(milliseconds: 2000)).then((val) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            bool? firstTime = prefs.getBool('first_time');

            if (firstTime != null && firstTime) {
              prefs.setBool('first_time', false);
              _navigatorKey.currentState?.pushReplacementNamed('splashRoute');
              return;
            } else {
              // bool getProductSuccess = await productController.getProductList();

              // if (!getProductSuccess) {
              _navigatorKey.currentState?.pushReplacementNamed('loginRoute');
              return;
              // }

              // _navigatorKey.currentState?.pushReplacementNamed('homeRoute');
              // return;
            }
          }, onError: (error) {});
        },
      ),
      routes: {
        'loginRoute': (p0) => const LoginPage(),
        'homeRoute': (p0) => const MainLayout(),
        'splashRoute': (p0) => const SplashPage(),
      },
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 500)
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = primaryColor
    ..backgroundColor = textColor
    ..indicatorColor = backgroundColor
    ..textColor = backgroundColor
    ..maskColor = primaryColor.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
