import 'package:flutter/material.dart';
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
      backgroundColor: Zwhite,
      appBar: AppBar(
        backgroundColor: Zwhite,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Zred,
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Zblack.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
