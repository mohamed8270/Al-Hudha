import 'package:flutter/material.dart';
import 'package:salamapp/theme/colors.dart';

class ArabicPodcast extends StatefulWidget {
  const ArabicPodcast({Key? key}) : super(key: key);

  @override
  State<ArabicPodcast> createState() => _ArabicPodcastState();
}

class _ArabicPodcastState extends State<ArabicPodcast> {
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
