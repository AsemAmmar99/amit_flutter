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

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController _controller;
  late final Animation<double> _animation;
  //late final Animation<Offset> _animation;

  @override
  void initState() {

    // _controller = AnimationController(
    //   duration: const Duration(milliseconds: 1000),
    //   animationBehavior: AnimationBehavior.preserve,
    //   value: 1,
    //   vsync: this,
    // )..repeat(reverse: true);
    //
    // _animation = Tween<Offset>(
    //   begin: Offset.zero,
    //   end: const Offset(0.0, -1.0),
    // ).animate(
    //   CurvedAnimation(
    //       parent: _controller,
    //       curve: Curves.ease),
    // );

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
    );


    Timer(
        const Duration(
            milliseconds: 5000
        ),
            () {
          Navigator.pushNamedAndRemoveUntil(
              context,
              MyCache.getBoolean(key: MyCacheKeys.isOnBoardingViewed)
              ? screens.loginScreen
              : screens.onBoardingScreen,
              // screens.animationScreen,
              (route) => false);
            });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Future.delayed(
    //     const Duration(milliseconds: 1200),
    //     (){
    //       _controller.stop(canceled: true,);
    //     }
    // );

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
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
      ),
    );
  }
}
