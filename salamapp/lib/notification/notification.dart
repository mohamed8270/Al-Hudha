import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/theme/colors.dart';

class NotificationSalam extends StatefulWidget {
  const NotificationSalam({Key? key}) : super(key: key);

  @override
  State<NotificationSalam> createState() => _NotificationSalamState();
}

class _NotificationSalamState extends State<NotificationSalam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        backgroundColor: Kblack,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              height: 16,
              width: 16,
              fit: BoxFit.scaleDown,
              color: Kred,
            ),
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Kred,
          ),
        ),
      ),
    );
  }
}
