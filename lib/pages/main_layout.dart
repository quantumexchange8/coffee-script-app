import 'package:coffee_script_app/pages/cart/cart_page.dart';
import 'package:coffee_script_app/pages/favourite/favourite_page.dart';
import 'package:coffee_script_app/pages/home/home_page.dart';
import 'package:coffee_script_app/pages/profile/profile_page.dart';
import 'package:fade_indexed_stack/fade_indexed_stack.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _pageNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIndexedStack(
        index: _pageNo,
        children: const [
          HomePage(),
          CartPage(),
          FavouritePage(),
          ProfilePage()
        ],
      ),
      // bottomNavigationBar: NavigationBar(
      //   destinations: [
      //     NavigationDestination(),
      //     NavigationDestination(),
      //     NavigationDestination(),
      //   ],
      //   selectedIndex: _currentIndex,
      //   onDestinationSelected: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
    );
  }
}
