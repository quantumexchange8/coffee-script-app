import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/product.dart';
import 'package:coffee_script_app/pages/favourite/widgets.dart';
import 'package:coffee_script_app/pages/home/widgets/product_container.dart';
import 'package:coffee_script_app/pages/widgets/simple_appbar.dart';
import 'package:coffee_script_app/pages/widgets/white_icon_button.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

List<Product> searchFavouriteProduct(List<Map<String, dynamic>> productList) {
  return productList
      .map((e) => Product.fromMap(e))
      .toList()
      .where((element) => element.favourite)
      .toList();
}

class _FavouritePageState extends State<FavouritePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> listOfFavouriteProduct = searchFavouriteProduct(_productList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: simpleAppBar(context, title: 'Favourite', actions: [
        whiteIconButton(
          'assets/iconImage/notification-4-line-white.png',
          onPressed: () {},
        )
      ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height24),
        child: Column(
          children: [
            searchFavouriteRow(
                onTapSearch: () {
                  setState(() {
                    if (_searchController.text.isNotEmpty) {
                      listOfFavouriteProduct = listOfFavouriteProduct
                          .where((element) => element.productName
                              .contains(_searchController.text))
                          .toList();
                    } else {
                      listOfFavouriteProduct =
                          searchFavouriteProduct(_productList);
                    }
                  });
                },
                searchController: _searchController),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: height24),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: width20,
                    mainAxisSpacing: height20),
                itemCount: listOfFavouriteProduct.length,
                itemBuilder: (context, index) {
                  final product = listOfFavouriteProduct[index];

                  return productContainer(
                      onTapFavourite: (liked) async {
                        setState(() {
                          listOfFavouriteProduct[index].favourite = liked;
                          listOfFavouriteProduct.removeAt(index);
                        });
                        return !liked;
                      },
                      radius: 0,
                      productImage: product.productImage,
                      productName: product.productName,
                      productPrice: product.productPrice.toInt().toString(),
                      productDescription: product.productDescription,
                      isFavourite: product.favourite);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

const List<Map<String, dynamic>> _productList = [
  {
    "product_id": "1",
    "product_name": "Arabica",
    "product_price": "18",
    "product_image": "assets/product/arabica.png",
    "product_type": "Hot Coffees",
    "product_ingredient": "Milk",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "true"
  },
  {
    "product_id": "2",
    "product_name": "Robusta",
    "product_price": "20",
    "product_image": "assets/product/robusta.png",
    "product_type": "Hot Coffees",
    "product_ingredient": "Milk",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "true"
  },
  {
    "product_id": "3",
    "product_name": "Excelsa",
    "product_price": "15",
    "product_image": "assets/product/excelsa.png",
    "product_type": "Hot Coffees",
    "product_ingredient": "Milk",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "true"
  },
  {
    "product_id": "4",
    "product_name": "Liberica",
    "product_price": "12",
    "product_image": "assets/product/liberica.png",
    "product_type": "Hot Coffees",
    "product_ingredient": "Water",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "true"
  },
  {
    "product_id": "5",
    "product_name": "Raspberry",
    "product_price": "18",
    "product_image": "assets/product/raspberry.png",
    "product_type": "Ice Teas",
    "product_ingredient": "Raspberry",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "false"
  },
  {
    "product_id": "6",
    "product_name": "Limiade",
    "product_price": "20",
    "product_image": "assets/product/limiade.png",
    "product_type": "Ice Teas",
    "product_ingredient": "Lemon",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "true"
  },
  {
    "product_id": "7",
    "product_name": "Hibiscus",
    "product_price": "15",
    "product_image": "assets/product/hibiscus.png",
    "product_type": "Ice Teas",
    "product_ingredient": "Lemon",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "false"
  },
  {
    "product_id": "8",
    "product_name": "Cirtus",
    "product_price": "12",
    "product_image": "assets/product/cirtus.png",
    "product_type": "Ice Teas",
    "product_ingredient": "Lemon",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "true"
  },
  {
    "product_id": "9",
    "product_name": "Black Tea",
    "product_price": "18",
    "product_image": "assets/product/black_tea.png",
    "product_type": "Hot Teas",
    "product_ingredient": "Water",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "false"
  },
  {
    "product_id": "10",
    "product_name": "Green Tea",
    "product_price": "20",
    "product_image": "assets/product/green_tea.png",
    "product_type": "Hot Teas",
    "product_ingredient": "Water",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "true"
  },
  {
    "product_id": "11",
    "product_name": "Olong Tea",
    "product_price": "15",
    "product_image": "assets/product/olong_tea.png",
    "product_type": "Hot Teas",
    "product_ingredient": "Water",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "false"
  },
  {
    "product_id": "12",
    "product_name": "Matcha",
    "product_price": "12",
    "product_image": "assets/product/matcha.png",
    "product_type": "Hot Teas",
    "product_ingredient": "Milk",
    "product_description": "Lorem ipsum dolor sit amet cons",
    "favourite": "false"
  }
];
