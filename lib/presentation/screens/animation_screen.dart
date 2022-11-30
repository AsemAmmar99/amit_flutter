import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 5000),
            tween: ColorTween(begin: darkPurple, end: lightSkyBlue),
            builder: (context, Color? value, child) =>
                Expanded(
                  child: Container(
                    color: value,
                  ),
                ),
          ),
          // TweenAnimationBuilder(
          //   duration: const Duration(milliseconds: 4000),
          //   tween: Tween<double>(begin: 0, end: 100.w),
          //   builder: (context, double? value, child) =>
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           color: lightBrown,
          //           width: value,
          //         ),
          //       ),
          // ),
          // TweenAnimationBuilder(
          //   duration: const Duration(milliseconds: 5000),
          //   tween: Tween<double>(begin: 0, end: 100.w),
          //   builder: (context, double? value, child) =>
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           color: darkSkyBlue,
          //           width: value,
          //         ),
          //       ),
          // ),
        ],
      ),
    );
  }
}
