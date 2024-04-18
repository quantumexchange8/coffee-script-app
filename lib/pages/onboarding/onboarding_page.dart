import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int pageNo = 0;
  final PageController indicatorController = PageController();

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> pageItems = [
      {'background_image': 'assets/backgroundPicture/onboarding_1.png'},
      {'background_image': 'assets/backgroundPicture/onboarding_2.png'},
      {'background_image': 'assets/backgroundPicture/onboarding_3.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: SmoothPageIndicator(controller: indicatorController, count: 3),
        actions: [Text('Skip')],
      ),
      extendBodyBehindAppBar: true,
      body: CarouselSlider(
        options: CarouselOptions(
            animateToClosest: false,
            enableInfiniteScroll: false,
            viewportFraction: 1.0,
            height: screenHeight),
        items: pageItems
            .map((e) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(e['background_image']),
                          fit: BoxFit.contain)),
                ))
            .toList(),
      ),
    );
  }
}
