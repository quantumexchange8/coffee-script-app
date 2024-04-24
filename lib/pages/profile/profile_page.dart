import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/home/home_page.dart';
import 'package:coffee_script_app/pages/profile/my_order_page.dart';
import 'package:coffee_script_app/pages/profile/privacy_and_policy_page.dart';
import 'package:coffee_script_app/pages/profile/profile_widget/profile_image_column.dart';
import 'package:coffee_script_app/pages/profile/profile_widget/profile_navigation_row.dart';
import 'package:coffee_script_app/pages/profile/setting_page.dart';
import 'package:coffee_script_app/pages/widgets/simple_appbar.dart';
import 'package:coffee_script_app/pages/widgets/white_icon_button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> navigationItems = [
      {
        'icon_address': 'assets/iconImage/user-line-white.png',
        'navigation_name': 'Your Profile',
        'navigation_page': null,
      },
      {
        'icon_address': 'assets/iconImage/article-line.png',
        'navigation_name': 'My Orders',
        'navigation_page': const MyOrderPage(),
      },
      {
        'icon_address': 'assets/iconImage/setting-line.png',
        'navigation_name': 'Setting',
        'navigation_page': const SettingPage(),
      },
      {
        'icon_address': 'assets/iconImage/git-repository-private-line.png',
        'navigation_name': 'Privacy Policy',
        'navigation_page': const PrivacyAndPolicyPage(),
      },
      {
        'icon_address': 'assets/iconImage/user-add-line.png',
        'navigation_name': 'Invite Friend',
        'navigation_page': null,
      },
      {
        'icon_address': 'assets/iconImage/logout-box-r-line.png',
        'navigation_name': 'Logout',
        'navigation_page': null,
      },
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: simpleAppBar(context, title: 'Profile', actions: [
        whiteIconButton(
          'assets/iconImage/notification-4-line-white.png',
          onPressed: () {},
        )
      ]),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: height24, horizontal: width20),
        children: [
          profileImageColumn(
              userImage: userInfo['user_image'],
              userName: userInfo['user_name']),
          SizedBox(
            height: height31,
          ),
          ...navigationItems
              .mapIndexed((i, e) => Padding(
                    padding: EdgeInsets.only(
                        bottom:
                            determineIsLast(i, navigationItems) ? 0 : height20),
                    child: profileNavigationRow(context,
                        iconAddress: e['icon_address'],
                        navigationName: e['navigation_name'],
                        nextPage: e['navigation_page'],
                        onTap: e['navigation_name'] == 'Logout' ? () {} : null),
                  ))
              .toList()
        ],
      ),
    );
  }
}
