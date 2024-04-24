// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_script_app/controller/controller.dart';
import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/models/cart_item.dart';
import 'package:coffee_script_app/pages/cart/cart_widgets/product_selected_container.dart';
import 'package:coffee_script_app/pages/cart/cart_widgets/product_summary_container.dart';
import 'package:coffee_script_app/pages/cart/cart_widgets/comfirm_remove_item_dialog.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:coffee_script_app/pages/cart/cart_widgets/title_description_column.dart';
import 'package:coffee_script_app/pages/widgets/simple_appbar.dart';
import 'package:coffee_script_app/pages/widgets/white_icon_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = cartController.cartProductList;

  @override
  Widget build(BuildContext context) {
    int cartCount = cartItems.length;

    double subTotal = 0;

    for (var i = 0; i < cartItems.length; i++) {
      subTotal +=
          (cartItems[i].product.productPrice * cartItems[i].productCount);
    }

    const shippingCost = 6.0;
    double total = subTotal + shippingCost;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: simpleAppBar(context, title: 'Cart', actions: [
        whiteIconButton(
          'assets/iconImage/notification-4-line-white.png',
          onPressed: () {},
        )
      ]),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width20),
            child: orderDescriptionColumn(cartCount),
          ),
          SizedBox(
            height: height30,
          ),
          ...cartItems
              .mapIndexed((i, e) => Padding(
                    padding: EdgeInsets.only(bottom: height24 / 2),
                    child: productSelectedContainer(
                      productImage: e.product.productImage,
                      productName: e.product.productName,
                      productIngredients: e.product.productIngredient,
                      productPrice: e.product.productPrice.toString(),
                      productCount: e.productCount,
                      onTapMinus: () {
                        setState(() {
                          cartItems[i].productCount -= 1;
                        });
                      },
                      onTapAdd: () {
                        setState(() {
                          cartItems[i].productCount += 1;
                        });
                      },
                      onTapDelete: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              comfirmRemoveItemDialog(context),
                        ).then((yesRemove) {
                          if (yesRemove != null && yesRemove) {
                            setState(() {
                              cartItems.removeAt(i);
                            });
                          }
                        });
                      },
                    ),
                  ))
              .toList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width20),
            child: productSummaryContainer(
                subTotal: subTotal, shippingCost: shippingCost, total: total),
          ),
          SizedBox(
            height: height08 * 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width20),
            child: outlinedButton(
                onPressed: () {},
                text: 'Finalize Order',
                size: Size(width100 * 3.5, height10 * 5.9),
                borderThickness: 1.5,
                textColor: textColor),
          )
        ],
      ),
    );
  }
}
