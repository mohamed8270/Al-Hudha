import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/quran.dart' as quran;
import 'package:salamapp/theme/colors.dart';

class SurahSalam extends StatefulWidget {
  final int surahnumber;
  const SurahSalam({Key? key, required this.surahnumber}) : super(key: key);

  @override
  State<SurahSalam> createState() => _SurahSalamState();
}

class _SurahSalamState extends State<SurahSalam> {
  @override
  Widget build(BuildContext context) {
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
              color: Kred,
            ),
          ),
        ),
        title: Text(
          quran.getSurahName(widget.surahnumber),
          style: TextStyle(
            color: Kwhite.withOpacity(0.3),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: SizedBox(
              width: 150,
              child: Text(
                quran.basmala,
                style: TextStyle(fontSize: 18, color: Kred),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: ListView.builder(
            itemCount: quran.getVerseCount(widget.surahnumber),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  quran.getVerse(widget.surahnumber, index + 1,
                      verseEndSymbol: true),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Kwhite,
                    fontSize: 20,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
