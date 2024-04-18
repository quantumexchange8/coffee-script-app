import 'package:coffee_script_app/helper/constant/text_style.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/auth/login_page.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:flutter/material.dart';

class OnboardingLayout extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final String description;
  final int pageNo;
  const OnboardingLayout(
      {super.key,
      required this.backgroundImage,
      required this.title,
      required this.description,
      required this.pageNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(flex: 3, child: SizedBox()),
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle.copyWith(fontSize: titleLarge),
          ),
          SizedBox(
            height: height08 * 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width30),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: descriptionStyle,
            ),
          ),
          const Expanded(flex: 5, child: SizedBox()),
          if (pageNo == 2)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                filledButton(onPressed: () {}, text: 'Register'),
                SizedBox(
                  height: height10,
                ),
                outlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    text: 'Sign In')
              ],
            ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
