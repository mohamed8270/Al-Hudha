import 'package:flutter/material.dart';
import 'package:salamapp/theme/colors.dart';

class TabControlSalam extends StatelessWidget {
  const TabControlSalam({
    Key? key,
    required this.txt,
  }) : super(key: key);
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      constraints: BoxConstraints(maxWidth: double.infinity),
      decoration: BoxDecoration(
        color: KPrimaryblue,
        borderRadius: BorderRadius.circular(40),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: KPurewhite,
          ),
        ),
      ),
    );
  }
}
