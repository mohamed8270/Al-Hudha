import 'package:flutter/material.dart';
import 'package:salamapp/quran%20data/quran.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:quran/quran.dart' as quran;

class EnglishSurahsScreen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final int EnglishSurah;
  // ignore: non_constant_identifier_names
  const EnglishSurahsScreen({Key? key, required this.EnglishSurah})
      : super(key: key);

  @override
  State<EnglishSurahsScreen> createState() => _EnglishSurahsScreenState();
}

class _EnglishSurahsScreenState extends State<EnglishSurahsScreen> {
  @override
  Widget build(BuildContext context) {
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
          quran.getSurahNameEnglish(widget.EnglishSurah),
          style: TextStyle(
            color: Zblack.withOpacity(0.5),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: ListView.builder(
            itemCount: quran.getVerseCount(widget.EnglishSurah),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  getVerseTranslation(
                    widget.EnglishSurah,
                    index + 1,
                    translation: Translation.enSaheeh,
                  ),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Zblack,
                    fontSize: 16,
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
