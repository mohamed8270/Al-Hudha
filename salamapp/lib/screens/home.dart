import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:quran/surah_data.dart';
import 'package:salamapp/external/quranaudio.dart';
import 'package:salamapp/interface/drawer.dart';
import 'package:salamapp/notification/notification.dart';
// ignore: unused_import
import 'package:salamapp/quran%20data/surah_data.dart';
import '../theme/colors.dart';
// ignore: unused_import
import 'package:quran/quran.dart' as quran;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _allSurah = [
    {"id": 1, "name": "Al Fatiha", "aji": "Makki"},
    {"id": 2, "name": "Al Baqara", "aji": "Madni"},
    {"id": 3, "name": "Al Imran", "aji": "Madni"},
    {"id": 4, "name": "An Nisha", "aji": "Madni"},
    {"id": 5, "name": "Al Maidah", "aji": "Madni"},
    {"id": 6, "name": "Al Anam", "aji": "Makki"},
    {"id": 7, "name": "Al Araf", "aji": "Makki"},
    {"id": 8, "name": "Al Anfal", "aji": "Madni"},
    {"id": 9, "name": "At Tawbah", "aji": "Madni"},
    {"id": 10, "name": "Al Yunus", "aji": "Makki"},
    {"id": 11, "name": "Hud", "aji": "Makki"},
    {"id": 12, "name": "Yusuf", "aji": "Makki"},
    {"id": 13, "name": "Ar Rad", "aji": "Madni"},
    {"id": 14, "name": "Ibrahim", "aji": "Makki"},
    {"id": 15, "name": "Al Hijr", "aji": "Makki"},
    {"id": 16, "name": "An Nahl", "aji": "Makki"},
    {"id": 17, "name": "Al Isra", "aji": "Makki"},
    {"id": 18, "name": "Al Kahf", "aji": "Makki"},
    {"id": 19, "name": "Maryam", "aji": "Makki"},
    {"id": 20, "name": "Ta Ha", "aji": "Makki"},
    {"id": 21, "name": "Al Anbiya", "aji": "Makki"},
    {"id": 22, "name": "Al Haj", "aji": "Madni"},
    {"id": 23, "name": "Al Mu Minun", "aji": "Makki"},
    {"id": 24, "name": "An Nur", "aji": "Madni"},
    {"id": 25, "name": "Al Furqan", "aji": "Makki"},
    {"id": 26, "name": "As Su'ara", "aji": "Makki"},
    {"id": 27, "name": "An Naml", "aji": "Makki"},
    {"id": 28, "name": "Al Qasas", "aji": "Makki"},
    {"id": 29, "name": "Al Ankabut", "aji": "Makki"},
    {"id": 30, "name": "Ar Rum", "aji": "Makkii"},
    {"id": 31, "name": "Luqman", "aji": "Makki"},
    {"id": 32, "name": "As Sajdah", "aji": "Makki"},
    {"id": 33, "name": "Al Ahzab", "aji": "Madni"},
    {"id": 34, "name": "Saba'", "aji": "Makki"},
    {"id": 35, "name": "Fatir", "aji": "Makki"},
    {"id": 36, "name": "Yasin", "aji": "Makki"},
    {"id": 37, "name": "As Saffat", "aji": "Makki"},
    {"id": 38, "name": "Saad", "aji": "Makki"},
    {"id": 39, "name": "Az Zumar", "aji": "Makki"},
    {"id": 40, "name": "Ghafir", "aji": "Makki"},
    {"id": 41, "name": "Fussilat", "aji": "Makki"},
    {"id": 42, "name": "As Sura", "aji": "Makki"},
    {"id": 43, "name": "Az Zukhruf", "aji": "Makki"},
    {"id": 44, "name": "Ad Dukhan", "aji": "Makki"},
    {"id": 45, "name": "Al Jathiyah", "aji": "Makki"},
    {"id": 46, "name": "Al Ahqaf", "aji": "Makki"},
    {"id": 47, "name": "Muhammed", "aji": "Madni"},
    {"id": 48, "name": "Al Fath", "aji": "Madni"},
    {"id": 49, "name": "Al Hujrut", "aji": "Madni"},
    {"id": 50, "name": "Qaaf", "aji": "Makki"},
    {"id": 51, "name": "Ad Dariyat", "aji": "Makki"},
    {"id": 52, "name": "At Toor", "aji": "Makki"},
    {"id": 53, "name": "An Najm", "aji": "Makki"},
    {"id": 54, "name": "Al Qamar", "aji": "Makki"},
    {"id": 55, "name": "Ar Rahman", "aji": "Madni"},
    {"id": 56, "name": "Al Waqiah", "aji": "Madni"},
    {"id": 57, "name": "Al Hadeed", "aji": "Madni"},
    {"id": 58, "name": "Al Mujadila", "aji": "Madni"},
    {"id": 59, "name": "Al Hasr", "aji": "Madni"},
    {"id": 60, "name": "Al Mumtahanah", "aji": "Madni"},
    {"id": 61, "name": "As Saff", "aji": "Madni"},
    {"id": 62, "name": "Al Jumuah", "aji": "Madni"},
    {"id": 63, "name": "Al Munafiqoon", "aji": "Madni"},
    {"id": 64, "name": "At Taghabun", "aji": "Madni"},
    {"id": 65, "name": "At Talaq", "aji": "Madni"},
    {"id": 66, "name": "At Tahreem", "aji": "Madni"},
    {"id": 67, "name": "Al Mulk", "aji": "Makki"},
    {"id": 68, "name": "Al Qalam", "aji": "Makki"},
    {"id": 69, "name": "Al Haaqqah", "aji": "Makki"},
    {"id": 70, "name": "Al Maarij", "aji": "Makki"},
    {"id": 71, "name": "Nooh", "aji": "Makki"},
    {"id": 72, "name": "Al Jin", "aji": "Makki"},
    {"id": 73, "name": "Al Muzammil", "aji": "Makki"},
    {"id": 74, "name": "Al Muddathir", "aji": "Makki"},
    {"id": 75, "name": "Al Qiyamah", "aji": "Makki"},
    {"id": 76, "name": "Al Insaan", "aji": "Madni"},
    {"id": 77, "name": "Al Mursalat", "aji": "Makki"},
    {"id": 78, "name": "An Naba", "aji": "Makki"},
    {"id": 79, "name": "An Naaziat", "aji": "Makki"},
    {"id": 80, "name": "Abasa", "aji": "Makki"},
    {"id": 81, "name": "At Takweer", "aji": "Makki"},
    {"id": 82, "name": "Al Infitar", "aji": "Makki"},
    {"id": 83, "name": "Al Mutaffifin", "aji": "Makki"},
    {"id": 84, "name": "Al Inshiqaaq", "aji": "Makki"},
    {"id": 85, "name": "Al Burooj", "aji": "Makki"},
    {"id": 86, "name": "At Taarik", "aji": "Makki"},
    {"id": 87, "name": "Al A'laa", "aji": "Makki"},
    {"id": 88, "name": "Al Ghaashiyah", "aji": "Makki"},
    {"id": 89, "name": "Al Fajr", "aji": "Makki"},
    {"id": 90, "name": "Al Balad", "aji": "Makki"},
    {"id": 91, "name": "Ash Shams", "aji": "Makki"},
    {"id": 92, "name": "Al Layl", "aji": "Makki"},
    {"id": 93, "name": "Ad Dhuha", "aji": "Makki"},
    {"id": 94, "name": "Ash Sharh", "aji": "Makki"},
    {"id": 95, "name": "At Teen", "aji": "Makki"},
    {"id": 96, "name": "Al Alaq", "aji": "Makki"},
    {"id": 97, "name": "Al Qadr", "aji": "Makki"},
    {"id": 98, "name": "Al Bayyinah", "aji": "Madni"},
    {"id": 99, "name": "Al Zalzalah", "aji": "Madni"},
    {"id": 100, "name": "Al Aadiyaat", "aji": "Makki"},
    {"id": 101, "name": "Al Qaariah", "aji": "Makki"},
    {"id": 102, "name": "At Takaathur", "aji": "Makki"},
    {"id": 103, "name": "Al Asr", "aji": "Makki"},
    {"id": 104, "name": "Al Humazah", "aji": "Makki"},
    {"id": 105, "name": "Al Feel", "aji": "Makki"},
    {"id": 106, "name": "Quraysh", "aji": "Makki"},
    {"id": 107, "name": "Al Maa'oon", "aji": "Makki"},
    {"id": 108, "name": "Al Kawthar", "aji": "Makki"},
    {"id": 109, "name": "Al Kaafiroon", "aji": "Makki"},
    {"id": 110, "name": "An Nasr", "aji": "Madni"},
    {"id": 111, "name": "Al Masad", "aji": "Makki"},
    {"id": 112, "name": "Al Iklas", "aji": "Makki"},
    {"id": 113, "name": "Al Falaq", "aji": "Makki"},
    {"id": 114, "name": "An Naas", "aji": "Makki"},
  ];

  List audioList = [];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundSurah = [];

  // ignore: prefer_typing_uninitialized_variables
  var index;
  @override
  initState() {
    _foundSurah = _allSurah;
    super.initState();

    _readData();
  }

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/audio_json/audiosalam.json")
        .then((s) {
      setState(() {
        audioList = json.decode(s);
      });
    });
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

    var siZe = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const DrawerSalam(),
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
        title: const Text(
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
                MaterialPageRoute(
                    builder: (context) => const NotificationSalam()),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Asalamu Alaikum\n',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Kwhite,
                      ),
                    ),
                    TextSpan(
                      text: FirebaseAuth.instance.currentUser!.displayName!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Kred,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: siZe.height * 0.14,
                width: siZe.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Kwhite.withOpacity(0.03),
                  image: const DecorationImage(
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
                        padding: const EdgeInsets.only(bottom: 0.5),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Kred, width: 2),
                          ),
                        ),
                        child: Text(
                          message,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Kblack,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
              const SizedBox(height: 20),
              Container(
                height: siZe.height * 0.07,
                width: siZe.width * 0.95,
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
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _foundSurah.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _foundSurah.length,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, i) => InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuranAudio(
                                surahnumber: i + 1,
                                audioPaths: audioList[i + 0]["audio"],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          key: ValueKey(_foundSurah[i]["id"]),
                          height: siZe.height * 0.11,
                          width: siZe.width * 0.95,
                          decoration: BoxDecoration(
                            color: Kwhite.withOpacity(0.02),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 5),
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
                                  style: const TextStyle(
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
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Kred,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
