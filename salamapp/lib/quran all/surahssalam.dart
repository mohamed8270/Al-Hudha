import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:salamapp/theme/colors.dart';

import '../quran data/quran.dart';

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
          quran.getSurahName(widget.surahnumber),
          style: TextStyle(
            color: Zblack.withOpacity(0.5),
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
                style: TextStyle(
                  fontSize: 18,
                  color: Zred,
                ),
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
                    color: Zblack,
                    fontSize: 20,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 5),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: double.infinity,
                      maxWidth: double.infinity,
                    ),
                    decoration: BoxDecoration(
                      color: Zgrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getVerseTranslation(
                              widget.surahnumber,
                              index + 1,
                              translation: Translation.enSaheeh,
                            ),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Zblack.withOpacity(0.5),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Juz",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Zblack.withOpacity(0.3),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                quran
                                    .getJuzNumber(widget.surahnumber, index + 1)
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Zred,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                  color: Zblack.withOpacity(0.1),
                                  thickness: 1.5,
                                ),
                              ),
                              Text(
                                "Verses",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Zblack.withOpacity(0.3),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                quran
                                    .getVerseCount(widget.surahnumber)
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Zred,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                  color: Zblack.withOpacity(0.1),
                                  thickness: 1.5,
                                ),
                              ),
                              Text(
                                "Total Juz",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Zblack.withOpacity(0.3),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                quran.totalJuzCount.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Zred,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                  color: Zblack.withOpacity(0.1),
                                  thickness: 1.5,
                                ),
                              ),
                              Text(
                                quran.getPlaceOfRevelation(widget.surahnumber),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Zred,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
