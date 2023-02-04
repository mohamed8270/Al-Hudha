import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/quran%20all/surahssalam.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:quran/quran.dart' as quran;

class Quran extends StatefulWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Kblack,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BottomNav()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Kred,
              height: 18,
              width: 18,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          'Quran Recitation',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Kwhite.withOpacity(0.3),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: ListView.builder(
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
                          color: Kwhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        quran.getSurahNameEnglish(index + 1),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Kwhite.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(
                    quran.getSurahNameArabic(index + 1),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Kred,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
