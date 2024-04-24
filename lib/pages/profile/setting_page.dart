import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/notification/widgets.dart';
import 'package:coffee_script_app/pages/profile/setting_widgets/setting_row.dart';
import 'package:coffee_script_app/pages/widgets/outside_appbar.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingNavigationItems = [
      {
        'icon_address': 'assets/iconImage/bell.png',
        'navigation_name': 'Notification setting',
        'next_page': null,
      },
      {
        'icon_address': 'assets/iconImage/password_manager.png',
        'navigation_name': 'Password Manager',
        'next_page': null,
      },
      {
        'icon_address': 'assets/iconImage/delete_account.png',
        'navigation_name': 'Delete Account',
        'next_page': null,
      },
    ];

    return Scaffold(
      appBar: outsideAppBar(context, title: 'Settings'),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: height24),
        itemCount: settingNavigationItems.length,
        itemBuilder: (context, index) {
          final item = settingNavigationItems[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width20),
                child: settingRow(context,
                    nextPage: item['next_page'],
                    iconAddress: item['icon_address'],
                    navigationName: item['navigation_name']),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height24 / 2),
                child: appDivider,
              )
            ],
          );
        },
      ),
    );
  }
}
