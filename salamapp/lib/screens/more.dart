import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/external/benefits.dart';
import 'package:salamapp/external/halalstock.dart';
import 'package:salamapp/external/podcast.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/more/charity.dart';
import 'package:salamapp/more/hadith.dart';
import 'package:salamapp/more/tasbeeh.dart';
import 'package:salamapp/more/zakatcal.dart';
import 'package:salamapp/theme/colors.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  List HadidList = [];

  // ignore: non_constant_identifier_names
  List Podcastlist = [];

  @override
  initState() {
    super.initState();

    _readPodcast();
    _readData();
  }

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/hadid_json/Hadid.json")
        .then((s) {
      setState(() {
        HadidList = json.decode(s);
      });
    });
  }

  // ignore: prefer_typing_uninitialized_variables
  var index;

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
    return Scaffold(
      backgroundColor: Zwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Zwhite,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNav(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Zred,
          ),
        ),
        title: Text(
          'More',
          style: TextStyle(
            fontSize: 20,
            color: Zblack.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ZakatCalc(Controller: TextEditingController()),
                    ),
                  );
                },
                child: const MoreItems(
                  txt: 'Zakat Calculator',
                  icn: 'assets/icons/cal.svg',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TasbeehSalam(),
                    ),
                  );
                },
                child: const MoreItems(
                  txt: 'Tasbeeh',
                  icn: 'assets/icons/tasbih.svg',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HadithSalam(
                        urlPath: HadidList[0]["hadid"],
                      ),
                    ),
                  );
                },
                child: const MoreItems(
                  txt: 'Hadiths',
                  icn: 'assets/icons/hadid.svg',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CharityPage(),
                    ),
                  );
                },
                child: const MoreItems(
                  txt: 'Charity Donation',
                  icn: 'assets/icons/donate.svg',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HalalStocks(),
                    ),
                  );
                },
                child: const MoreItems(
                  txt: 'Halal Stocks',
                  icn: 'assets/icons/graph.svg',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BenefitsScreen(),
                    ),
                  );
                },
                child: const MoreItems(
                  txt: 'Benefits of surah',
                  icn: 'assets/icons/bulb.svg',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PodCast(),
                    ),
                  );
                },
                child: const MoreItems(
                  txt: 'Islamic Podcast',
                  icn: 'assets/icons/podcast.svg',
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: const MoreItems(
                  txt: 'Quiz',
                  icn: 'assets/icons/quiz.svg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreItems extends StatelessWidget {
  const MoreItems({
    Key? key,
    required this.txt,
    required this.icn,
  }) : super(key: key);
  final String txt;
  final String icn;

  @override
  Widget build(BuildContext context) {
    var siZe = MediaQuery.of(context).size;
    return Container(
      height: siZe.height * 0.065,
      width: siZe.width * 0.95,
      decoration: BoxDecoration(
        color: Zgrey,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            SvgPicture.asset(
              icn,
              height: 17,
              width: 17,
              color: Zred,
            ),
            const SizedBox(width: 20),
            Text(
              txt,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Zblack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
