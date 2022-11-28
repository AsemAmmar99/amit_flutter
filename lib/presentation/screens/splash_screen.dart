import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:amit_flutter/constants/screens.dart' as screens;
import '../../constants/my_cache_keys.dart';
import '../../data/local/my_cache.dart';
import '../widgets/default_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
        const Duration(
            milliseconds: 4000),
            () {
          Navigator.pushNamedAndRemoveUntil(
              context,
              MyCache.getBoolean(key: MyCacheKeys.isOnBoardingViewed)
              ? screens.loginScreen
              : screens.onBoardingScreen, (route) => false);
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/handy-line-launch-rocket.png',
              width: 70.w,
              height: 30.h,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: DefaultText(
                text: 'Welcome!',
                fontSize: 45.sp,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.tealAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
