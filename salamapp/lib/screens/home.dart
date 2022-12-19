import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:quran/surah_data.dart';
import 'package:salamapp/external/quranaudio.dart';
import 'package:salamapp/interface/drawer.dart';
import 'package:salamapp/notification/notification.dart';
import 'package:salamapp/quran%20data/surah_data.dart';
import '../theme/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> _allSurah = [
    {"id": 1, "name": "Al Fatiha", "aji": "Ali Al Hudhaifi"},
    {"id": 2, "name": "Al Baqara", "aji": "Ali Al Hudhaifi"},
    {"id": 3, "name": "Al Imran", "aji": "Ali Al Hudhaifi"},
    {"id": 4, "name": "An Nisha", "aji": "Ali Al Hudhaifi"},
    {"id": 5, "name": "Al Maidah", "aji": "Ali Al Hudhaifi"},
    {"id": 6, "name": "Al Anam", "aji": "Ali Al Hudhaifi"},
    {"id": 7, "name": "Al Araf", "aji": "Ali Al Hudhaifi"},
    {"id": 8, "name": "Al Anfal", "aji": "Ali Al Hudhaifi"},
    {"id": 9, "name": "At Tawbah", "aji": "Ali Al Hudhaifi"},
    {"id": 10, "name": "Al Yunus", "aji": "Ali Al Hudhaifi"},
    {"id": 11, "name": "Hud", "aji": "Ali Al Hudhaifi"},
    {"id": 12, "name": "Yusuf", "aji": "Ali Al Hudhaifi"},
    {"id": 13, "name": "Ar Rad", "aji": "Ali Al Hudhaifi"},
    {"id": 14, "name": "Ibrahim", "aji": "Ali Al Hudhaifi"},
    {"id": 15, "name": "Al Hijr", "aji": "Ali Al Hudhaifi"},
    {"id": 16, "name": "An Nahl", "aji": "Ali Al Hudhaifi"},
    {"id": 17, "name": "Al Isra", "aji": "Ali Al Hudhaifi"},
    {"id": 18, "name": "Al Kahf", "aji": "Ali Al Hudhaifi"},
    {"id": 19, "name": "Maryam", "aji": "Ali Al Hudhaifi"},
    {"id": 20, "name": "Ta Ha", "aji": "Ali Al Hudhaifi"},
    {"id": 21, "name": "Al Anbiya", "aji": "Ali Al Hudhaifi"},
    {"id": 22, "name": "Al Haj", "aji": "Ali Al Hudhaifi"},
    {"id": 23, "name": "Al Mu Minun", "aji": "Ali Al Hudhaifi"},
    {"id": 24, "name": "An Nur", "aji": "Ali Al Hudhaifi"},
    {"id": 25, "name": "Al Furqan", "aji": "Ali Al Hudhaifi"},
    {"id": 26, "name": "As Su'ara", "aji": "Ali Al Hudhaifi"},
    {"id": 27, "name": "An Naml", "aji": "Ali Al Hudhaifi"},
    {"id": 28, "name": "Al Qasas", "aji": "Ali Al Hudhaifi"},
    {"id": 29, "name": "Al Ankabut", "aji": "Ali Al Hudhaifi"},
    {"id": 30, "name": "Ar Rum", "aji": "Ali Al Hudhaifi"},
    {"id": 31, "name": "Luqman", "aji": "Ali Al Hudhaifi"},
    {"id": 32, "name": "As Sajdah", "aji": "Ali Al Hudhaifi"},
    {"id": 33, "name": "Al Ahzab", "aji": "Ali Al Hudhaifi"},
    {"id": 34, "name": "Saba'", "aji": "Ali Al Hudhaifi"},
    {"id": 35, "name": "Fatir", "aji": "Ali Al Hudhaifi"},
    {"id": 36, "name": "Yasin", "aji": "Ali Al Hudhaifi"},
    {"id": 37, "name": "As Saffat", "aji": "Ali Al Hudhaifi"},
    {"id": 38, "name": "Saad", "aji": "Ali Al Hudhaifi"},
    {"id": 39, "name": "Az Zumar", "aji": "Ali Al Hudhaifi"},
    {"id": 40, "name": "Ghafir", "aji": "Ali Al Hudhaifi"},
    {"id": 41, "name": "Fussilat", "aji": "Ali Al Hudhaifi"},
    {"id": 42, "name": "As Sura", "aji": "Ali Al Hudhaifi"},
    {"id": 43, "name": "Az Zukhruf", "aji": "Ali Al Hudhaifi"},
    {"id": 44, "name": "Ad Dukhan", "aji": "Ali Al Hudhaifi"},
    {"id": 45, "name": "Al Jathiyah", "aji": "Ali Al Hudhaifi"},
    {"id": 46, "name": "Al Ahqaf", "aji": "Ali Al Hudhaifi"},
    {"id": 47, "name": "Muhammed", "aji": "Ali Al Hudhaifi"},
    {"id": 48, "name": "Al Fath", "aji": "Ali Al Hudhaifi"},
    {"id": 49, "name": "Al Hujrut", "aji": "Ali Al Hudhaifi"},
    {"id": 50, "name": "Qaaf", "aji": "Ali Al Hudhaifi"},
    {"id": 51, "name": "Ad Dariyat", "aji": "Ali Al Hudhaifi"},
    {"id": 52, "name": "At Toor", "aji": "Ali Al Hudhaifi"},
    {"id": 53, "name": "An Najm", "aji": "Ali Al Hudhaifi"},
    {"id": 54, "name": "Al Qamar", "aji": "Ali Al Hudhaifi"},
    {"id": 55, "name": "Ar Rahman", "aji": "Ali Al Hudhaifi"},
    {"id": 56, "name": "Al Waqiah", "aji": "Ali Al Hudhaifi"},
    {"id": 57, "name": "Al Hadeed", "aji": "Ali Al Hudhaifi"},
    {"id": 58, "name": "Al Mujadila", "aji": "Ali Al Hudhaifi"},
    {"id": 59, "name": "Al Hasr", "aji": "Ali Al Hudhaifi"},
    {"id": 60, "name": "Al Mumtahanah", "aji": "Ali Al Hudhaifi"},
    {"id": 61, "name": "As Saff", "aji": "Ali Al Hudhaifi"},
    {"id": 62, "name": "Al Jumuah", "aji": "Ali Al Hudhaifi"},
    {"id": 63, "name": "Al Munafiqoon", "aji": "Ali Al Hudhaifi"},
    {"id": 64, "name": "At Taghabun", "aji": "Ali Al Hudhaifi"},
    {"id": 65, "name": "At Talaq", "aji": "Ali Al Hudhaifi"},
    {"id": 66, "name": "At Tahreem", "aji": "Ali Al Hudhaifi"},
    {"id": 67, "name": "Al Mulk", "aji": "Ali Al Hudhaifi"},
    {"id": 68, "name": "Al Qalam", "aji": "Ali Al Hudhaifi"},
    {"id": 69, "name": "Al Haaqqah", "aji": "Ali Al Hudhaifi"},
    {"id": 70, "name": "Al Maarij", "aji": "Ali Al Hudhaifi"},
    {"id": 71, "name": "Nooh", "aji": "Ali Al Hudhaifi"},
    {"id": 72, "name": "Al Jin", "aji": "Ali Al Hudhaifi"},
    {"id": 73, "name": "Al Muzammil", "aji": "Ali Al Hudhaifi"},
    {"id": 74, "name": "Al Muddathir", "aji": "Ali Al Hudhaifi"},
    {"id": 75, "name": "Al Qiyamah", "aji": "Ali Al Hudhaifi"},
    {"id": 76, "name": "Al Insaan", "aji": "Ali Al Hudhaifi"},
    {"id": 77, "name": "Al Mursalat", "aji": "Ali Al Hudhaifi"},
    {"id": 78, "name": "An Naba", "aji": "Ali Al Hudhaifi"},
    {"id": 79, "name": "An Naaziat", "aji": "Ali Al Hudhaifi"},
    {"id": 80, "name": "Abasa", "aji": "Ali Al Hudhaifi"},
    {"id": 81, "name": "At Takweer", "aji": "Ali Al Hudhaifi"},
    {"id": 82, "name": "Al Infitar", "aji": "Ali Al Hudhaifi"},
    {"id": 83, "name": "Al Mutaffifin", "aji": "Ali Al Hudhaifi"},
    {"id": 84, "name": "Al Inshiqaaq", "aji": "Ali Al Hudhaifi"},
    {"id": 85, "name": "Al Burooj", "aji": "Ali Al Hudhaifi"},
    {"id": 86, "name": "At Taarik", "aji": "Ali Al Hudhaifi"},
    {"id": 87, "name": "Al A'laa", "aji": "Ali Al Hudhaifi"},
    {"id": 88, "name": "Al Ghaashiyah", "aji": "Ali Al Hudhaifi"},
    {"id": 89, "name": "Al Fajr", "aji": "Ali Al Hudhaifi"},
    {"id": 90, "name": "Al Balad", "aji": "Ali Al Hudhaifi"},
    {"id": 91, "name": "Ash Shams", "aji": "Ali Al Hudhaifi"},
    {"id": 92, "name": "Al Layl", "aji": "Ali Al Hudhaifi"},
    {"id": 93, "name": "Ad Dhuha", "aji": "Ali Al Hudhaifi"},
    {"id": 94, "name": "Ash Sharh", "aji": "Ali Al Hudhaifi"},
    {"id": 95, "name": "At Teen", "aji": "Ali Al Hudhaifi"},
    {"id": 96, "name": "Al Alaq", "aji": "Ali Al Hudhaifi"},
    {"id": 97, "name": "Al Qadr", "aji": "Ali Al Hudhaifi"},
    {"id": 98, "name": "Al Bayyinah", "aji": "Ali Al Hudhaifi"},
    {"id": 99, "name": "Al Zalzalah", "aji": "Ali Al Hudhaifi"},
    {"id": 100, "name": "Al Aadiyaat", "aji": "Ali Al Hudhaifi"},
    {"id": 101, "name": "Al Qaariah", "aji": "Ali Al Hudhaifi"},
    {"id": 102, "name": "At Takaathur", "aji": "Ali Al Hudhaifi"},
    {"id": 103, "name": "Al Asr", "aji": "Ali Al Hudhaifi"},
    {"id": 104, "name": "Al Humazah", "aji": "Ali Al Hudhaifi"},
    {"id": 105, "name": "Al Feel", "aji": "Ali Al Hudhaifi"},
    {"id": 106, "name": "Quraysh", "aji": "Ali Al Hudhaifi"},
    {"id": 107, "name": "Al Maa'oon", "aji": "Ali Al Hudhaifi"},
    {"id": 108, "name": "Al Kawthar", "aji": "Ali Al Hudhaifi"},
    {"id": 109, "name": "Al Kaafiroon", "aji": "Ali Al Hudhaifi"},
    {"id": 110, "name": "An Nasr", "aji": "Ali Al Hudhaifi"},
    {"id": 111, "name": "Al Masad", "aji": "Ali Al Hudhaifi"},
    {"id": 112, "name": "Al Iklas", "aji": "Ali Al Hudhaifi"},
    {"id": 113, "name": "Al Falaq", "aji": "Ali Al Hudhaifi"},
    {"id": 114, "name": "An Naas", "aji": "Ali Al Hudhaifi"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundSurah = [];

  var index;
  @override
  initState() {
    _foundSurah = _allSurah;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allSurah;
    } else {
      results = _allSurah
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      _foundSurah = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    if (timeNow <= 9) {
      message = 'Did you complete fajr';
    } else if ((timeNow > 9) && (timeNow <= 12)) {
      message = 'Get ready for zuhr';
    } else if ((timeNow > 12) && (timeNow <= 15)) {
      message = 'Time for zuhr';
    } else if ((timeNow > 15) && (timeNow < 18)) {
      message = 'Time for asr';
    } else if ((timeNow >= 18) && (timeNow < 19)) {
      message = 'Time for maghrib';
    } else if ((timeNow > 19) && (timeNow <= 6)) {
      message = 'Time for Isha, Thahajjath, Fajr';
    } else {
      message = "It's time for thahajjath";
    }

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.devicePixelRatio;
    queryData.size.width;
    queryData.size.height;
    return Scaffold(
      drawer: DrawerSalam(),
      backgroundColor: Kblack,
      appBar: AppBar(
        backgroundColor: Kblack,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                height: 20,
                width: 20,
                color: Kred,
              ),
            );
          },
        ),
        title: Text(
          'Al Hudha',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Kwhite,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationSalam()),
              );
            },
            icon: SvgPicture.asset(
              'assets/icons/notificationout.svg',
              height: 20,
              width: 20,
              color: Kred,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Asalamu Alaikum',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Kwhite,
                      ),
                    ),
                    TextSpan(
                      text: '\nMohamed ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Kred,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 100,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Kwhite.withOpacity(0.03),
                  image: DecorationImage(
                    image: AssetImage('assets/images/quran2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 0.5),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Kred, width: 2),
                          ),
                        ),
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Kblack,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "O you who believe! Seek help in patience \nand As-Salat (the prayer). Truly! Allah \nis with As-Sabirin the patient ones",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Kblack.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  color: Kwhite.withOpacity(0.02),
                  border: Border.all(color: Kwhite.withOpacity(0.02)),
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: Alignment.center,
                child: Center(
                  child: TextFormField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          height: 12,
                          width: 12,
                          color: Kred,
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Kwhite.withOpacity(0.3),
                      ),
                      focusedBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _foundSurah.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _foundSurah.length,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, i) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuranAudio(
                                surahnumber: i + 1,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          key: ValueKey(_foundSurah[i]["id"]),
                          height: 80,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Kwhite.withOpacity(0.02),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                leading: Text(
                                  _foundSurah[i]["id"].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Kred.withOpacity(0.6),
                                  ),
                                ),
                                title: Text(
                                  _foundSurah[i]['name'],
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Kred,
                                  ),
                                ),
                                subtitle: Text(
                                  _foundSurah[i]['aji'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Kwhite.withOpacity(0.3),
                                  ),
                                ),
                                trailing: SvgPicture.asset(
                                  'assets/icons/music.svg',
                                  height: 18,
                                  width: 18,
                                  fit: BoxFit.cover,
                                  color: Kwhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
