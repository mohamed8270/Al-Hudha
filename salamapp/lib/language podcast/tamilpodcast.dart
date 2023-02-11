import 'package:flutter/material.dart';
import 'package:salamapp/theme/colors.dart';

class TamilPodcast extends StatefulWidget {
  const TamilPodcast({Key? key}) : super(key: key);

  @override
  State<TamilPodcast> createState() => _TamilPodcastState();
}

class _TamilPodcastState extends State<TamilPodcast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Zblack.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
