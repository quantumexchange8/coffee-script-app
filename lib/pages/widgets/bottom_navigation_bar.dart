import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

List<String> iconAddress = [
  'assets/iconImage/home-3-line',
  'assets/iconImage/shopping-cart-2-line',
  'assets/iconImage/heart-3-line',
  'assets/iconImage/user-line',
];

Image baseIcon(String iconAddress) => Image.asset(
      '$iconAddress-black.png',
      fit: BoxFit.fitHeight,
      //  cacheHeight: height15.toInt(),
    );
Widget activeIcon(String iconAddress) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          '$iconAddress-white.png',
          fit: BoxFit.fitHeight,
          height: height24,
        ),
      ],
    );

final List<TabItem> tabItems = iconAddress
    .map(
      (e) => TabItem(
        icon: baseIcon(e),
        activeIcon: activeIcon(e),
        title: null,
      ),
    )
    .toList();

Widget customBottomNavigationBar(
    {required void Function(int) onTap, TabController? tabController}) {
  return StyleProvider(
    style: StyleBottomBar(),
    child: ConvexAppBar(
      style: TabStyle.reactCircle,
      items: tabItems,
      activeColor: backgroundColor,
      backgroundColor: primaryColor,
      color: Colors.black,
      curveSize: width10 * 6,
      top: -(height10 * 1.5),
      height: height20 * 4,
      onTap: onTap,
      controller: tabController,
      // chipBuilder: CustomChip(),
    ),
  );
}

class StyleBottomBar extends StyleHook {
  @override
  double get activeIconSize => height24;

  @override
  double get activeIconMargin => height20;

  @override
  double get iconSize => height24;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: height24 / 2, color: color, height: 1.8);
  }
}

// class CustomChip extends ChipBuilder {
//   @override
//   Widget build(BuildContext context, Widget child, int index, bool active) {
//     return Stack(
//       alignment: Alignment.center,
//       children: <Widget>[
//         child,
//         Positioned.fill(
//           child: Align(
//             alignment: Alignment.topRight,
//             child: Container(
//               margin: EdgeInsets.only(top: 10, right: 10),
//               padding: EdgeInsets.only(left: 4, right: 4),
//               child: Icon(Icons.access_alarm, color: Colors.redAccent),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
