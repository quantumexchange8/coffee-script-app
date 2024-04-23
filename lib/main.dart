// ignore_for_file: use_build_context_synchronously

// import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:coffee_script_app/controller/cart_controller.dart';
// import 'package:coffee_script_app/controller/controller.dart';
import 'package:coffee_script_app/controller/product_controller.dart';
import 'package:coffee_script_app/controller/timeline_controller.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/auth/login_page.dart';
import 'package:coffee_script_app/pages/home/home_page.dart';
import 'package:coffee_script_app/pages/notification/notification_page.dart';
import 'package:coffee_script_app/pages/onboarding/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future.delayed(const Duration(milliseconds: 200)).then((val) async {
    Get.put(ProductController());
    Get.put(CartController());
    Get.put(TimelineController());
    runApp(const MyApp());
  }, onError: (error) {});
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Script App',
      theme: ThemeData(

          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: const NotificationPage(),
      //  FlutterSplashScreen.fadeIn(
      //   backgroundImage: Image.asset(
      //       'assets/backgroundPicture/splash_screen.png',
      //       fit: BoxFit.cover),
      //   childWidget: Image.asset(
      //     'assets/logo/coffeescript_logo.png',
      //     fit: BoxFit.fitHeight,
      //     height: height100 * 1.57,
      //   ),
      //   asyncNavigationCallback: () async {
      //     SharedPreferences prefs = await SharedPreferences.getInstance();

      //     bool? firstTime = prefs.getBool('first_time');

      //     if (firstTime != null && firstTime) {
      //       prefs.setBool('first_time', false);
      //       Navigator.pushReplacementNamed(context, 'splashRoute');
      //       return;
      //     } else {
      //       bool getProductSuccess = await productController.getProductList();

      //       if (!getProductSuccess) {
      //         Navigator.pushReplacementNamed(context, 'loginRoute');
      //         return;
      //       }

      //       Navigator.pushReplacementNamed(context, 'homeRoute');
      //       return;
      //     }
      //   },
      // ),
      routes: {
        'loginRoute': (p0) => const LoginPage(),
        'homeRoute': (p0) => const HomePage(),
        'splashRoute': (p0) => const SplashPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
