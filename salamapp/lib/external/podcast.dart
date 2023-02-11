import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:salamapp/external/englishpodcast.dart';
import 'package:salamapp/language%20podcast/arabicpodcast.dart';
import 'package:salamapp/language%20podcast/tamilpodcast.dart';
import 'package:salamapp/theme/colors.dart';

class PodCast extends StatefulWidget {
  const PodCast({
    Key? key,
  }) : super(key: key);

  @override
  State<PodCast> createState() => _PodCastState();
}

class _PodCastState extends State<PodCast> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    _readPodcast();
  }

  Future setAudio() async {}

  // ignore: non_constant_identifier_names
  List Podcastlist = [];

  _readPodcast() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/podcast_json/Podcast.json")
        .then((s) {
      setState(() {
        Podcastlist = json.decode(s);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var siZe = MediaQuery.of(context).size;
    TabController tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Zwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Zwhite,
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
          'Podcast',
          style: TextStyle(
            fontSize: 20,
            color: Zblack.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: TabBar(
          labelPadding: const EdgeInsets.symmetric(horizontal: 30),
          labelColor: Zred,
          unselectedLabelColor: Zblack.withOpacity(0.3),
          controller: tabcontroller,
          indicatorColor: Zred,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            letterSpacing: 0.8,
          ),
          tabs: const [
            Tab(
              text: "English",
            ),
            Tab(
              text: "Arabic",
            ),
            Tab(
              text: "Tamil",
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: TabBarView(
          controller: tabcontroller,
          children: [
            EnglishPodcast(Podcastlist: Podcastlist, siZe: siZe),
            const ArabicPodcast(),
            const TamilPodcast(),
          ],
        ),
      ),
    );
  }
}
