import 'package:flutter/material.dart';
import 'package:salamapp/quran%20all/englishsurahswidgets.dart';
import 'package:salamapp/theme/colors.dart';
import 'package:quran/quran.dart' as quran;

class EnglishVersion extends StatefulWidget {
  const EnglishVersion({Key? key}) : super(key: key);

  @override
  State<EnglishVersion> createState() => _EnglishVersionState();
}

class _EnglishVersionState extends State<EnglishVersion> {
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
                builder: (context) =>
                    EnglishSurahsScreen(EnglishSurah: index + 1),
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
            ),
          ),
        );
      },
    );
  }
}
