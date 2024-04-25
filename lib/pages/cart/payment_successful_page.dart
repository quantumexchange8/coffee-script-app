import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/cart/payment_successful_widgets/successful_column.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:coffee_script_app/pages/universal/track_order_page.dart';
import 'package:coffee_script_app/pages/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  const PaymentSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: simpleAppBar(context, title: ''),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width10 * 1.8, vertical: height24),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            successfulColumn(
                iconData: Icons.check_circle_sharp,
                title: 'Payment Successful',
                description: 'Thank you for your purchase'),
            const Expanded(flex: 5, child: SizedBox()),
            filledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrackOrderPage(),
                      ));
                },
                text: 'Track Order')
          ],
        ),
      ),
    );
  }
}
