import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/cart/add_card_page.dart';
import 'package:coffee_script_app/pages/cart/checkout_widgets/checkout_detail_column.dart';
import 'package:coffee_script_app/pages/cart/checkout_widgets/product_list.dart';
import 'package:coffee_script_app/pages/cart/payment_successful_page.dart';
import 'package:coffee_script_app/pages/cart/sample_cart_items.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:coffee_script_app/pages/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: simpleAppBar(context, title: 'Checkout'),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width20),
            child: checkoutDetailColumn(
                onTapAddCard: () {},
                title: 'Deliver Address',
                iconAddress: 'assets/iconImage/map-pin-line.png',
                subtitle: 'Home',
                description: '1910, wien stadt, At',
                buttonText: 'Change'),
          ),
          SizedBox(
            height: height08 * 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width20),
            child: checkoutDetailColumn(
                onTapAddCard: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCardPage(),
                      ));
                },
                title: 'Add Payment Method',
                iconAddress: Icons.add,
                subtitle: 'Add Card',
                description: 'Credit or debit',
                buttonText: 'Add'),
          ),
          SizedBox(
            height: height30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width20),
            child: Text(
              'Product List',
              style: hintStyle.copyWith(color: textColor, fontSize: height20),
            ),
          ),
          SizedBox(
            height: height24,
          ),
          productList(cartItems: sampleCartItems1),
          SizedBox(
            height: height20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width20),
            child: filledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentSuccessfulPage(),
                      ));
                },
                text: 'Continue Payment'),
          )
        ],
      ),
    );
  }
}
