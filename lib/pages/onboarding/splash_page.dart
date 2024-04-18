import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/onboarding/onboarding_page.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust duration as needed
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/backgroundPicture/splash_screen.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const Expanded(flex: 3, child: SizedBox()),
            FadeTransition(
              opacity: _animation,
              child: Image.asset(
                'assets/logo/coffeescript_logo.png',
                cacheHeight: (height100 * 1.57).toInt(),
                cacheWidth: (width100 * 2.1).toInt(),
              ),
            ),
            const Expanded(flex: 5, child: SizedBox()),
            FadeTransition(
              opacity: _animation,
              child: filledButton(
                  height: height10 * 5.3,
                  width: width100 * 2.42,
                  onPressed: () async => await pushReplacement(context,
                      nextPage: const OnboardingPage()),
                  text: 'Get Started'),
            ),
            const Expanded(child: SizedBox()),
          ],
        ));
  }
}
