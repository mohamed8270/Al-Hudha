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
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Kred,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Kwhite.withOpacity(0.3),
              ),
            )
          ],
        ),
      ],
    );
  }
}
