import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/external/englishpodcast.dart';
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
    TabController tabcontroller = TabController(length: 4, vsync: this);
    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kblack,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              height: 18,
              width: 18,
              color: Kred,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          'Podcast',
          style: TextStyle(
            fontSize: 20,
            color: Kwhite.withOpacity(0.3),
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: TabBar(
          labelPadding: const EdgeInsets.symmetric(horizontal: 30),
          labelColor: Kwhite,
          unselectedLabelColor: Kwhite.withOpacity(0.5),
          controller: tabcontroller,
          indicatorColor: Kred,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
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
            Tab(
              text: "Urdu",
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: TabBarView(
          controller: tabcontroller,
          children: [
            EnglishPodcast(Podcastlist: Podcastlist, siZe: siZe),
            const Text("is"),
            const Text("here"),
            const Text("now"),
          ],
        ),
      ),
    );
  }
}
