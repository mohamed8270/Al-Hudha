import 'package:flutter/material.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/quran%20all/englishsurahs.dart';
import 'package:salamapp/quran%20all/surahssalam.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:quran/quran.dart' as quran;

class Quran extends StatefulWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabcontroller = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: Zwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Zwhite,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BottomNav()),
            );
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Zred,
          ),
        ),
        title: Text(
          'Quran Recitation',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Zblack.withOpacity(0.5),
          ),
        ),
        bottom: TabBar(
          labelPadding: const EdgeInsets.symmetric(horizontal: 50),
          labelColor: Zred,
          unselectedLabelColor: Zblack.withOpacity(0.3),
          controller: tabcontroller,
          indicatorColor: Zred,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins,'),
          tabs: const [
            Tab(
              text: "Arabic",
            ),
            Tab(
              text: "English",
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: TabBarView(
          controller: tabcontroller,
          children: const [
            // ignore: prefer_const_constructors
            QuranWidget(),
            EnglishVersion(),
          ],
        ),
      ),
    );
  }
}

class QuranWidget extends StatelessWidget {
  const QuranWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 114,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SurahSalam(
                  surahnumber: index + 1,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quran.getSurahName(index + 1),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Zblack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    quran.getSurahNameEnglish(index + 1),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Zblack.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                quran.getSurahNameArabic(index + 1),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Zred,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
