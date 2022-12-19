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
              MaterialPageRoute(builder: (context) => BottomNav()),
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
        padding: EdgeInsets.all(15.0),
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
              child: ListTile(
                title: Text(
                  quran.getSurahName(index + 1),
                  style: TextStyle(
                    fontSize: 18,
                    color: Kwhite,
                  ),
                ),
                trailing: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.bookmark_outline_rounded,
                    color: Kred.withOpacity(0.5),
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
