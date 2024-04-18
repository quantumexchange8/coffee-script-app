import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/helper/icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

List<IconData> iconDatas = [
  CoffeeScriptIcons.home_3_line,
  CoffeeScriptIcons.shopping_cart_2_line,
  CoffeeScriptIcons.heart_3_line,
  CoffeeScriptIcons.user_line,
];

Icon baseIcon(IconData iconData) =>
    Icon(iconData, color: Colors.black, size: height24);
Icon activeIcon(IconData iconData) =>
    Icon(iconData, color: Colors.white, size: height24);

final List<TabItem> tabItems = iconDatas
    .map(
      (e) => TabItem(
        icon: baseIcon(e),
        activeIcon: activeIcon(e),
        title: null,
      ),
    )
    .toList();

Widget customBottomNavigationBar() {
  return StyleProvider(
    style: StyleBottomBar(),
    child: ConvexAppBar(
      style: TabStyle.reactCircle,
      items: tabItems,
      activeColor: Colors.white,
      backgroundColor: primaryColor,
      color: Colors.black,
      curveSize: width20,
      top: height10 * 0.95,
      height: height20 * 4,
      //  onTap: ,
      //  chipBuilder: ,
    ),
  );
}

class StyleBottomBar extends StyleHook {
  @override
  double get activeIconSize => height24;

  @override
  double get activeIconMargin => height30;

  @override
  double get iconSize => height24;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: height24 / 2, color: color, height: 1.8);
  }
}
