import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/home/product_dummy.dart';
import 'package:coffee_script_app/pages/home/widgets/product_gridview.dart';
import 'package:coffee_script_app/pages/home/widgets/product_type_row.dart';
import 'package:coffee_script_app/pages/home/widgets/promotion_container.dart';
import 'package:coffee_script_app/pages/home/widgets/user_name_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTypeIndex = 0;
  Map<String, dynamic> userInfo = {
    'user_name': 'Shahzaib R.',
    'user_image':
        'https://plus.unsplash.com/premium_photo-1683121366070-5ceb7e007a97?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D'
  };

  List<Map<String, dynamic>> searchProductType(String productType) {
    return allProduct
        .where((element) =>
            element['product_type'].toString().toLowerCase() == productType)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final hotCoffeesProducts = searchProductType('hot coffees');
    final iceTeasProducts = searchProductType('ice teas');
    final hotTeasProducts = searchProductType('hot teas');
    final drinksProducts = searchProductType('drinks');
    final bakeryProducts = searchProductType('bakery');

    final allCategory = [
      hotCoffeesProducts,
      iceTeasProducts,
      hotTeasProducts,
      drinksProducts,
      bakeryProducts,
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: height10 * 7,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width20,
            ),
            child: userNameRow(
              userImageUrl: userInfo['user_image'],
              userName: userInfo['user_name'],
              onPressedSearch: () {},
              onPressedNotification: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height08 * 2,
              horizontal: width20,
            ),
            child: promotionContainer,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: width20,
            ),
            scrollDirection: Axis.horizontal,
            child: productTypeRow(
              currentTypeIndex,
              onPressedType: (index) {
                setState(() {
                  currentTypeIndex = index;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height08 * 2,
              horizontal: width20,
            ),
            child: productGridview(allCategory[currentTypeIndex]),
          )
        ],
      ),
    );
  }
}
