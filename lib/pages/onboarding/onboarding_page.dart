import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_script_app/helper/constant/color_pallete.dart';
import 'package:coffee_script_app/helper/constant/method.dart';
import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:coffee_script_app/pages/onboarding/onboarding_layout.dart';
import 'package:coffee_script_app/pages/onboarding/widgets.dart';
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
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> pageItems = [
      {
        'background_image': 'assets/backgroundPicture/onboarding_1.png',
        'title': 'Embrace coffee essence',
        'description':
            'Lorem ipsum dolor sit amet consectetur. Vestibulum eget blandit mattis ',
      },
      {
        'background_image': 'assets/backgroundPicture/onboarding_2.png',
        'title': 'Flavorful bean journey',
        'description':
            'Lorem ipsum dolor sit amet consectetur. Vestibulum eget blandit mattis ',
      },
      {
        'background_image': 'assets/backgroundPicture/onboarding_3.png',
        'title': 'Unlock bean secrets',
        'description':
            'Lorem ipsum dolor sit amet consectetur. Vestibulum eget blandit mattis ',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        leading: Padding(
          padding: EdgeInsets.all(height24 / 2),
          child: SmoothPageIndicator(
              controller: indicatorController,
              count: pageItems.length,
              effect: ExpandingDotsEffect(
                activeDotColor: primaryColor,
                dotColor: const Color(0xFFd9d9d9),
                spacing: width08 / 2,
                dotHeight: height10 * 0.3,
                dotWidth: width10 * 1.2,
                expansionFactor: 2,
              )),
        ),
        actions: [
          if (determineIsLast(pageNo, pageItems))
            skipButton(() {
              setState(() {
                indicatorController.animateToPage(pageItems.length - 1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
                pageNo = pageItems.length - 1;
              });
            })
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: PageView.builder(
        itemCount: pageItems.length,
        allowImplicitScrolling: true,
        controller: indicatorController,
        // carouselController: carouselController,
        // options: CarouselOptions(
        //   animateToClosest: false,
        //   enableInfiniteScroll: false,
        //   viewportFraction: 1.0,
        //   height: screenHeight,
        //   onPageChanged: (index, reason) {
        //     indicatorController.attach(carouselController.);
        //     indicatorController.animateTo(index.toDouble(),
        //         duration: Duration(microseconds: 200), curve: Curves.linear);
        //   },
        // ),
        // items: pageItems
        //     .map((item) => OnboardingLayout(
        //         backgroundImage: item['background_image'],
        //         title: item['title'],
        //         description: item['description'],
        //         pageNo: pageNo))
        //     .toList(),
        itemBuilder: (context, index) {
          final item = pageItems[index];
          return OnboardingLayout(
              backgroundImage: item['background_image'],
              title: item['title'],
              description: item['description'],
              pageNo: pageNo);
        },
        onPageChanged: (index) {
          setState(() {
            pageNo = index;
          });
        },
      ),
    );
  }
}
