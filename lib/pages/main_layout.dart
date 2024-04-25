import 'package:coffee_script_app/pages/widgets/bottom_navigation_bar.dart';
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

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _pageNo = 0;
  int _previousIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  void onTapBack() {
    int newIndex = _pageNo;
    setState(() {
      _pageNo = _previousIndex;
      _previousIndex = newIndex;
      _tabController.animateTo(_pageNo);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIndexedStack(
        index: _pageNo,
        children: [
          const HomePage(),
          CartPage(
            onTapBack: onTapBack,
          ),
          FavouritePage(
            onTapBack: onTapBack,
          ),
          ProfilePage(
            onTapBack: onTapBack,
          )
        ],
      ),
      bottomNavigationBar: customBottomNavigationBar(
        tabController: _tabController,
        onTap: (index) {
          setState(() {
            _previousIndex = _pageNo;
            _pageNo = index;
          });
        },
      ),
    );
  }
}
