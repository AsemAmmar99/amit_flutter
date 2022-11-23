import 'package:amit_flutter/data/models/onboarding_model.dart';
import 'package:amit_flutter/presentation/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingItem extends StatelessWidget {

  OnBoardingModel model;

  OnBoardingItem({
    Key? key,
    required this.model
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
            child: Image.asset(
                model.image,
              fit: BoxFit.contain,
            ),
        ),
        Flexible(
            child: Padding(
              padding: EdgeInsets.only(bottom: 3.h, top: 2.h),
              child: DefaultText(
                text: model.title,
                maxLines: 2,
                textAlign: TextAlign.start,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: DefaultText(
              text: model.body,
              maxLines: 4,
              textAlign: TextAlign.start,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
