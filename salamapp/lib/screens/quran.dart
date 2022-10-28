import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: KLWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: KPurewhite,
        leading: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              color: KBlack,
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
            fontWeight: FontWeight.w800,
            color: KBlack,
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
                  ),
                ),
              );
            }),
      ),
    );
  }
}
