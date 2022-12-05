import 'package:amit_flutter/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_text.dart';

class WhatsAppChatsItem extends StatelessWidget {
  const WhatsAppChatsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9.h,
      width: double.infinity,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 3.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                  'assets/avatar.png',
                height: 7.h,
                width: 7.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: DefaultText(
                        text: 'Asem Ammar',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    Flexible(
                      child: DefaultText(
                        text: '12:00 AM',
                        color: textsColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: DefaultText(
                      text: 'Hello all! How are you? I hope you are all fine.',
                      color: textsColor,
                      fontSize: 13.sp,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
