import 'package:flutter/material.dart';
import 'package:salamapp/theme/colors.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({
    Key? key,
    required this.title,
    required this.time,
  }) : super(key: key);
  final String title;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: KBlack,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: KBlack.withOpacity(0.6),
              ),
            )
          ],
        ),
      ],
    );
  }
}
