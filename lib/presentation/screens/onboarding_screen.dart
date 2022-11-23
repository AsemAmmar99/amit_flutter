import 'package:amit_flutter/data/models/onboarding_model.dart';
import 'package:amit_flutter/presentation/views/onboarding_item.dart';
import 'package:amit_flutter/presentation/widgets/default_text.dart';
import 'package:amit_flutter/presentation/widgets/default_text_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/default_material_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController onBoardingPageController = PageController();

  final List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      image: 'assets/sammy-finance.gif',
      title: 'First Title',
      body: 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
    ),
    OnBoardingModel(
      image: 'assets/sammy-searching.gif',
      title: 'Second Title',
      body: 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
    ),
    OnBoardingModel(
      image: 'assets/sammy-service-support.gif',
      title: 'Third Title',
      body: 'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple[900],
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: CircleAvatar(
              radius: 20.sp,
              backgroundColor: Colors.purple,
              child: DefaultTextButton(
                  onPressed: (){},
                  child: const DefaultText(
                    text: 'Skip',
                    color: Colors.white,
                  ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: DefaultText(
                  text: 'Hello!',
                  fontSize: 30.sp,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Expanded(
                  child: PageView.builder(
                      itemBuilder: (context, index) => OnBoardingItem(model: onBoardingList[index]),
                    itemCount: onBoardingList.length,
                    physics: const BouncingScrollPhysics(),
                    controller: onBoardingPageController,
                    onPageChanged: (index){},
                  ),
                  ),
              Padding(
                  padding: EdgeInsets.only(bottom: 6.h),
                child: SmoothPageIndicator(
                    controller: onBoardingPageController,
                    count: onBoardingList.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.yellow,
                    activeDotColor: Colors.deepOrange,
                    expansionFactor: 4,
                    dotHeight: 2.h,
                    dotWidth: 3.w,
                    spacing: 3.w,
                  ),
                ),
              ),
              DefaultMaterialButton(
                  onPressed: (){},
                  backgroundColor: Colors.transparent,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 6.h,
                  child: const DefaultText(
                    text: 'Get Started',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: DefaultText(
                        text: "Don't have an account?",
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    DefaultTextButton(
                      onPressed: (){},
                      child: DefaultText(
                        text: 'Sign Up!',
                        fontSize: 14.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
