import 'package:amit_flutter/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../views/whatsapp_chats_item.dart';

class WhatsAppChatsScreen extends StatefulWidget {
  const WhatsAppChatsScreen({Key? key}) : super(key: key);

  @override
  State<WhatsAppChatsScreen> createState() => _WhatsAppChatsScreenState();
}

class _WhatsAppChatsScreenState extends State<WhatsAppChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: ListView.separated(
          itemBuilder: (context, index) => const WhatsAppChatsItem(),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) =>
        Row(
          children: [
            Expanded(child: Divider(height: 2.h, color: backgroundColor,))
          ],
        ),
      ),
    );
  }
}
